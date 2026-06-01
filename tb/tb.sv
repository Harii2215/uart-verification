`include "uart_if.sv"
`include "tb_pkg.sv"

module tb;
  uart_if vif();
  
  uart_top #(1000000, 9600) dut (
    .clk(vif.clk),
    .rst(vif.rst),
    .rx(vif.rx),
    .dintx(vif.dintx),
    .newd(vif.newd),
    .tx(vif.tx),
    .doutrx(vif.doutrx),
    .donetx(vif.donetx),
    .donerx(vif.donerx)
  );
  
  initial begin
    vif.clk <= 0;
  end
  
  always #10 vif.clk <= ~vif.clk;
  
  environment env;
  
  initial begin
    env = new(vif);
    env.gen.count = 5;
    env.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  assign vif.uclktx = dut.utx.uclk;
  assign vif.uclkrx = dut.rtx.uclk;
  
endmodule