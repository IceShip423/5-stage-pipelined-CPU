`timescale 100fs/100fs

module MEM_WB(CLK,in_RegWrite,in_MemtoReg,RegWrite,MemtoReg,in_ALUOut,in_ReadData,
ALUOut,ReadData,in_WriteReg,WriteReg);

// input & output
input CLK;
input in_RegWrite,in_MemtoReg;
output reg RegWrite,MemtoReg;
input [31:0] in_ALUOut,in_ReadData;
output reg [31:0] ALUOut,ReadData;
input [4:0] in_WriteReg;
output reg [4:0] WriteReg;

initial begin
    RegWrite    =    0     ;
    MemtoReg    =    0     ;
    ALUOut      =    0     ;
    ReadData    =    0     ;
    WriteReg    =    0     ;    
end


always @(posedge CLK) begin
    RegWrite    =    in_RegWrite     ;
    MemtoReg    =    in_MemtoReg     ;
    ALUOut      =    in_ALUOut       ;
    ReadData    =    in_ReadData     ;
    WriteReg    =    in_WriteReg     ;
end

endmodule