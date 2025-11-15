data-fast-path:
  file.directory:
    - name: /mnt/data
    - user: root
    - group: root
    - mode: 0755

data-slow-path:
  file.directory:
    - name: /mnt/data_lowspeed
    - user: root
    - group: root
    - mode: 0755

data-fast-psql-path:
  file.directory:
    - name: /mnt/data/psql
    - user: 999
    - group: 999
    - mode: 0755

data-fast-mongodb-path:
  file.directory:
    - name: /mnt/data/mongodb
    - user: 999
    - group: 999
    - mode: 0755

data-fast-foundry-path:
  file.directory:
    - name: /mnt/data/foundry
    - user: 999
    - group: 999
    - mode: 0755

data-fast-foundry12-path:
  file.directory:
    - name: /mnt/data/foundry/foundryv
    - user: 999
    - group: 999
    - mode: 0755

data-fast-foundry13-path:
  file.directory:
    - name: /mnt/data/foundry/foundry13
    - user: 999
    - group: 999
    - mode: 0755

data-fast-gitea-path:
  file.directory:
    - name: /mnt/data/gitea
    - user: 999
    - group: 999
    - mode: 0755

data-fast-n8n-path:
  file.directory:
    - name: /mnt/data/n8n
    - user: 999
    - group: 999
    - mode: 0755

srv-path:
  file.directory:
    - name: /srv
    - user: github_actions
    - group: github_actions
    - mode: 0755

data-lowspeed-registry-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry
    - user: 999
    - group: 999
    - mode: 0755

data-lowspeed-registry-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry/data
    - user: 999
    - group: 999
    - mode: 0755

data-lowspeed-registry-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry/config
    - user: 999
    - group: 999
    - mode: 0755


data-lowspeed-signoz-clickhouse-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry/config
    - user: 999
    - group: 999
    - mode: 0755


data-lowspeed-signoz-sqlite-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry/config
    - user: 999
    - group: 999
    - mode: 0755

data-lowspeed-signoz-zookeeper-path:
  file.directory:
    - name: /mnt/data_lowspeed/registry/config
    - user: 999
    - group: 999
    - mode: 0755
