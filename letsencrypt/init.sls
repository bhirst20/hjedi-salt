auto_cert_update:
  file.managed:
    - name: /usr/local/sbin/update_certs.sh
    - user: root
    - group: root
    - mode: 0500
    - source: salt://letsencrypt/files/update_certs.sh

auto_cert_update_cron:
  cron.present:
    - name: letsencrypt_certificate_update
    - user: root
    - minute: 0
    - hour: 3
