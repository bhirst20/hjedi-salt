sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 0600
    - template: jinja
    - source: salt://ssh/tempaltes/sshd_config.jinja

ssd_service:
  service.running:
    - name: sshd
    - watch:
      - file: sshd_config
