# ratelimit

Add ratelimit on interfaces: `xdp:a1` and `xdp:b1`.

Before handling the input packets, limit the pps to `100_000`, bps to `1_073_741_824` (`1Gbps`).
