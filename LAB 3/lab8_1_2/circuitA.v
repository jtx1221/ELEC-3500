`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 10:30:13 AM
// Design Name: 
// Module Name: circuitA
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


module circuitA( v, m);
input [2:0]v;
output[2:0]m;

assign m[2] = v[2] & v[1];
assign m[1] = v[2] & ~v[1];
assign m[0] = (v[2]& v[0])| ( ~v[2] & v[1] &v[0]);



endmodule
