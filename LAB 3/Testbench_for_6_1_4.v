


module Testbench_4();



 reg Clk, ShiftIn, load, ShiftEn;     //Inputs registers
    reg [3:0] ParallelIn;
    wire [3:0] RegContent;  
    wire ShiftOut;    

lab6_1_4 tb4 (.Clk(Clk), .ShiftIn(ShiftIn), .ParallelIn(ParallelIn), .load(load), .ShiftEn(ShiftEn), .ShiftOut(ShiftOut), .RegContent(RegContent));

 initial begin
        Clk = 0;
        end
        always #10 Clk = ~Clk;           //10 units, switch clock
        
        //load
        initial begin
        load = 0;
        #60 load = 1;                     //High at 20
        #20 load = 0;
        #120 load = 1;
        #20 load = 0;
        #55 load = 1;
        #20 load = 0;
        #65 load = 1;
        #20 load = 0;                    //Low 150 LATER (150+20)               
        end
        
        //ShiftEn
        initial begin
        ShiftEn = 0;
        #100 ShiftEn = 1;
        #220 ShiftEn = 0;
        end
        
        //ShiftIn
        initial begin
        ShiftIn = 1;
        end
        
        //parallelin
        initial begin
        ParallelIn [3:0] = 4'b0000;
        #20 ParallelIn [3:0] = 4'b0101;
        #160 ParallelIn[3:0] = 4'b1001;
        end



endmodule
