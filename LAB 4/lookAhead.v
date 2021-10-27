`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2019 02:00:02 PM
// Design Name: 
// Module Name: lookAhead
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


module lookAhead(
   input cin,
   input p,
   input g,
   output cout
    );
    
   wire temp1;
   
   and ( p,cin,temp1);
   or (g,temp1, cout);
   
    
    
    
    
endmodule
