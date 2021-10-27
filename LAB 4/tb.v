

module tb();



reg [3:0]a;
reg [3:0]b;



wire [3:0]s;



lab9_1_1 tb( a, b, cin, s,cout);
initial 
begin 
a = 4'b0001;
#40 a = 4'b0000;
end 

initial 
begin 
b = 4'b0001;
#40 b = 4'b0011;
end 

endmodule
