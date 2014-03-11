salty-wordpress
=================

Salt State configuration files for turning a fresh Ubuntu installation into a usable development environment.

Before using this, you should configure it by editing `top.sls` and a lot of the other files. This configuration is made to fit my preferences, and is probably very different from yours.

I setup Ubuntu in a kinda weird way - I keep all my documents and configuration files in a separate partition mounted at `/usrdata`, and then I symlink the folders in there to my home folder. This is nice because I can wipe out the entire partition that Ubuntu is installed on without loosing anything. Also, backups are easier because I don't have to copy all of the operating system files (since I can get them back using this configuration) - only the usrdata partition. And I can have my usrdata partition attached to multiple OS installations (each on their own partition), meaning I can move between installations seamlessly.

Because I use a usrdata partition, you'll see references to it in a lot of the config files. In fact, the entire `links` folder is made to connect `/usrdata` to the home folder.

You can add all your ssh keys to `ssh/keys`, and then reference them in `ssh/init.sls`. By default, my key is the only one there. You should remove that and put your key there instead.

setup script:
```bash
echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
sudo apt-get update
sudo apt-get install salt-minion git
sudo mkdir /srv
sudo ln -s /usrdata/salty-ubuntu /srv/salt
sudo salt-call --local state.highstate -l debug
```

then just wait for it to run... it takes awhile

# Stuff this doesn't do

Sadly, there are a few things that I haven't built into the config...

 - change the date/time indicator to show seconds, the weekday, month, and date.
 - finish installing Java (it just adds the PPA), `sudo apt-get install oracle-java7-installer`
 - add clipit to the startup programs
 - change clipit history hotkey to Ctrl+Shift+V
 - Override software rendering list in chrome://flags
 - make a link in unity for smartgit
 - install google-chrome, google music manager, and google talk
 - install the chrome Hangouts plugin
 - switch to single window mode in GIMP
 - configure stuff, setup last.fm scrobbling, and import media; in banshee
 - git configuration: `git config --global user.name "Sean Lang"` and `git config --global user.email "slang800@gmail.com"`
 - add `setxkbmap -option caps:none` to startup
 - configure `gm-notify`
