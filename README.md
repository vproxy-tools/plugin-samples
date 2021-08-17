# [vproxy](https://github.com/wkgcass/vproxy) plugin samples

## prerequisites

All the samples have the following common prerequisites:

* `java` and `javac` in `$PATH`
* a running vproxy instance

To automatically load plugins into the vproxy instance, it also requires:

* `redis-cli` in `$PATH`
* the vproxy instance has `allowSystemCommandInNonStdIOController` startup argument
* has a running `resp-controller` with listening address and password defined in `include/Makefile.admin.mk`  
    (`address=127.0.0.1` `port=16309` and `pass=123456`)  
    To start a `resp-controller`, type `System: add resp-controller resp-controller address 127.0.0.1:16309 password 123456` into vproxy

## how to play with these samples

Run `make` to prepare the necessary classes and resources.

Run `make install` to load the plugin.

Run `make uninstall` to unload the plugin.

Run `make clean` to remove generated files.

## index

* packet filter
    * pair: redirect packets from a to b, and b to a
