`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 10:03:47 AM
// Design Name: 
// Module Name: clk_div_5M
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


module clk_div_5M(
input clk_in,
    //input reset,
    input enable,
    output reg clk_out
);

reg [23:0] counter;


always @ (posedge clk_in)
begin

   /* if(reset)
    begin
        clk_out = 0;
        counter <= 0;
    end*/
    
    if (enable)
    begin
        counter <= counter + 1;
        if(counter == 5000000)
        begin
            counter <= 0;
            clk_out = ~clk_out;
        end
    end
end
endmodule
