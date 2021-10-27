`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 08:16:13 AM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    a,
    b,
    cin,
    s
    
    );
    
    parameter AND_DELAY = 2, OR_DELAY = 2, INVERTER_DELAY = 2;
    
    input a,b; input cin;
    output s;
    /*
    not #2 (abar,a);
    not #2 (bbar,b);
    not #2 (cinbar,cin);
    
    and #2 (temp1,a,b,cin);
    and #2 (temp2,abar,cinbar,b);
    and #2 (temp3,bbar,a,cinbar);
    and #2 (temp4,abar,bbar,cin);
    
    or #2 (s,temp1,temp2,temp3,temp4);*/
    
    assign s = (a & b & cin) + (b & ~a & ~cin) + (~b & a & ~cin) + (~b & ~a & cin);
    assign cout = (a & cin) + (b & cin) + (a & b);
    
endmodule
