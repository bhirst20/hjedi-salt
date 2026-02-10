include:
  - packages.tools

download_cli:
  file.managed:
    - name: /tmp/awscliv2.zip
    - source: https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    - source_hash: sha256=e3168c97834096b80ef42708eb0d8a456adc3b805dfcb2a5a2852318d521cb09
    - mode: '0755'

unzip_cli:
  cmd.run:
    - name: unzip /tmp/awscliv2.zip
    - cwd: /tmp
    - unless: test -f /usr/local/bin/aws

install_cli:
  cmd.run:
    - name: sudo ./aws/install
    - cwd: /tmp
    - unless: test -f /usr/local/bin/aws
