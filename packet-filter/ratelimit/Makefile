include ../../include/*.mk

.DEFAULT_GOAL := compile

.PHONY: gen
gen:
	cd ../../ && make
	java -jar ../../vproxy.jar -Deploy=PacketFilterGenerator class=io.vproxy.samples.packetfilter.ratelimit.Ratelimit in=./flows.txt out=./src/io/vproxy/samples/packetfilter/ratelimit/Ratelimit.java

.PHONY: compile
compile: gen
	find ./src -name '*.java' | xargs javac -cp ../../vproxy.jar -d ./classes

.PHONY: clean
clean:
	rm -rf ./classes
	rm -f ./src/io/vproxy/samples/packetfilter/ratelimit/Ratelimit.java

.PHONY: install
install: compile
	$(run-redis-cli) \
	"System: add plugin ratelimit url `pwd`/classes/ class io.vproxy.samples.packetfilter.ratelimit.Ratelimit"
	$(run-redis-cli) \
	"System: update plugin ratelimit enable"

.PHONY: uninstall
uninstall:
	$(run-redis-cli) \
	"System: remove plugin ratelimit"
