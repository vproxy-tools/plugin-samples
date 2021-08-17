.DEFAULT_GOAL := vproxy.jar

VERSION = $(shell curl https://raw.githubusercontent.com/wkgcass/vproxy/master/base/src/main/java/vproxybase/util/Version.java | grep '_THE_VERSION_' | cut -d '"' -f 2)

vproxy.jar:
	wget https://github.com/wkgcass/vproxy/releases/download/$(VERSION)/vproxy-$(VERSION).jar
	mv vproxy-$(VERSION).jar vproxy.jar
