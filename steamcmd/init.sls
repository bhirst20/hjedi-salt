steam-install:
  file.managed:
    - name: /root/steam_installed

add-multiverse:
  cmd.run:
    - name: sudo add-apt-repository multiverse
    - watch:
      - file: steam-install

add-i386-support:
  cmd.run:
    - name: sudo dpkg --add-architecture i386
    - watch:
      - file: steam-install

update-apt:
  cmd.run:
    - name: sudo apt update
    - watch:
      - file: steam-install

lib32gcc1:
  pkg.installed

steamcmd:
  pkg.installed
