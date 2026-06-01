# UART Protocol Verification

Basic UART TX/RX with SystemVerilog class-based testbench.

## Features
- Parameterized baud rate (1MHz clk, 9600 baud)
- Transaction with write/read operations
- Generator → Driver → Monitor → Scoreboard
- Loopback verification

## Structure
```
uart-verification/
├── src/
│   ├── uart_top.sv
│   ├── uart_tx.sv
│   └── uart_rx.sv
├── tb/
│   ├── uart_if.sv
│   ├── tb_pkg.sv
│   └── tb.sv
└── sim/Makefile
```

## Run
```bash
cd sim
make run
```

Commit date: 01-06-2026
