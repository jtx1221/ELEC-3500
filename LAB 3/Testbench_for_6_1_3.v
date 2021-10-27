`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 10:49:51 AM
// Design Name: 
// Module Name: test_bench3
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


module test_bench3();
reg Clk;
reg ShiftIn;
wire ShiftOut;


 lab6_1_3 shift1(Clk, ShiftIn, ShiftOut);
 
 
initial 
begin

Clk =0;

end

always #10 Clk = ~Clk; 


initial 
begin 

ShiftIn = 0 ;

#20 ShiftIn = 1;
#40 ShiftIn = 0; 
#20 ShiftIn = 1;
#40 ShiftIn = 0;                                  
 end



 







endmodule
