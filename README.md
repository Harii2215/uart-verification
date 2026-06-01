# UART Protocol – Design & SystemVerilog Verification

A complete **Universal Asynchronous Receiver-Transmitter (UART)** implementation with a full class-based verification environment. This project demonstrates serial communication (TX/RX) with configurable baud rate, verified using a Generator-Driver-Monitor-Scoreboard architecture.

![SystemVerilog](https://img.shields.io/badge/Language-SystemVerilog-blue) ![Verification](https://img.shields.io/badge/Methodology-Class--Based-green) ![Baud](https://img.shields.io/badge/Baud-9600-orange)

---

## 📖 Overview

UART is the backbone of serial communication in embedded systems. This project implements:

1. **UART Transmitter (uart_tx)** – Parallel-to-serial, adds start bit
2. **UART Receiver (uart_rx)** – Serial-to-parallel, detects start bit
3. **Top Integration (uart_top)** – Loopback capable
4. **Complete Verification Environment** – Random write/read operations

Unlike simple tutorials, this uses **randc operations**, mailboxes, and events for true verification.

---

## 🏗️ Architecture

```
              ┌─────────────┐      tx       ┌─────────────┐
   dintx[7:0]→│  UART TX    │──────────────→│  UART RX    │→ doutrx[7:0]
   newd ─────→│  (uarttx)   │               │  (uartrx)   │
              └─────────────┘               └─────────────┘
                     ↑                             ↑
                  uclk (baud)                  uclk (baud)
```

**Parameters:**
- `clk_freq = 1_000_000 Hz` (1 MHz)
- `baud_rate = 9600`
- `clkcount = clk_freq/baud_rate ≈ 104`

---

## 📁 Project Structure

```
uart-verification/
├── src/
│   ├── uart_top.sv    # Top-level integration
│   ├── uart_tx.sv     # Transmitter FSM
│   └── uart_rx.sv     # Receiver FSM
├── tb/
│   ├── uart_if.sv     # Interface with all signals
│   ├── tb_pkg.sv      # All verification classes
│   └── tb.sv          # Testbench top
├── sim/
│   └── Makefile       # One-command simulation
└── docs/
```

---

## 🧪 Verification Environment

Built exactly as provided – **no simplifications**:

### 1. Transaction Class
```systemverilog
typedef enum bit {write=0, read=1} oper_type;
randc oper_type oper;      // Random write/read
rand bit [7:0] dintx;      // Random data
```
- `copy()` method for mailbox transfer

### 2. Generator
- Randomizes `oper` and `dintx`
- Sends 5 transactions (configurable)
- Synchronizes with driver & scoreboard via events

### 3. Driver
- **Write operation:** Drives `newd`, `dintx`, waits for `donetx`
- **Read operation:** Drives `rx` line bit-by-bit, waits for `donerx`
- Resets DUT properly

### 4. Monitor
- Samples TX line on `uclktx`
- Captures RX data on `donerx`
- Puts received data into mailbox

### 5. Scoreboard
- Compares driver-sent data vs monitor-received data
- Reports `DATA MATCHED / MISMATCHED`

### 6. Environment
- Connects all components via mailboxes
- Manages `pre_test()`, `test()`, `post_test()`

---

## 🚀 How to Run

### Prerequisites
- QuestaSim / ModelSim / VCS / Xcelium (class support required)
- **Vivado XSIM will NOT work** (limited class support)

### Quick Start
```bash
git clone https://github.com/YOUR_USERNAME/uart-verification.git
cd uart-verification/sim
make run
```

### Manual (Questa)
```bash
vlib work
vlog -sv ../src/*.sv ../tb/*.sv
vsim -c work.tb -do "run -all"
```

### Expected Console Output
```
[DRV] : RESET DONE
----------------------------------------
[GEN]: Oper : write Din : 154
[DRV]: Data Sent : 154
[MON] : DATA SEND on UART TX 154
[SCO] : DRV : 154 MON : 154
DATA MATCHED
----------------------------------------
[GEN]: Oper : read Din : 87
[DRV]: Data RCVD : 87
[MON] : DATA RCVD RX 87
[SCO] : DRV : 87 MON : 87
DATA MATCHED
```

---

## 🔧 Key Features

✅ **True UART Protocol** – Start bit detection, LSB-first, stop bit  
✅ **Dual Operation** – Random write AND read transactions  
✅ **Baud Clock Generation** – Internal `uclk` from system clock  
✅ **Full Handshaking** – `donetx` and `donerx` signals  
✅ **Class-Based TB** – Industry-standard verification methodology  
✅ **Randomization** – `randc` ensures all operations covered  

---

## 📊 Waveform Signals to Watch

Add these in your wave viewer:
- `vif.clk`, `vif.uclktx`, `vif.uclkrx`
- `vif.newd`, `vif.dintx`, `vif.tx`, `vif.donetx`
- `vif.rx`, `vif.doutrx`, `vif.donerx`

---

## 🗓️ Git Commands (Commit Date: 01-06-2026)

```bash
git add .
GIT_AUTHOR_DATE="2026-06-01T10:00:00+05:30" \
GIT_COMMITTER_DATE="2026-06-01T10:00:00+05:30" \
git commit -m "feat: UART verification environment"
git push origin main
```

---

## 📚 Learning Outcomes

This project teaches:
1. UART protocol timing
2. SystemVerilog OOP (classes, mailboxes, events)
3. Driver-monitor synchronization
4. Randomized verification

---

## 📄 License

MIT – Free for academic and commercial use.

**Star this repo if it helped you understand UART verification!**