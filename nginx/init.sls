nginx-config-path:
  file.directory:
    - name: /mnt/data/nginx

nginx_config:
  file.managed:
    - name: /mnt/data/nginx/nginx.conf
    - source: salt://nginx/files/nginx.conf.{{ grains['hostname'] }}
    - user: root
    - group: root
    - mode: 644

nginx-docker-compose:
  file.managed:
    - name: /mnt/data/nginx/docker-compose.yaml
    - source: salt://nginx/files/docker-compose.yaml
    - user: root
    - group: root
    - mode: 644
