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

{% if grains.osfullname == "Ubuntu" %}
ubuntu_install_key:
  cmd.wait:
    - name: curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    - watch:
      - file: root_installed_docker

ubuntu_repo_file:
  file.managed:
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/files/repo.ubuntu

ubuntu_docker-ce:
  pkg.installed:
    - require:
      - file: ubuntu_repo_file

ubuntu_docker-ce-cli:
  pkg.installed:
    - require:
      - file: ubuntu_repo_file

ubuntu_containerd.io:
  pkg.installed:
    - require:
      - file: ubuntu_repo_file

{% endif %}

{% if grains.osfullname == "Debian GNU/Linux" %}
debian_install_key:
  cmd.wait:
    - name: sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    - watch:
      - file: root_installed_docker

debian_repo_file:
  file.managed:
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/files/repo.ubuntu

debian_docker-ce:
  pkg.installed:
    - require:
      - file: debian_repo_file

debian_docker-ce-cli:
  pkg.installed:
    - require:
      - file: debian_repo_file

debian_containerd.io:
  pkg.installed:
    - require:
      - file: debian_repo_file

{% endif %}
