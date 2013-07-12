[ -d /usr/local/bin ] && export PATH=/usr/local/bin:${PATH}
[ -d ${HOME}/.nodebrew ] && export PATH=${HOME}/.nodebrew/current/bin:${PATH}
[ -d ${HOME}/.rbenv ] && export PATH=${HOME}/.rbenv/bin:${PATH}
if [ -d ${HOME}/usr/jdk1.7.0 ]; then
	export PATH=${HOME}/usr/jdk1.7.0/bin:${PATH}
	export JAVA_HOME=${HOME}/usr/jdk1.7.0
	[ -d ${HOME}/usr/scala ] && export PATH=${HOME}/usr/scala/bin:${PATH}
fi
