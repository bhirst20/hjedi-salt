import boto3
import configparser
import os
import requests
from botocore.exceptions import ClientError

# Configuration
CREDENTIALS_FILE = os.path.expanduser('~/.aws/credentials')
PROFILE = 'default'
ERROR_ENDPOINT = 'https://ntfy.sh/svjgQ5oxGZJoizCu'

def send_error(error_msg):
    print(f"Sending error report: {error_msg}")
    try:
        requests.post(ERROR_ENDPOINT, json={'error': error_msg})
    except Exception as e:
        print(f"Failed to send error: {e}")

def main():
    config = configparser.ConfigParser()
    config.read(CREDENTIALS_FILE)

    if not config.has_section(PROFILE):
        send_error("Profile not found")
        return

    old_access_key = config[PROFILE].get('aws_access_key_id')
    old_secret_key = config[PROFILE].get('aws_secret_access_key')

    if not old_access_key or not old_secret_key:
        send_error("Old credentials not found")
        return


    print(f"Starting AWS credentials rotation for {old_access_key}...")

    # Create IAM client with old credentials
    try:
        print("Connecting to IAM")
        iam = boto3.client('iam')

        # Create new access key
        print("Creating Access Key")
        response = iam.create_access_key()
        new_access_key = response['AccessKey']['AccessKeyId']
        new_secret_key = response['AccessKey']['SecretAccessKey']

        # Update credentials file
        print("Updating local keys")
        config[PROFILE]['aws_access_key_id'] = new_access_key
        config[PROFILE]['aws_secret_access_key'] = new_secret_key
        with open(CREDENTIALS_FILE, 'w') as f:
            config.write(f)

        # Verify new credentials
        print("Reconnecting to IAM")
        new_iam = boto3.client('iam')
        new_iam.get_user()  # Simple verification

        # Delete old access key
        print("Destroying old key")
        iam.delete_access_key(AccessKeyId=old_access_key)

    except ClientError as e:
       send_error(f"AWS error: {e}")
    except Exception as e:
       send_error(f"General error: {e}")

if __name__ == '__main__':
    main()
