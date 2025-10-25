red-root:
  file.append:
    - name: /root/.bashrc
    - text:
      - PS1='\[\e[31m\][\u@\h \W]\[\e[0m\] $ '
      - export TMOUT=600

{% if salt['grains.get']('os') == 'Ubuntu' -%}
tmout-all:
  file.append:
    - name: /etc/bash.bashrc
    - text:
      - export TMOUT=600

{% else %}
tmout-all:
  file.append:
    - name: /etc/bashrc
    - text:
      - export TMOUT=600

{% endif %}