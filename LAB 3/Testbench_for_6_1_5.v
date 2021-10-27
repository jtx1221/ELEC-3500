
module tb5();

reg Clk, ShiftIn, ShiftEn;     
    
    wire [3:0] ParallelOut;  
    wire ShiftOut;   


lAB6_1_5 tb(.Clk(Clk), .ShiftIn(ShiftIn), .ShiftEn(ShiftEn), .ShiftOut(ShiftOut), .ParallelOut(ParallelOut));



initial begin
        Clk = 0;
        end
        always #10 Clk = ~Clk;           
        
        
        
        initial begin
        ShiftEn = 0;
        #40 ShiftEn = 1;
        #40 ShiftEn = 0;
        #40 ShiftEn = 1;
        #40 ShiftEn = 0;
        #80 ShiftEn = 1;
        #40 ShiftEn = 0;
        #40 ShiftEn = 1;
        #40 ShiftEn = 0;
        end
        
   
        initial begin
        ShiftIn = 1;
        #200 ShiftIn = 0;
        end
        
    endmodule