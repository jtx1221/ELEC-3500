


module lAB6_1_5(Clk,ShiftIn, ShiftEn, ShiftOut, ParallelOut);
input Clk;
input ShiftIn;
input ShiftEn;
output ShiftOut;
output[3:0] ParallelOut;
    
reg [3:0] shift_reg;
     
always @(posedge Clk)
if (ShiftEn)
shift_reg <= {shift_reg[2:0], ShiftIn};
 assign ShiftOut = shift_reg[3];
 assign ParallelOut = shift_reg;
endmodule
