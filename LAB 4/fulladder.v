

module fulladder #(parameter d=2)(
 input a,
   input b,
   input cin,
   output s,
   output p,
   output g
   );
   
   
   
 xor #(d)(a,b,cin,s);
or #(d)(a,b,p);
and #(d)(a,b,g);


endmodule 