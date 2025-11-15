auto_cert_update:
  file.managed:
    - name: /usr/local/sbin/auto-cert-update.sh
    - user: root
    - group: root
    - mode: 0500
    - source: salt://letsencrypt/files/auto-cert-update.sh

auto_cert_update_cron:
  cron.present:
    - name: /usr/local/sbin/auto-cert-update.sh
    - user: root
    - minute: 0
    - hour: 3
