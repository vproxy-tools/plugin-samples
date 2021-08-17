# packet filter

Packet filters are used with the vproxy switch module.

You will need to create a switch to run these samples. See `man switch` in vproxy.

Normally the packet filters are generated with an extended vproxy program: `-Deploy=PacketFilterGenerator`, it generates a java class from an ovs-of format flow table file. You may extend the generated java class to implement your own strategies.

Beside the prerequisites in root folder README.md, all these samples have the following extra common prerequisites:

* a running vproxy switch
* have all ifaces defined in `flows.txt` files (they are different in each sample)
