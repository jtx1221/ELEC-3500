
module tb();

reg  Clock , Clear, Load, Enable;
wire [3:0]Q;

lab6_2_3 tb (.Clock(Clock), .Enable(Enable), .Clear(Clear), .Load(Load), .Q(Q));
initial 
begin 
Clock = 0 ;
end 

always #5 Clock=~Clock ;

initial begin
    Enable = 0;
    #20 Enable = 1;
    #150 Enable = 0;
    #40 Enable = 1;
    end
    
    initial begin
    Clear = 0;
    #40 Clear = 1;
    #20 Clear = 0;
    end
    
    initial begin
    Load = 0;
    #80 Load = 1;
    #10 Load = 0;
    end






endmodule
