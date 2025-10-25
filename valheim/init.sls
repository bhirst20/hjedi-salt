Valheim-install-path:
  file.directory:
    - name: /home/steam/Valheim
    - user: steam
    - group: steam

Valheim-install:
  cmd.wait:
    - name: /usr/games/steamcmd +login anonymous +force_install_dir /home/steam/Valheim +app_update 896660 validate +exit
    - runas: steam
    - watch:
      - file: Valheim-install-path

Valheim-update:
  cron.present:
    - identifier: /usr/games/steamcmd +login anonymous +force_install_dir /home/steam/Valheim +app_update 896660 validate +exit
    - user: steam
    - minute: 8
    - hour: 11

Valheim-service:
  file.managed:
    - name: /etc/systemd/system/valheim.service
    - user: root
    - source: salt://valheim/files/valheim.service

valheim:
  service.running:
    - enable: True
