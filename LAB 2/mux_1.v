


module mux_1(
    input x,
    input y,
    input s,
    output m
    );
    wire c,d;
    assign c=x&~s;
    assign d=s&y;
    assign m=c|d;
    
    
endmodule
