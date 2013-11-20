nodejs:
  pkgrepo.managed:
    - ppa: chris-lea/node.js
  pkg.installed:
    - name: nodejs

npm:
  pkg.installed:
    - require:
      - pkg: nodejs

npm-packages:
  npm.installed:
    - user: root
    - names:
      - coffee-script
      - jade
      - stylus
      - roots
    - require:
      - pkg: npm
