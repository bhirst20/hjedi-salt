backup_nfs_script:
  file.managed:
    - name: /usr/local/bin/backup_nfs.sh
    - mode: '0555'
    - user: root
    - group: root
    - source: salt://backups/files/backup_nfs.sh

backup_nfs_cron:
  cron.present:
    - identifier: backup_nfs_host_cron
    - name: '/usr/local/bin/backup_nfs.sh'
    - hour: 0
    - minute: 32
    - user: root

backups_s3_script:
  file.managed:
    - name: /usr/local/bin/backup_s3.sh
    - mode: '0555'
    - user: root
    - group: root
    - source: salt://backups/files/backup_s3.sh

backups_s3_cron:
  cron.present:
    - identifier: backups_s3_cron
    - name: '/usr/local/bin/backup_s3.sh'
    - hour: 2
    - minute: 32
    - user: root
