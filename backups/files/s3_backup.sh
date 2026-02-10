#!/bin/bash

aws s3 sync /mnt/data/ s3://hjedi-backups/rivendell/


# a7ac266fa6e5   docker.n8n.io/n8nio/n8n:latest                                 "tini -- /docker-ent…"   8 weeks ago    Up 15 hours                     0.0.0.0:5678->5678/tcp, [::]:5678->5678/tcp                                                                                 n8n-n8n-1
# 725f6471091f   postgres:18.0                                                  "docker-entrypoint.s…"   3 months ago   Up 15 hours                     0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp                                                                                 postgresql-db-1
# cae71a3abf0e   docker.gitea.com/gitea:1.25.0-rootless                         "/usr/bin/dumb-init …"   3 months ago   Up 15 hours                     0.0.0.0:2222->2222/tcp, [::]:2222->2222/tcp, 0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp                                    gitea-server-1
# 32a634ee3e1b   752432937359.dkr.ecr.us-east-2.amazonaws.com/foundry:v13.350   "node resources/app/…"   3 months ago   Up 15 hours                     30013/tcp, 0.0.0.0:30013->30000/tcp, [::]:30013->30000/tcp                                                                  foundry-foundryv13-1
# f0f93b597a77   752432937359.dkr.ecr.us-east-2.amazonaws.com/foundry:v12.343   "node resources/app/…"   3 months ago   Up 15 hours                     0.0.0.0:30000->30000/tcp, [::]:30000->30000/tcp                                                                             foundry-foundryv12-1
# 3ba171dccc25   registry:2.8.2                                                 "/entrypoint.sh /etc…"   3 months ago   Restarting (1) 26 seconds ago                                                                                                                               registry-server
# d6907a356566   joxit/docker-registry-ui:main                                  "/docker-entrypoint.…"   3 months ago   Up 15 hours                     0.0.0.0:5080->80/tcp, [::]:5080->80/tcp                                                                                     registry-ui
# b766f12a34da   nginx:latest                                                   "/docker-entrypoint.…"   3 months ago   Up 15 hours                     0.0.0.0:80->80/tcp, [::]:80->80/tcp, 0.0.0.0:443->443/tcp, [::]:443->443/tcp, 0.0.0.0:8443->8443/tcp, [::]:8443->8443/tcp   nginx
# 08f9cab7448c   portainer/portainer-ce:lts                                     "/portainer --http-e…"   3 months ago   Up 15 hours                     8000/tcp, 9443/tcp, 0.0.0.0:9000->9000/tcp, [::]:9000->9000/tcp                                                             portainer
