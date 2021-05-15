`timescale 100fs/100fs

module SignExtend(num16,num32);

// input & output
input signed [15:0] num16;
output signed [31:0] num32;

assign num32=num16;

endmodule