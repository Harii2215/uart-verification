TOP=tb
SRC=../src/uart_tx.sv ../src/uart_rx.sv ../src/uart_top.sv
TB=../tb/tb.sv

all: run

run:
	vlib work
	vlog -sv $(SRC) $(TB)
	vsim -c work.$(TOP) -do "run -all; quit"

waves:
	vsim work.$(TOP) -do "do wave.do"

clean:
	rm -rf work transcript vsim.wlf *.vcd