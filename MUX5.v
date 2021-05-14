module MUX32(A0,A1,C,Control);

// input & output
input [4:0] A0,A1;
output [4:0] C;
input Control;

assign C = Control == 0 ? A0 : A1；

endmodule