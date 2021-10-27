`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 10:31:41 AM
// Design Name: 
// Module Name: sum
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


module sum(v, z, m, circuitA);
    input [3:0] v;
    output z;
    output [3:0] m;
    output [2:0] circuitA;
   
    comparator out(v[3:0], z);
    circuitA A(v[3:0], circuitA[2:0]);
    mux mux1(v[3], 1'b0, z, m[3]);
    mux mux2(v[2], circuitA[2], z, m[2]);
    mux mux3(v[1], circuitA[1], z, m[1]);
    mux mux4(v[0], circuitA[0], z, m[0]);
endmodule
