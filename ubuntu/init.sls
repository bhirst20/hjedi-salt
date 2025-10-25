apt-upgrade:
  cron.present:
    - name: apt upgrade -y
    - identifier: Apt Maintenance
    - user: root
    - minute: 7
    - hour: 7

