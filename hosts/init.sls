{% if salt['grains.get']('os') == 'CentOS' -%}

hostname-file:
  file.managed:
    - name: /etc/hostname
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt://hosts/files/network

hostname-cmd:
  cmd.wait:
    - name: hostnamectl set-hostname {{ salt['grains.get']('id') }}
    - watch:
      - file: hostname-file

{% endif %}

{% if salt['grains.get']('os') == 'Ubuntu' -%}

hostname-file:
  file.managed:
    - name: /etc/hostname
    - owner: root
    - group: root
    - mode: 0644
    - template: jinja
    - source: salt://hosts/files/network

hostname-cmd:
  cmd.wait:
    - name: hostname {{ salt['grains.get']('id') }}
    - watch:
      - file: hostname-file

{% endif %}

127.0.1.1:
  host.only:
    - hostnames:
      - {{ salt['grains.get']('id') }}
