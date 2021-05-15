module WB_IF(PC,PCF,CLK);

// input & output
input [31:0] PC;
output reg [31:0] PCF;
input CLK;

initial begin
    PC=0;
end

always @(posedge CLK) begin
    PCF=PC;
end

endmodule