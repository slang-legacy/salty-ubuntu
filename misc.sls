{% from 'top.sls' import username %}

misc-pkgs:
  pkg.installed:
    - pkgs:
      - git
      - screen
      - clipit
      - banshee
      - gimp
      - build-essential
      - python-pip
      - gm-notify
      - tree
      - traceroute
      - whois

unneeded-packages:
  pkg.purged:
    - names:
      - vim
      - vim-tiny
      - deja-dup
      - rhythmbox
      - gbrainy
      - aisleriot
      - gnome-sudoku
      - gnome-mahjongg
      - gnomine
      - gnome-mines
      - thunderbird
      - empathy

java:
  pkgrepo.managed:
    - ppa: webupd8team/java

st3:
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-3
  pkg.installed:
    - name: sublime-text-installer

smartgit:
  pkgrepo.managed:
    - ppa: eugenesan/ppa
  pkg.installed:
    - name: smartgithg

truecrypt:
  pkgrepo.managed:
    - ppa: stefansundin/truecrypt
  pkg.installed:
    - name: truecrypt

#more unneeded packages that are easier to remove with a regex
'salt://misc.sh':
  cmd.script:
    - cwd: /
    - template: jinja
    - context:
      username: {{ username }}

# move /tmp to ram
/tmp:
  mount.mounted:
    - device: tmpfs
    - fstype: tmpfs
    - opts:
      - defaults
      - noexec
      - nosuid
