module RegisterFile(A1,A2,A3,WD,RD1,RD2,CLK,RegWriteW);

// input & output
input [4:0] A1,A2,A3;
input [31:0] WD;
output reg [31:0] RD1,RD2;
input CLK;
input RegWriteW;

// registers
reg [31:0] REG[31:0];



always @(negedge CLK) begin // read in the second half
    RD1 <= REG[(A1)];
    RD2 <= REG[(A2)];
end


always @(posedge CLK) begin // write in the first half
    if (RegWriteW==1)
        REG[(A3)]<=WD;
end




endmodule
