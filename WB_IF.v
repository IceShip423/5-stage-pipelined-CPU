`timescale 100fs/100fs

module WB_IF(PC,PCF,CLK,ENABLE);

// input & output
input [31:0] PC;
output reg [31:0] PCF;
input CLK,ENABLE;

initial begin
    PCF=0;
end

always @(posedge CLK) begin
    if(ENABLE==1)
        PCF = PC;
end

endmodule