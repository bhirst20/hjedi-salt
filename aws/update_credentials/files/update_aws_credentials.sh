#!/bin/bash

set -e

CREDENTIALS_FILE="${HOME}/.aws/credentials"
SECRET_NAME="brians_secrets"
REGION="us-east-2"
PROFILE="default"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

get_secret() {
    aws secretsmanager get-secret-value \
        --secret-id "$SECRET_NAME" \
        --region "$REGION" \
        --query 'SecretString' \
        --output text 2>/dev/null
}

get_current_credentials() {
    local key="$1"
    if [[ -f "$CREDENTIALS_FILE" ]]; then
        grep -A 20 "^\[${PROFILE}\]" "$CREDENTIALS_FILE" 2>/dev/null | \
            grep "^${key}" | \
            head -1 | \
            sed 's/.*=\s*//' | \
            tr -d '[:space:]'
    fi
}

update_credentials_file() {
    local access_key="$1"
    local secret_key="$2"

    mkdir -p "$(dirname "$CREDENTIALS_FILE")"

    if [[ ! -f "$CREDENTIALS_FILE" ]]; then
        cat > "$CREDENTIALS_FILE" << EOF
[${PROFILE}]
aws_access_key_id = ${access_key}
aws_secret_access_key = ${secret_key}
EOF
        chmod 600 "$CREDENTIALS_FILE"
        log "Created new credentials file"
        return
    fi

    local temp_file
    temp_file=$(mktemp)

    if grep -q "^\[${PROFILE}\]" "$CREDENTIALS_FILE"; then
        awk -v profile="[${PROFILE}]" -v access="$access_key" -v secret="$secret_key" '
            BEGIN { in_profile = 0 }
            /^\[/ {
                if (in_profile) {
                    in_profile = 0
                }
                if ($0 == profile) {
                    in_profile = 1
                    print
                    next
                }
            }
            in_profile && /^aws_access_key_id/ {
                print "aws_access_key_id = " access
                next
            }
            in_profile && /^aws_secret_access_key/ {
                print "aws_secret_access_key = " secret
                next
            }
            { print }
        ' "$CREDENTIALS_FILE" > "$temp_file"
    else
        cp "$CREDENTIALS_FILE" "$temp_file"
        cat >> "$temp_file" << EOF

[${PROFILE}]
aws_access_key_id = ${access_key}
aws_secret_access_key = ${secret_key}
EOF
    fi

    mv "$temp_file" "$CREDENTIALS_FILE"
    chmod 600 "$CREDENTIALS_FILE"
    log "Updated credentials file"
}

main() {
    log "Starting AWS credentials update check"

    if ! command -v jq &> /dev/null; then
        log "ERROR: jq is required but not installed"
        exit 1
    fi

    if ! command -v aws &> /dev/null; then
        log "ERROR: aws cli is required but not installed"
        exit 1
    fi

    log "Fetching secret from AWS Secrets Manager"
    secret_json=$(get_secret)

    if [[ -z "$secret_json" ]]; then
        log "ERROR: Failed to retrieve secret from Secrets Manager"
        exit 1
    fi

    new_access_key=$(echo "$secret_json" | jq -r '.aws_automated_services_access_id')
    new_secret_key=$(echo "$secret_json" | jq -r '.aws_automated_services_secret_id')

    if [[ -z "$new_access_key" || "$new_access_key" == "null" ]]; then
        log "ERROR: aws_automated_services_access_id not found in secret"
        exit 1
    fi

    if [[ -z "$new_secret_key" || "$new_secret_key" == "null" ]]; then
        log "ERROR: aws_automated_services_secret_id not found in secret"
        exit 1
    fi

    current_access_key=$(get_current_credentials "aws_access_key_id")
    current_secret_key=$(get_current_credentials "aws_secret_access_key")

    if [[ "$new_access_key" == "$current_access_key" && "$new_secret_key" == "$current_secret_key" ]]; then
        log "Credentials are up to date, no changes needed"
        exit 0
    fi

    log "Credentials have changed, updating..."
    update_credentials_file "$new_access_key" "$new_secret_key"

    log "Verifying new credentials work..."
    if verify_json=$(get_secret); then
        if [[ -n "$verify_json" ]]; then
            log "Verification successful - new credentials are working"
        else
            log "WARNING: Verification returned empty response"
            exit 1
        fi
    else
        log "ERROR: Verification failed - new credentials may not be working"
        exit 1
    fi

    log "AWS credentials update completed successfully"
}

main "$@"
