#!/usr/bin/env sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    export OPENEJB_HOME="$HOME/srv/openejb/inst"
    export CATALINA_HOME="$HOME/srv/tomcat/inst"
    export MW_HOME="$HOME/srv/weblogic/wls1036"
    export CUSTOM_PATH="$HOME/.rbenv/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"$(/usr/local/bin/brew --prefix coreutils)/libexec/gnubin"
    export CUSTOM_PATH=$CUSTOM_PATH:"/usr/local/git/bin:/usr/local/MacGPG2/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"/Library/Frameworks/JRuby.framework/Versions/Current/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"$OPENEJB_HOME/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"$CATALINA_HOME/bin"
    export CUSTOM_PATH=$CUSTOM_PATH:"$MW_HOME/bin"
    #elif [[ "$OSTYPE" == "freebsd"* ]]; then
    #    export CUSTOM_PATH="~/bin"
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
    export CUSTOM_PATH="$CUSTOM_PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
    export ANT_HOME=/usr/share/ant
    export MAVEN_HOME=/usr/share/maven
    export OPENEJB_HOME=/srv/openejb/inst
    export CATALINA_HOME=/srv/tomcat/inst
    export MW_HOME=/srv/weblogic/inst
    export CUSTOM_PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$OPENEJB_HOME/bin"
    export CUSTOM_PATH="$CUSTOM_PATH:$CATALINA_HOME/bin:$MW_HOME/bin"
fi

# export PATH=$PATH:$BASE_PATH:$CUSTOM_PATH
export PATH=$PATH:$CUSTOM_PATH
