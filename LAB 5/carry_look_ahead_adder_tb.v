`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 08:52:28 AM
// Design Name: 
// Module Name: carry_look_ahead_adder_tb
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


/*module carry_look_ahead_adder_tb(
    );
    
    reg [3:0] a,b;
    wire [4:0] result;
    
    carry_look_ahead_adder adder(.a(a), .b(b), .result(result));
   
    initial
    begin
    a = 4'b0000;
    b = 4'b0000;
    end
    
    initial
    begin
    #20 a = 4'b0001;
    #20 a = 4'b0011;
    #20 a = 4'b0111;
    end
    
    initial
    begin
    #20 b = 4'b0001;
    #20 b = 4'b0101;
    #20 b = 4'b1001;
    end

endmodule*/

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: claadder_gate_tb
//////////////////////////////////////////////////////////////////////////////////

module claadder_gate_tb(
    );
    
  defparam DUT.C1.AND_DELAY=2, DUT.C1.OR_DELAY=2, DUT.C1.XOR_DELAY=2,
   DUT.F0.XOR_DELAY=2, DUT.F0.AND_DELAY=2, DUT.F0.XOR_DELAY=2,//AND and OR and inverter
   DUT.F1.XOR_DELAY=2, DUT.F1.AND_DELAY=2, DUT.F1.XOR_DELAY=2,
   DUT.F2.XOR_DELAY=2, DUT.F2.AND_DELAY=2, DUT.F2.XOR_DELAY=2,
   DUT.F3.XOR_DELAY=2, DUT.F3.AND_DELAY=2, DUT.F3.XOR_DELAY=2; 

    reg [3:0] a, b;
	reg cin;
	wire [3:0] s;
	reg [3:0] s_expected;
	wire cout;
	reg cout_expected;
	integer k;
	integer test_failed;
    
    carry_look_ahead_adder DUT(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));//DUT
     
  task add_two_values;			// task definition starts here
    input [3 : 0] a_in;
    input [3 : 0] b_in;
    input c_in;
    output [3:0] sum;
    output cout;

    begin
        {cout, sum} = a_in + b_in + c_in;
    end
  endtask				// task definition ends here

    initial
    begin
        a = 4'h4; b=4'ha; cin=1'b0; test_failed = 0;
	    add_two_values(a, b,cin, s_expected, cout_expected);
        #30 $display("a=%h, b=%h, cin=%b, expected s=%h, count=%b, got s=%h, count=%b, at time=%t",a, b, cin, s_expected, cout_expected, s, cout, $time);
        if((cout_expected != cout) || (s_expected != s))
            test_failed = 1;
	    for (k=1; k < 5; k=k+1)
	    begin
           a = a + k; b= b - k; 
           add_two_values(a, b,cin, s_expected, cout_expected);
           #30 $display("a=%h, b=%h, cin=%b, expected s=%h, count=%b, got s=%h, count=%b, at time=%t",a, b, cin, s_expected, cout_expected, s, cout, $time);
           if((cout_expected != cout) || (s_expected != s))
               test_failed = 1;
	    end
	    a = 4'h8; b=4'h3; cin=1'b1;
        add_two_values(a, b,cin, s_expected, cout_expected);
        #30 $display("a=%h, b=%h, cin=%b, expected s=%h, count=%b, got s=%h, count=%b, at time=%t",a, b, cin, s_expected, cout_expected, s, cout, $time);
        if((cout_expected != cout) || (s_expected != s))
            test_failed = 1;
        for (k=2; k < 5; k=k+1)
        begin
           a = a - k; b= b + k; 
           add_two_values(a, b,cin, s_expected, cout_expected);
           #30 $display("a=%h, b=%h, cin=%b, expected s=%h, count=%b, got s=%h, count=%b, at time=%t",a, b, cin, s_expected, cout_expected, s, cout, $time);
           if((cout_expected != cout) || (s_expected != s))
               test_failed = 1;
       end
	    $display("Simulation Done");
	    if(test_failed == 1)
	       $display("Test Failed");
	    else
	       $display("Test Passed");

    end
        
endmodule

