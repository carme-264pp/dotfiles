typeset -U path PATH

path=(
      ${HOME}/usr/bin(N-/)
      ${HOME}/.nodebrew/current/bin(N-/)
      ${HOME}/.rbenv/bin(N-/)
      ${HOME}/usr/jdk/bin(N-/)
      ${HOME}/usr/scala/bin(N-/)
      /usr/local/bin(N-/)
      $path
     )

if [ -d ${HOME}/usr/jdk ]; then
	export JAVA_HOME=${HOME}/usr/jdk
fi
