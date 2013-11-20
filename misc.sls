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

st2:
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-2
  pkg.installed:
    - name: sublime-text

#more unneeded packages that are easier to remove with a regex
'salt://misc.sh':
  cmd.script:
    - template: jinja
    - context:
      username: {{ username }}
