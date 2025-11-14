auto-update-script:
  file.managed:
    - name: /usr/local/sbin/auto-update-aws-creds.py
    - mode: 0500
    - user: root
    - group: root
    - source: salt://certbot/files/auto-update-aws-creds.py

auto-update-cronjob:
  cron.present:
    - name: /usr/local/sbin/auto-update-aws-creds.py
    - user: root
    - minute: 15
    - hour: 0
    - daymonth: 1
