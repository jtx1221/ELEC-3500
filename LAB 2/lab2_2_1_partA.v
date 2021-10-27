`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 06:50:09 PM
// Design Name: 
// Module Name: lab2_2_1_partA
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


module lab2_2_1_partA(  v , z ,an, seg0 );
    input [3:0] v;
    output z;
    output [7:0] an;
    output[6:0] seg0;

 wire [3:0] m;
    lab2_2_1_partA convert(v, z, m);
    bcdto7segment_dataflow(m, an, seg0);
endmodule

    
   
    
