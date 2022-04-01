# nat

## prepare

Two veth pairs:

1. `a1` and `a0`, where `a1` is out of netns and `a0` is in netns `a`
2. `b1` and `b0`, where `b1` is out of netns and `b0` is in netns `b`

Configure the vproxy switch:

1. create a network `10.100.0.0/24`
2. add an ip to the network `10.100.0.199`

Configure the interfaces:

1. `a0` is assigned with `10.100.0.1/24`
2. `b0` is assigned with `10.100.0.2/24`
3. default route in netns `a` should be set to `10.100.0.199` or `10.100.0.2`, any one of them would be fine
4. default route in netns `b` should be set to `10.100.0.199` or `10.100.0.1`, any one of them would be fine

## plugin actions

1. all tcp/udp traffic from `a1` with destination port `1000-1999` will dnat to `10.100.0.2:80`
2. all tcp/udp traffic from `a1` with destination port `2000-2999` will snat to `2.2.2.2:1-65535`
3. all tcp/udp traffic from `a1` with destination port `3000-3999` will fnat to `3.3.3.3:1-65535^10.100.0.2:90`
4. all other traffic will be handled normally
