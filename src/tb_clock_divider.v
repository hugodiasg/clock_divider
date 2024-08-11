`include "./clock_divider.v"

module tb_clock_divider;
    // Params
  localparam WIDTH=8;  
  localparam CLK_PERIOD=10;  

  // Regs and wires
  reg clk_in, nrst;
  reg [WIDTH-1:0] scale;
  wire clk_out;

    // Instantiating the clock_divider
  clock_divider 
  #(
     .WIDTH ( WIDTH )
  )
  clock_divider_0
  (
  .clk_in   (clk_in), 
  .nrst     (nrst),
  .scale    (scale),
  .clk_out  (clk_out)
  );

initial begin 
    $display("Dumping vars");
    $dumpfile("tb_clock_divider.vcd");
    $dumpvars(0, clock_divider_0);

    $display("Initializing...");
    nrst = 1;
    scale = 3;
    clk_in = 0; //initializing the clock 
    # 11
    nrst = 0; // reseting the clock_divider
    //# 2
    # 10
    nrst = 1;
    # 149
    scale = 6;
    # 1
    nrst = 0;
    //# 1
    # 15
    nrst = 1;
    
end

// Clock signal
always begin 
    # (CLK_PERIOD/2) clk_in = ~ clk_in;
end

// Finish
always begin 
    # (40*CLK_PERIOD)
    $finish;
end
endmodule
