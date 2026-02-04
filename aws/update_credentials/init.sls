include:
  - awscli
  - packages.tools

jq:
  pkg.installed

update_aws_credentials_script:
  file.managed:
    - name: /usr/local/sbin/update_aws_credentials.sh
    - user: root
    - group: root
    - mode: '0500'
    - source: salt://aws/update_credentials/files/update_aws_credentials.sh

update_aws_credentials_cron:
  cron.present:
    - identifier: aws_credentials_update
    - name: /usr/local/sbin/update_aws_credentials.sh
    - user: root
    - minute: 0
    - hour: '*/6'
