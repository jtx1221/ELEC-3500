

module tb();
 reg Clk, Enable, Clear;
   wire [7:0]Q;
   
   
    lab6_2_1 tb (Clk, Clear, Enable, Q);
    
  initial begin
       Clk = 0;
       end 
       always #5 Clk = ~Clk;
       
       initial begin
       Enable = 0;
       #20 Enable = 1;
       #100 Enable = 0;
       #80 Enable = 1;
       end
       
       initial begin
       Clear = 0;
       #40 Clear = 1;
       end 

endmodule
