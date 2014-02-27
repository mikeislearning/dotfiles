# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

alias android="/Applications/android-sdk-macosx/tools/android"

alias nexus="/Applications/android-sdk-macosx/tools/emulator -avd nexus-s"

ulimit -n 1000

export EDITOR=$(which vi)

###### used for android sdk to work with phonegap
export PATH=${PATH}:/Applications/android-sdk-macosx/platform-tools:/Applications/android-sdk-macosx/tools:/usr/bin/java
### path for setting java_home, as of cordova 3.2.01
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

### Get a path for virtualbox to be used with Vagrant
PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS
export PATH


######
#FOR SUBVERSION
#######
#export PATH=/opt/subversion/bin:$PATH



######
#FOR Node Version Manager (nvm)
#######
source ~/.nvm/nvm.sh

alias ll='ls -al'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'

alias si='cd ~/Sites'
alias mo='cd ~/MobileDevelopment'

alias bashme='subl ~/.profile'
alias flushdns='dscacheutil -flushcache; echo Flushed!'

alias gitpush='git push -u origin master'
alias sourcereset='source ~/.profile'

alias buildsite='~/scripts/structure_public.sh'
alias removesvn='rm -rf `find . -type d -name .svn`'
alias py='/usr/bin/python'
alias 777me='sudo chmod -R 777 .'
alias serveryaf='ssh -A tylersavery@72.51.30.169'

alias qp='git add .; git commit -m"quick update"; git push'
alias finder='open .'

alias newhost='sudo subl /etc/apache2/extra/httpd-vhosts.conf; sudo subl /etc/hosts'
alias restart='sudo apachectl restart'
alias mongo='/data/mongodb/bin/mongod'
alias calc='python ~/scripts/calc.py'
alias compdump='php /usr/local/bin/composer.phar dump-autoload'
alias chrome="/usr/bin/open '-a /Applications/Google Chrome.app'"

##
# Your previous /Users/admin/.profile file was backed up as /Users/admin/.profile.macports-saved_2011-12-04_at_19:25:26
##

# MacPorts Installer addition on 2011-12-04_at_19:25:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/Users/tyler/bin:$PATH
export PATH="/usr/local/mysql/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="/Users/tyler/mysql/bin:/Applications/blender.app/Contents/MacOS":$PATH

##
# Your previous /Users/tyler/.profile file was backed up as /Users/tyler/.profile.macports-saved_2012-03-30_at_12:42:21
##

# MacPorts Installer addition on 2012-03-30_at_12:42:21: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/pear:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Setting PATH for Python 3.2
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
export PATH

#image magik
#export MAGICK_HOME="$HOME/ImageMagick-6.7.5"
#export PATH="$MAGICK_HOME/bin:$PATH"
#export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

