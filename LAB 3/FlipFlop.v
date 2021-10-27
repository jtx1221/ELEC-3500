

module FlipFlop( Clk, Clear, Enable, Q);

input Clk;
input Clear;
input Enable;
output  reg Q;




always @( posedge Clk or negedge Clear)
begin

if(~Clear)
begin 
Q<= 1'b0;
end

else
begin 

Q<= Q^ Enable ;
end

end 


  
endmodule
