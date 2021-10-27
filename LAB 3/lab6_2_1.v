
module lab6_2_1(Clk, Clear, Enable, Q);

input Clk ; 
input Enable;
input Clear;
output [7:0] Q;

wire t0 = Enable & Q[0];

FlipFlop F0(Clk, Clear,Enable, Q[0]   ); 

wire t1 = t0& Q[1];

FlipFlop F1(Clk, Clear, t0, Q[1]  ); 

wire t2= t1&Q[2];
FlipFlop F2(Clk, Clear, t1, Q[2] ); 

wire t3 = t2 & Q[3];
FlipFlop F3( Clk, Clear , t2, Q[3] ); 


wire t4 = t3 & Q[4];

FlipFlop F4( Clk, Clear, t3, Q[4]);

wire t5 = t4 & Q[5];

FlipFlop F5(Clk , Clear, t4, Q[5]);

wire t6 = t5 & Q[6];

FlipFlop F6 (Clk, Clear, t5, Q[6]);


FlipFlop F7 (Clk, Clear, t6, Q[7]);







endmodule
