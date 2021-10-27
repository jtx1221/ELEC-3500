

module lab9_1_1(
input [3:0] a,
    input [3:0] b,
    input  cin,
    output [3:0] s,
     output cout

    );
    wire p [3:0], g[3:0];
        wire [2:0] c;
        fulladder adder1(b[0], a[0], cin, s[0], p[0], g[0]);
        lookAhead L1(cin, p[0], g[0], c[0]);
        fulladder adder2(b[1], a[1], c[0], s[1], p[1], g[1]);
        lookAhead L2(c[0], p[1], g[1], c[1]);
        fulladder    adder3(b[2], a[2], c[1], s[2], p[2], g[2]);
         lookAhead L3(c[1], p[2], g[2], c[2]);
        fulladder adder4(b[3], a[3], c[2], s[3], p[3], g[3]);
        lookAhead L4(c[2], p[3], g[3], cout);  
        
    
    
    
    
endmodule
