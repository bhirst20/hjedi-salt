pihole_path:
  file.directory:
    - name: /root/pihole

pihole_download:
  cmd.wait:
    - name: wget -O basic-install.sh https://install.pi-hole.net
    - watch:
      - file: pihole_path

pihole_install:
  cmd.wait:
    - name: sudo bash basic-install.sh
    - watch:
      - cmd: pihole_download
