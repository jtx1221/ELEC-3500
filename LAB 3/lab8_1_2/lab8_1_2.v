`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 10:00:07 AM
// Design Name: 
// Module Name: lab8_1_2
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


module lab8_1_2(
input [3:0] v,
output z,
output [7:0] an,
output[6:0] seg0
    );
    wire [3:0] m;
   sum(v, z, m);
    bcdto7segment(m, an, seg0);
endmodule
