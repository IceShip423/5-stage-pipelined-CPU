`timescale 100fs/100fs

module EX_MEM(CLK,in_RegWrite,in_MemtoReg,in_MemWrite,in_Branch,RegWrite,MemtoReg,MemWrite,Branch,
in_ALUOut,in_zero,in_WriteData,in_WriteReg,in_PCBranch,ALUOut,zero,WriteData,WriteReg,PCBranch);

// input & output
input CLK;
input in_RegWrite,in_MemtoReg,in_MemWrite,in_Branch;
output reg RegWrite,MemtoReg,MemWrite,Branch;
input [31:0] in_ALUOut,in_WriteData,in_PCBranch;
output reg [31:0] ALUOut,WriteData,PCBranch;
input [4:0] in_WriteReg;
output reg [4:0] WriteReg;
input in_zero;
output reg zero;

always @(posedge CLK) begin
    RegWrite    =    in_RegWrite     ;
    MemtoReg    =    in_MemtoReg     ;
    MemWrite    =    in_MemWrite     ;
    Branch      =    in_Branch       ;
    ALUOut      =    in_ALUOut       ;
    zero        =    in_zero         ;
    WriteData   =    in_WriteData    ;
    WriteReg    =    in_WriteReg     ;
    PCBranch    =    in_PCBranch     ;
end

endmodule