timestamp-history:
  file.managed:
    - name: /etc/profile.d/history_timestamp.sh
    - mode: 0555
    - source: salt://bash/files/history_timestamp.sh
