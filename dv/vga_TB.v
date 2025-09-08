`timescale 1ns/1ps

module vga_TB;

  reg clk;
  reg rst;
  reg [2:0] sw;

  wire h_sync;
  wire v_sync;
  wire red;
  wire green;
  wire blue;

  vga_top dut (
    .clk(clk),
    .rst(rst),
    .h_sync(h_sync),
    .v_sync(v_sync),
    .sw(sw),
    .red(red),
    .green(green),
    .blue(blue)
  );

  // 25 MHz pixel clock (40 ns period)
  initial clk = 0;
  always #20 clk = ~clk;

  // Frame parameters
  localparam integer H_TOTAL = 800;
  localparam integer V_TOTAL = 525;
  localparam integer FRAME_PIXELS = H_TOTAL * V_TOTAL; // 420000
  localparam real    CLK_PERIOD = 40.0; // ns
  localparam integer FRAME_TIME = FRAME_PIXELS * CLK_PERIOD; // 16.8 ms in ns

  initial begin
    // Reset
    rst = 1;
    sw  = 3'b000;
    #200;
    rst = 0;

    // Frame 1: Red
    sw = 3'b100;
    #(FRAME_TIME);

    // Frame 2: Green
    sw = 3'b010;
    #(FRAME_TIME);

    // Frame 3: Blue
    sw = 3'b001;
    #(FRAME_TIME);

    $stop;
  end

endmodule
