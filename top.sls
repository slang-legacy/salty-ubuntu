{% set username = 'slang'%}
{% set password = 'core2062'%}

base:
  '*':
    - apt.unattended
    - links
    - users
    - ssh
    - misc
    - privacy
