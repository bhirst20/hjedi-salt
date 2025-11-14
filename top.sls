base:

  '*':
    - profile.core-linux

  'rivendell':
    - profile.controlcenter

  'minastirith':
    - profile.core-linux

  'osgiliath':
    - profile.core-linux

  'lothlorien':
    - profile.controlcenter
    - servers.lothlorien
    - bash.root_aliases
    - certbot.auto-update-aws-creds
