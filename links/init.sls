{% from 'top.sls' import username %}

# make links from the /usrdata folder to the home folder

# names of folders in the home folder (which match with folders in the /usrdata directory)
{% set folders_map = {
  'DESKTOP': 'desktop',
  'DOCUMENTS': 'document',
  'DOWNLOAD': 'download',
  'MUSIC': 'music',
  'PICTURES': 'picture',
  'VIDEOS': 'video',
} %}
{% set folders = [
  'books',
  'library',
  'resources',
  'web',
  '.smartgit',
  '.ssh',
  '.config/sublime-text-2'
] + folders_map.values() %}

{% for folder in folders %}
/home/{{ username }}/{{ folder }}:
  file.symlink:
    - target: /usrdata/{{ folder }}
    - force: True
    - user: {{ username }}
{% endfor %}

# Configuration files for nginx
/home/{{ username }}/.config/user-dirs.dirs:
  file.managed:
    - source: salt://links/user-dirs.dirs
    - template: jinja
    - context:
      folders_map: {{ folders_map }}


# remove all the old folders
{% set old_folders = [
  'Audiobooks',
  'Desktop',
  'Documents',
  'Downloads',
  'Music',
  'Pictures',
  'Podcasts',
  'Public',
  'Templates',
  'Videos',
  'Examples',
] %}

{% for folder in old_folders %}
/home/{{ username }}/{{ folder }}:
  file.absent
{% endfor %}
