`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2018 04:41:13 PM
// Design Name: 
// Module Name: lab9_3_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bcd(input [3:0] A, output CA, output CB, output CC, output CD,output CE, output CF, output CG);
reg [6:0] T;

assign CA = T[0];
assign CB = T[1];
assign CC = T[2];
assign CD = T[3];
assign CE = T[4];
assign CF = T[5];
assign CG = T[6];

always@(*)
    begin
        case(A)
            4'd0: T = 7'b1000000;
            4'd1: T = 7'b1111001;
            4'd2: T = 7'b0100100;
            4'd3: T = 7'b0110000;
            4'd4: T = 7'b0011001;
            4'd5: T = 7'b0010010;
            4'd6: T = 7'b0000010;
            4'd7: T = 7'b1111000;
            4'd8: T = 7'b0000000;
            4'd9: T = 7'b0010000;
        endcase
    end
endmodule

//7 Segment Driver:

// Driver of the Seven-Segment Display
module display_driver(input CLK100MHZ,input rst,
input [3:0] D7,input [3:0] D6,input [3:0] D5,input [3:0] D4,input [3:0] D3,input [3:0] D2,input [3:0] D1,input [3:0] D0,
output CA,output CB,output CC,output CD,output CE,output CF,output CG, output reg [7:0] AN);

reg [3:0] number;
reg [19:0] counter ;

always@(posedge CLK100MHZ)
    begin
        if(rst)
            counter <= 20'd0;
        else
        
        if(counter <= 20'd999999)
            counter <= counter + 20'd1;
        else
            counter <= 20'd0;
    end

always@(*)
    begin
        case(counter[19:17])
            3'd0: number = D0;
            3'd1: number = D1;
            3'd2: number = D2;
            3'd3: number = D3;
            3'd4: number = D4;
            3'd5: number = D5;
            3'd4: number = D6;
            3'd5: number = D7;
            default: number = 4'h0;
        endcase
end

always@(*)
    begin
        case(counter[19:17])
            3'd0: AN = 8'b11111110;
            3'd1: AN = 8'b11111101;
            3'd2: AN = 8'b11111011;
            3'd3: AN = 8'b11110111;
            3'd4: AN = 8'b11101111;
            3'd5: AN = 8'b11011111;
            3'd6: AN = 8'b10111111;
            3'd7: AN = 8'b01111111;
            
            default: AN = 8'b11111111;
        endcase
end

bcd BCD1(number,CA,CB,CC,CD,CE,CF,CG);

endmodule







module alarmClock(
input CLK100MHZ, 
input rst, 
input fast_count, 
input hour_inc, 
input minute_inc, 
input alarmSet,
input timeSet, 
output [7:0] seg, 
output [7:0] AN, 
output [1:0] LED
);


reg [26:0] clock;
reg [26:0] clock2; // f=10Hz
reg [26:0] clock3; // f=5Mhz
reg [16:0] counter; // f=1Hz
reg [16:0] displayCounter;
reg [16:0] AlarmCounter;
reg [1:0] LED_ON;

wire [5:0] sec,min,hour;


wire [3:0] D0;
wire [3:0] D1;
wire [3:0] D2;
wire [3:0] D3;
wire [3:0] D4;
wire [3:0] D5;
wire [3:0] D6;
wire [3:0] D7;

wire CA;
wire CB;
wire CC;
wire CD;
wire CE;
wire CF;
wire CG;
assign seg[0]=CA;
assign seg[1]=CB;
assign seg[2]=CC;
assign seg[3]=CD;
assign seg[4]=CE;
assign seg[5]=CF;
assign seg[6]=CG;
assign seg[7]=0;


always@(posedge CLK100MHZ) // 1Hz from 100MHz
    begin
        if(clock == 27'd99999999)
            clock <= 27'd0;
        else
            clock <= clock + 27'd1;
end

always@(posedge CLK100MHZ) // 100Hz from 100MHz
    begin
        if(clock2 == 27'd999999)
            clock2 <= 27'd0;
        else
            clock2 <= clock2 + 27'd1;
end

always@(posedge CLK100MHZ) // 5MHz from 100MHz
  begin
    if(clock3 == 27'd19) // 100M/20 = 5M
      clock3 <= 27'd0;
    else
      clock3 <= clock3 + 27'd1;
end

always @(posedge CLK100MHZ) // Counter
    begin
       
        if(rst)
        begin
            counter <= 17'd0;
            displayCounter <= 17'd0;
            LED_ON[0] = 0;
            LED_ON[1] = 0;
         end
        else if(alarmSet)
            LED_ON[1] = 1;
        else if(!alarmSet)
            LED_ON[1] = 0;
        else if(fast_count)
            begin
           if (clock2 == 27'd1)
            if (counter == 17'd86399)
            begin
                counter <= 17'd0;
                displayCounter <= 17'd0;
            end
            else
                begin
                counter <= counter + 17'd1;
                displayCounter <= displayCounter + 17'd1;
                end
            else
                begin
                counter <= counter;
                displayCounter <= displayCounter;
                end
            end
           else // if(fast_count == 1'b0)
           
        begin
        if((counter/3600)%60>12)
               displayCounter <= 17'd3600;
               
               LED_ON[0] = 1;
            
                        
        if (clock == 27'd1)            
            if (counter == 17'd86399)
                begin
                    counter <= 17'd0;
                    displayCounter <= 17'd0;
                    LED_ON[0] = 0;
                end
         //if counter reacher 43199 (43199+1 / 60/60 = 12) set LED to on i.e. PM
         
          //Increment Minutes
         else if(timeSet && minute_inc)
            begin
                counter <= counter + 17'd60;
                displayCounter <= displayCounter + 17'd60;
            end
         //Increment Hours           
         else if(timeSet && hour_inc)
            if((counter/3600)%60<24)
                begin
                    counter <= counter + 17'd3600;
                    displayCounter <= displayCounter + 17'd3600;
                end
            else
                begin
                    counter <= counter;
                    displayCounter <= displayCounter;
                 end
        else
            begin
                counter <= counter + 17'd1;
                displayCounter <= displayCounter + 17'd1;
            end
        
       
    end
       
    
end

assign sec = displayCounter % 60;
assign min = (displayCounter/60) % 60;
assign hour = (displayCounter / 3600) % 60;

assign D0 = sec % 10;
assign D1 = sec / 10;
assign D2 = min % 10;
assign D3 = min / 10;
assign D4 = hour % 10;
assign D5 = hour / 10;
assign D6 = 4'd0;
assign D7 = 4'd0;
assign LED[0] = LED_ON[0];
assign LED[1] = LED_ON[1];
display_driver d_d1( CLK100MHZ,rst,D7,D6,D5,D4,D3,D2,D1,D0,CA,CB,CC,CD,CE,CF,CG,AN );

endmodule
