nodejs:
  pkgrepo.managed:
    - ppa: chris-lea/node.js
  pkg.installed:
    - name: nodejs

npm-packages:
  npm.installed:
    - user: root
    - names:
      - coffee-script
      - coffeelint
      - jade
      - stylus
      - roots
      - jshint
    - require:
      - pkg: nodejs
