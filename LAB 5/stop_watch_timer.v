`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 09:57:06 AM
// Design Name: 
// Module Name: stop_watch_timer
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


module stop_watch_timer(
    input reset,
    input enable,
    input clk,
    output [7:0] an,
    output [7:0] seg
    );
    
    clk_wiz_0 clk_1(clk_5M, clk);

            
    clk_div_5M clk_div_1(clk_5M, enable, clk_1Hz);
    
    clk_div_one_tenth clk_div_2(clk_1Hz, enable, clk_one_tenth);
    
    c_counter_f counter_1(clk_1Hz,f);
    
    bcd_conversion conversion_f(f,seg,an);
    
endmodule