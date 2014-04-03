[ -d /usr/local/bin ] && export PATH=/usr/local/bin:${PATH}
[ -d ${HOME}/usr/bin ] && export PATH=${HOME}/usr/bin:${PATH}
[ -d ${HOME}/.nodebrew ] && export PATH=${HOME}/.nodebrew/current/bin:${PATH}
[ -d ${HOME}/.rbenv ] && export PATH=${HOME}/.rbenv/bin:${PATH}
if [ -d ${HOME}/usr/jdk ]; then
	export PATH=${HOME}/usr/jdk/bin:${PATH}
	export JAVA_HOME=${HOME}/usr/jdk
	[ -d ${HOME}/usr/scala ] && export PATH=${HOME}/usr/scala/bin:${PATH}
fi
