`timescale 100fs/100fs

module MUX32(A0,A1,C,Control);

// input & output
input [31:0] A0,A1;
output [31:0] C;
input Control;

assign C = (Control == 0) ? A0 : A1;

endmodule