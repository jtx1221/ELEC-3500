`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 08:15:22 AM
// Design Name: 
// Module Name: carry_look_ahead_adder
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


module carry_look_ahead_adder
    (
    input [3:0] a,
    input [3:0] b,
    output [4:0] result 
    );
    
    parameter AND_DELAY = 3, OR_DELAY = 3, INVERTER_DELAY = 1, XOR_DELAY = 4;
    
    wire [3:0] p,g;
    wire [3:0] s;
    wire [4:0] c;
    
    fulladder F0
    (
        a[0],
        b[0],
        c[0],
        s[0]
        );
    
    fulladder F1
    (
        a[1],
        b[1],
        c[1],
        s[1]
        );
                
    fulladder F2
    (
        a[2],
        b[2],
        c[2],
        s[2]
        );
                                
   fulladder F3
   (
       a[3],
       b[3],
       c[3],
       s[3]
       ); 
   
   and #3 (g[0],a[0],b[0]);
   and #3 (g[1],a[1],b[1]);
   and #3 (g[2],a[2],b[2]);
   and #3 (g[3],a[3],b[3]);
   
   or #3 (p[0],a[0],b[0]);
   or #3 (p[1],a[1],b[1]);
   or #3 (p[2],a[2],b[2]);
   or #3 (p[3],a[3],b[3]);
   
   assign c[0] = 1'b0;
   
   and #3 (temp1,p[0],c[0]);
   and #3 (temp2,p[1],c[1]);
   and #3 (temp3,p[2],c[2]);
   and #3 (temp4,p[3],c[3]);
   
   or #3 (c[1],g[0],temp1);
   or #3 (c[2],g[1],temp2);
   or #3 (c[3],g[2],temp3);
   or #3 (c[4],g[3],temp4);
   
   assign result = {c[4],s};
   
       
   /*assign #3 g[0] = a[0] & b[0];
   assign #3 g[1] = a[1] & b[1];
   assign #3 g[2] = a[2] & b[2];
   assign #3 g[3] = a[3] & b[3];
   
   assign #3 p[0] = a[0] | b[0];
   assign #3 p[1] = a[1] | b[1];
   assign #3 p[2] = a[2] | b[2];
   assign #3 p[3] = a[3] | b[3];
   
   assign c[0] = 1'b0;
   assign #6 c[1] = g[0] + (p[0] & c[0]);
   assign #6 c[2] = g[1] + (p[1] & c[1]);
   assign #6 c[3] = g[2] + (p[2] & c[2]);
   assign #6 c[4] = g[3] + (p[3] & c[3]);
   
   assign result = {c[4],s};       
   */                                     
    
endmodule
