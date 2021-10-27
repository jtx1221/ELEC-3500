

module fulladder_dataflow( a, b, cin , s, p, g );

input a;
input b;
input cin;
output s;
output p;
output g; 
 
 
   assign s = a ^ b ^ cin;
   assign p = a|b;
   assign g = a&b;

    
endmodule
