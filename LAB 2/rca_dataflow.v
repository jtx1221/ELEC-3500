


module rca_dataflow( a, b, cin , s, cout );

input [3:0]a;
input [3:0]b;
input cin;
output [3:0]s;
output cout;
wire p [3:0], g[3:0];
wire [2:0] c;


fulladder_dataflow adder1(b[0], a[0], cin, s[0], p[0], g[0]);
    CLA lookAhead1(cin, p[0], g[0], c[0]);
    fulladder_dataflow adder2(b[1], a[1], c[0], s[1], p[1], g[1]);
    CLA lookAhead2(c[0], p[1], g[1], c[1]);
    fulladder_dataflow adder3(b[2], a[2], c[1], s[2], p[2], g[2]);
    CLA lookAhead3(c[1], p[2], g[2], c[2]);
    fulladder_dataflow adder4(b[3], a[3], c[2], s[3], p[3], g[3]);
    CLA lookAhead4(c[2], p[3], g[3], cout);  


endmodule
