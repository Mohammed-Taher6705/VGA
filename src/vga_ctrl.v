module vga_ctrl #
(
    parameter H_visible = 640 ,
    parameter H_front = 16,
    parameter H_sync = 96 ,
    parameter H_back = 48 ,

    parameter V_visible = 480 ,
    parameter V_front = 10,
    parameter V_sync = 2 ,
    parameter V_back = 33 
)

(
    input clk,
    input rst,
    output reg h_sync,
    output reg v_sync,
    output video_on,

    output reg [10:0] h_count,
    output reg [9:0]  v_count
);

    localparam H_Total = H_back + H_front + H_sync + H_visible ;
    localparam V_Total = V_back + V_front + V_sync + V_visible;

    localparam H_sync_start = H_visible + H_front ;
    localparam H_sync_end = H_visible + H_front + H_sync ;

    localparam V_sync_start = V_visible + V_front ;
    localparam V_sync_end = V_visible + V_front + V_sync ;

    assign video_on = (h_count < H_visible) && (v_count < V_visible);

    always @(posedge clk or posedge rst) 
    begin
        if(rst)
        begin
            h_count <= 0;
            v_count <= 0;
        end
        else
        begin
            if(h_count == H_Total-1)
            begin
                h_count <= 0;
                if(v_count == V_Total-1)
                begin
                    v_count <= 0;
                end
                else
                begin
                    v_count <= v_count +1;
                end 
            end
            else
            begin
            h_count <= h_count +1;
            end
        end
    end

    always @(*) 
    begin
        if(h_count >= H_sync_start && h_count < H_sync_end)
            h_sync = 1'b1;
        else 
            h_sync =1'b0;
    end

      always @(*) 
    begin
        if(v_count >= V_sync_start && v_count < V_sync_end)
            v_sync = 1'b1;
        else 
            v_sync =1'b0;
    end


    
endmodule