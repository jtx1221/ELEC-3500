

module lab2_2_2(x ,y);

input [3:0]x;
output [4:0]y;



assign y[4] = (x[3]&~x[1])|(x[1]&x[2]);
assign y[3] = (x[2]&~x[1]) | (x[3]&x[0]) |(~x[2]&x[1]&x[0]);
assign y[2] = (x[3]&~x[1]&~x[0])|(~x[3]&~x[1]&x[0])|(~x[2]&x[1]&~x[0]);
assign y[1] = (~x[3]&~x[1]&~x[0])| (x[2]&x[1]&x[0])| (~x[2]&x[1]&~x[0]);
assign y[0] = (~x[3]&~x[2]&~x[1]) | (~x[2]&x[1]&x[0])| (x[2]&x[1]&~x[0]);

endmodule
