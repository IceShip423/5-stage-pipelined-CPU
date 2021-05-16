`timescale 100fs/100fs

module SignExtend(num16,num32);

// input & output
input signed [15:0] num16;
output reg signed [31:0] num32;

initial begin
    num32=0;
end

always @(num16) begin
    num32=num16;
end

endmodule