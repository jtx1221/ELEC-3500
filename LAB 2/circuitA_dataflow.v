`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2019 04:08:45 PM
// Design Name: 
// Module Name: circuitA_dataflow
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


module circuitA_dataflow( v, m);

input [2:0]v;
output[2:0]m;

assign m[2] = v[2] & v[1];
assign m[1] = v[2] & ~v[1];
assign m[0] = (v[2]& v[0])| ( ~v[2] & v[1] &v[0]);

endmodule
