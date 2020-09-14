# User configuration
#export TERMINAL=urxvt
export TERMINAL=st
export EDITOR=vim
export BROWSER=surf
export TZ=America/Santiago

export LC_ALL="es_ES.UTF-8"
export LC_COLLATE="C"
export LANG="es_ES.UTF-8"
# setup PATH variable
#path+=($HOME/bin)
path+=($(du "$HOME/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'))

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    export OPENEJB_HOME="$HOME/srv/openejb/inst"
    export CATALINA_HOME="$HOME/srv/tomcat/inst"
    #export MW_HOME="$HOME/srv/weblogic/wls1036"
    export BREW_BINARIES_HOME="$(/usr/local/bin/brew --prefix coreutils)"

    #path+=($HOME/.rbenv/bin $path)
    #path+=($HOME/.rbenv/shims $path)
    path+=($BREW_BINARIES_HOME/libexec/gnubin $path)
    path+=(/usr/local/git/bin)
    path+=(/usr/local/MacGPG2/bin)
    path+=($OPENEJB_HOME/bin)
    path+=($CATALINA_HOME/bin)
    #path+=($MW_HOME/bin)
elif [[ "$OSTYPE" == "cygwin" ]]; then
    export WINAPPS_HOME="C:\\apps"
    export JAVA_HOME="$WINAPPS_HOME\\java\\zulu7.21.0.3-jdk7.0.161-win_x64"
    #export JAVA_HOME="C:\\Program Files\\Java\\jdk1.8.0_152"
    export ANT_HOME="$WINAPPS_HOME\\java\\apache-ant-1.9.9"
    export MAVEN_HOME="$WINAPPS_HOME\\Java\\apache-maven-3.5.2"
    export CUSTOM_PATH="$JAVA_HOME\\bin:$ANT_HOME\\bin:$MAVEN_HOME\\bin"
    export CUSTOM_PATH="$CUSTOM_PATH:C:\\WINDOWS:C:\\WINDOWS\\System32"
    export CUSTOM_PATH="$CUSTOM_PATH:C:\\WINDOWS\\System32\\WBEM:C:\\WINDOWS\\SYSTEM32\\WINDOWSPOWERSHELL\\V1.0\\"
    #export CUSTOM_PATH="$CUSTOM_PATH:$WINAPPS_HOME\\HashiCorp\\Vagrant\\bin"
elif [[ "$OSTYPE" == "freebsd*" ]]; then
    export JAVA_HOME=/usr/local/openjdk8
    path+=($JAVA_HOME/bin)
else
    #"linux-gnu"*
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    export ANT_HOME=/usr/share/ant
    export MAVEN_HOME=/usr/share/maven
    export OPENEJB_HOME=/srv/openejb/inst
    export CATALINA_HOME=/srv/tomcat/inst
    #export MW_HOME=/srv/weblogic/inst
    path=($HOME/.rbenv/bin $path)
    path+=($JAVA_HOME/bin)
    path+=($ANT_HOME/bin)
    path+=($MAVEN_HOME/bin)
    path+=($OPENEJB_HOME/bin)
    path+=($CATALINA_HOME/bin)
    #path+=($MW_HOME/bin)
fi

### Added by the Heroku Toolbelt, adapted to zsh
#path=('/usr/local/heroku/bin' $path)
export PATH

