alias debug="export JAVA_OPTS=\"-XX:+UseConcMarkSweepGC -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=1024m -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n\""
alias nodebug="export JAVA_OPTS=-XX:+UseConcMarkSweepGC -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=768m"

alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gl="git log --graph --full-history --all --color"
alias gm="git merge"
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ga="git add"

alias geb="mvn -o -Dgeb.build.baseUrl=http://localhost:8080/ahit clean test"
alias geb_chrome="mvn -o -Dgeb.env=chrome -Dwebdriver.chrome.driver=/Users/adrian/Downloads/chromedriver -Dgeb.build.baseUrl=http://localhost:8080/ahit clean test"
alias geb_htmlunit="mvn -o -Dgeb.env=htmlunit -Dgeb.build.baseUrl=http://localhost:8080/ahit clean test"
