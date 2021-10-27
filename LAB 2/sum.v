

module sum(v, z, m, circuitA);
    input [3:0] v;
    output z;
    output [3:0] m;
    output [2:0] circuitA;
   
    comparator_dataflow out(v[3:0], z);
    lab2_circuitA_dataflow A(v[3:0], circuitA[2:0]);
    deisgn1_1 mux1(v[3], 1'b0, z, m[3]);
    deisgn1_1 mux2(v[2], circuitA[2], z, m[2]);
    deisgn1_1 mux3(v[1], circuitA[1], z, m[1]);
    deisgn1_1 mux4(v[0], circuitA[0], z, m[0]);
    
endmodule


