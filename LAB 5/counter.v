`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 10:07:17 AM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* use_dsp48 = "no" *)
module counter(
    input clk,
    input reset,
    input enable,
    input up_dn,
    output reg [7:0] count
    );
    wire [7:0] q;
    
    clk_wiz_0 clk_1(clk_5M, locked, clk);
        
    clk_div clk_div_1(clk_5M, enable, clk_out);
    
    c_counter_binary_0 counter_1(clk_out,up_dn,q);
    
    always @ (posedge clk_out)
    begin
    if (reset) begin
    count <= 8'b0;
    end else begin
    count <= q;
    end
    end
    
    /*
    always @ (posedge clk_out)
    begin
    
    if (reset) begin
    count <= 8'b0;
    end else if (up_dn) begin
    count <= count + 1;
    end else begin
    count <= count - 1;
    end
    
    end
    */
    
endmodule
