apt-transport-https:
  pkg.installed

ca-certificates:
  pkg.installed

gnupg-agent:
  pkg.installed

software-properties-common:
  pkg.installed

root_installed_docker:
  file.managed:
    - name: /root/installed_repo_docker_confirm

install_key:
  cmd.wait:
    - name: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    - watch:
      - file: root_installed_docker

repo_file:
  file.managed:
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/files/repo.ubuntu

docker-ce:
  pkg.installed:
    - require:
      - file: repo_file

docker-ce-cli:
  pkg.installed:
    - require:
      - file: repo_file

containerd.io:
  pkg.installed:
    - require:
      - file: repo_file
