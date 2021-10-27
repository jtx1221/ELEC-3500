`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2019 08:18:41 PM
// Design Name: 
// Module Name: lab6_1_2
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

module lab6_1_2(  D, Clk , reset, set, load, Q);

input [3:0]D;
input Clk;
input reset;
input set;
input load;
output  reg [3:0]Q;

always @(posedge Clk)

if (reset)
begin
Q <= 4'b0000;
end 

else if (set)
begin
Q <= 4'b1111;
end

else if (load)
begin

Q<=D;

end



   
endmodule
