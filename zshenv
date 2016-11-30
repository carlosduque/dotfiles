# User configuration
export EDITOR=vim
#export BROWSER=$(which google-chrome chromium-browser firefox w3m links2 links lynx | grep -Pm1 '^/')
export TZ=America/Santiago

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"
export LANG="es_ES.UTF-8"

# setup PATH variable
path+=($HOME/bin)
source $HOME/bin/resty
#source $HOME/binhsetup_env_vars.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    export OPENEJB_HOME="$HOME/srv/openejb/inst"
    export CATALINA_HOME="$HOME/srv/tomcat/inst"
    export MW_HOME="$HOME/srv/weblogic/wls1036"
    #export JRUBY_HOME="/Library/Frameworks/JRuby.framework/Versions/Current"
    #export CUSTOM_PATH=$CUSTOM_PATH:"$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin"
    export BREW_BINARIES_HOME="$(/usr/local/bin/brew --prefix coreutils)"

    path=($HOME/.rbenv/bin $path)
    path=($BREW_BINARIES_HOME/libexec/gnubin $path)
    path+=(/usr/local/git/bin)
    path+=(/usr/local/MacGPG2/bin)
    #path+=($JRUBY_HOME/bin)
    path+=($OPENEJB_HOME/bin)
    path+=($CATALINA_HOME/bin)
    path+=($MW_HOME/bin)
elif [[ "$OSTYPE" == "cygwin" ]]; then
    export WINAPPS_HOME="C:\\apps"
    export JAVA_HOME="$WINAPPS_HOME\\Java\\jdk1.7.0_71"
    export ANT_HOME="$WINAPPS_HOME\\Java\\apache-ant-1.9.4"
    export MAVEN_HOME="$WINAPPS_HOME\\Java\\apache-maven-3.2.3"
    export CUSTOM_PATH="$JAVA_HOME\\bin:$ANT_HOME\\bin:$MAVEN_HOME\\bin"
    export CUSTOM_PATH="$CUSTOM_PATH:C:\\WINDOWS:C:\\WINDOWS\\System32"
    export CUSTOM_PATH="$CUSTOM_PATH:C:\\WINDOWS\\System32\\WBEM:C:\\WINDOWS\\SYSTEM32\\WINDOWSPOWERSHELL\\V1.0\\"
    export CUSTOM_PATH="$CUSTOM_PATH:$WINAPPS_HOME\\HashiCorp\\Vagrant\\bin"
else
    #"freebsd"* || "linux-gnu"*
    #export CUSTOM_PATH="$CUSTOM_PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
    export ANT_HOME=/usr/share/ant
    export MAVEN_HOME=/usr/share/maven
    export OPENEJB_HOME=/srv/openejb/inst
    export CATALINA_HOME=/srv/tomcat/inst
    export MW_HOME=/srv/weblogic/inst
    path=($HOME/.rbenv/bin $path)
    path+=($JAVA_HOME/bin)
    path+=($ANT_HOME/bin)
    path+=($MAVEN_HOME/bin)
    path+=($OPENEJB_HOME/bin)
    path+=($CATALINA_HOME/bin)
    path+=($MW_HOME/bin)
fi

### Added by the Heroku Toolbelt, adapted to zsh
path=('/usr/local/heroku/bin' $path)
export PATH

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# aliases
alias zshconfig="vim $HOME/.zshrc"
alias vimconfig="vim $HOME/.vimrc"

