data_path:
  file.directory:
    - name: /home/data/
    - user: root
    - group: root
    - mode: 755

data_symlink:
  file.symlink:
    - name: /mnt/data
    - target: /home/data/
