create-swap-file:
  cmd.run:
    - name: dd if=/dev/zero of=/mnt/swapfile1 bs=256 count=1048576
    - creates: /mnt/swapfile1

swapfile-perms:
  file.managed:
    - name: /mnt/swapfile1
    - mode: 0600
    - require:
      - cmd: create-swap-file

make-swap-cmd:
  cmd.run:
    - name: mkswap /mnt/swapfile1
    - onchanges:
      - cmd: create-swap-file

swapon-cmd:
  cmd.run:
    - name: swapon /mnt/swapfile1
    - onchanges:
      - cmd: create-swap-file

/etc/fstab:
  file.append:
    - text:
      - /mnt/swapfile1    none    swap   defaults 0 0

vm.swappiness:
  sysctl.present:
    - value: 5
