`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2019 08:47:52 AM
// Design Name: 
// Module Name: bcdto7segment_dataflow
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


module bcdto7segment_dataflow(
    input [3:0]x,
    output [7:0]an,
    output [6:0]seg
    );
assign an[7:0]=8'b11111110;
            assign seg[0]=(x[2]&~x[1]&~x[0])|(~x[3]&~x[2]&~x[1]&x[0]);
            assign seg[1]=(x[2]&~x[1]&x[0])|(x[2]&x[1]&~x[0]);
            assign seg[2]= ~x[2]&x[1]&~x[0];
            assign seg[3]=(x[2]&~x[1]&~x[0])|(~x[3]&~x[2]&~x[1]&x[0])|(x[2]&x[1]&x[0]);
            assign seg[4]=x[0]|(x[2]&~x[1]&~x[0]);
            assign seg[5]=(x[1]&x[0])|(~x[3]&~x[2]&x[0])|(~x[3]&~x[2]&x[1]);
            assign seg[6]=(~x[3]&~x[2]&~x[1])|(x[2]&x[1]&x[0]);
endmodule
