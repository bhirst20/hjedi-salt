name: Push and update Salt

on:
  push:
    branches:
      - main

jobs:
  tag_release:
    runs-on: self-hosted

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4.1.7

      - name: Build image
        run: |
          cd srv
          if [ -d /srv/salt ]; then
              cd /srv/salt
              git pull
          else:
              git clone https://github.com/hjedi/salt.git /srv/salt
