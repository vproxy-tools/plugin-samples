include ../../include/*.mk

.DEFAULT_GOAL := compile

.PHONY: gen
gen:
	cd ../../ && make
	java -jar ../../vproxy.jar -Deploy=PacketFilterGenerator class=io.vproxy.samples.packetfilter.nat.Nat in=./flows.txt out=./src/io/vproxy/samples/packetfilter/nat/Nat.java

.PHONY: compile
compile: gen
	find ./src -name '*.java' | xargs javac -cp ../../vproxy.jar -d ./classes

.PHONY: clean
clean:
	rm -rf ./classes
	rm -f ./src/io/vproxy/samples/packetfilter/nat/Nat.java

.PHONY: install
install: compile
	$(run-redis-cli) \
	"System: add plugin nat url `pwd`/classes/ class io.vproxy.samples.packetfilter.nat.Nat"
	$(run-redis-cli) \
	"System: update plugin nat enable"

.PHONY: uninstall
uninstall:
	$(run-redis-cli) \
	"System: remove plugin nat"
