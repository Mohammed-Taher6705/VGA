module vga_top
(
    input clk,
    input rst,
    output h_sync,
    output v_sync,
    input [2:0] sw,
    output red,
    output green,
    output blue
);

wire video_on;
wire [10:0] h_count;
wire [9:0]  v_count;

vga_ctrl u_ctrl
(
    .clk(clk),
    .rst(rst),
    .h_sync(h_sync),
    .v_sync(v_sync),
    .video_on(video_on),
    .h_count(h_count),
    .v_count(v_count)
);

rgb_gen u_rgb_gen
(
    .video_on(video_on),
    .sw(sw),
    .red(red),
    .green(green),
    .blue(blue)
);
    
endmodule