registry-config-yaml:
    file.managed:
        - name: /mnt/data_lowspeed/registry/config/config.yml
        - source: salt://registry/files/config.yml
        - user: 999
        - group: 999
        - mode: 644