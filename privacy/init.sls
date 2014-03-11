# fix the privacy issues in ubuntu
# this can be script as much as you want without screwing anything up
'salt://privacy/privacy.sh':
  cmd:
    - script
    - cwd: /
