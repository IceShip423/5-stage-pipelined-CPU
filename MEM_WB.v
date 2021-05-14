module MEM_WB(CLKin_RegWrite,in_MemtoReg,RegWrite,MemtoReg,in_ALUOut,in_ReadData,
ALUOut,ReadData,in_WriteReg,WriteReg);

// input & output
input CLK;
input in_RegWrite,in_MemtoReg;
output reg RegWrite,MemtoReg;
input [31:0] in_ALUOut,in_ReadData;
output reg [31:0] ALUOut,ReadData;
input [4:0] in_WriteReg;
output reg [4:0] WriteReg;


always @(posedge CLK) begin
    RegWrite    =    in_RegWrite     ;
    MemtoReg    =    in_MemtoReg     ;
    ALUOut      =    in_ALUOut       ;
    ReadData    =    in_ReadData     ;
    WriteReg    =    in_WriteReg     ;
end

endmodule