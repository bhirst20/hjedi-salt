signoz-config-path:
  file.directory:
    - name: /mnt/data/signoz/config

signoz-config-path:
  file.directory:
    - name: /mnt/data/signoz/data

signoz-otel-config:
  file.managed:
    - name: /mnt/data/signoz/config/otel-collector-config.yml
    - source: salt://signoz/files/otel-collector-config.yml
    - user: root
    - group: root
    - mode: 644
