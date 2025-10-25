init_script:
  file.managed:
    - name: /home/salt_master/initialize.sh
    - user: salt_master
    - group: salt_master
    - mode: 0500
    - source: salt://salt/files/initialize.sh

update_script:
  file.managed:
    - name: /home/salt_master/update.sh
    - user: salt_master
    - group: salt_master
    - mode: 0500
    - source: salt://salt/files/update.sh

move_files_script:
  file.managed:
    - name: /home/salt_master/move_files.sh
    - user: salt_master
    - group: salt_master
    - mode: 0500
    - source: salt://salt/files/move_files.sh

cd /home/salt_master; ./update.sh:
  cron.present:
    - identifier: Update repos
    - user: salt_master
    - minute: 2

systemctl restart salt_master-master:
  cron.present:
    - identifier: Restart salt_master-master
    - user: root
    - minute: 3
    - hour: 6

systemctl restart salt_master-minion:
  cron.present:
    - identifier: Restart salt_master-minion
    - user: root
    - minute: 5
    - hour: 6

salt_master_config:
  file.symlink:
    - name: /srv/salt
    - target: /home/salt_master/home_salt/salt_master
    - force: True

pillar_config:
  file.symlink:
    - name: /srv/pillar
    - target: /home/salt_master/home_salt/pillar
    - force: True
