include ../../include/*.mk

.DEFAULT_GOAL := compile

.PHONY: gen
gen:
	cd ../../ && make
	java -jar ../../vproxy.jar -Deploy=PacketFilterGenerator class=vproxy.samples.packetfilter.pair.Pair in=./flows.txt out=./src/vproxy/samples/packetfilter/pair/Pair.java

.PHONY: compile
compile: gen
	find ./src -name '*.java' | xargs javac -cp ../../vproxy.jar -d ./classes

.PHONY: clean
clean:
	rm -rf ./classes
	rm -f ./src/vproxy/samples/packetfilter/pair/Pair.java

.PHONY: install
install: compile
	$(run-redis-cli) \
	"System: add plugin pair url `pwd`/classes/ class vproxy.samples.packetfilter.pair.Pair"
	$(run-redis-cli) \
	"System: update plugin pair enable"

.PHONY: uninstall
uninstall:
	$(run-redis-cli) \
	"System: remove plugin pair"
