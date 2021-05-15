`timescale 100fs/100fs

module ID_EX(CLK,in_RegWrite,in_MemtoReg,in_MemWrite,in_Branch,in_ALUControl,in_ALUSrc,in_ALUSrc_shamt,in_RegDst,
RegWrite,MemtoReg,MemWrite,Branch,ALUControl,ALUSrc,ALUSrc_shamt,RegDst,
in_RD1,in_RD2,in_Rt,in_Rd,in_shamt,in_SignImm,in_PCplus4,
RD1,RD2,Rt,Rd,shamt,SignImm,PCplus4);

// input & output
input CLK;
input in_RegWrite,in_MemtoReg,in_MemWrite,in_Branch,in_ALUSrc,in_ALUSrc_shamt,in_RegDst;
output reg RegWrite,MemtoReg,MemWrite,Branch,ALUSrc,ALUSrc_shamt,RegDst;
input [3:0] in_ALUControl;
output reg [3:0] ALUControl;
input [4:0] in_Rt,in_Rd,in_shamt;
output reg [4:0] Rt,Rd,shamt;
input [31:0] in_RD1,in_RD2,in_PCplus4,in_SignImm;
output reg [31:0] RD1,RD2,PCplus4,SignImm;

initial begin
    RegWrite         =          0     ;
    MemtoReg         =          0     ;
    MemWrite         =          0     ;
    Branch           =          0     ;
    ALUControl       =          0     ;
    ALUSrc           =          0     ;
    ALUSrc_shamt     =          0     ;
    RegDst           =          0     ;
    RD1              =          0     ;
    RD2              =          0     ;
    Rt               =          0     ;
    Rd               =          0     ;
    shamt            =          0     ;
    SignImm          =          0     ;
    PCplus4          =          0     ;
end


always @(posedge CLK) begin
    RegWrite         =          in_RegWrite          ;                     
    MemtoReg         =          in_MemtoReg          ;                    
    MemWrite         =          in_MemWrite          ;                      
    Branch           =          in_Branch            ;                    
    ALUControl       =          in_ALUControl        ;                          
    ALUSrc           =          in_ALUSrc            ;                   
    ALUSrc_shamt     =          in_ALUSrc_shamt      ;                        
    RegDst           =          in_RegDst            ;                   
    RD1              =          in_RD1               ;                     
    RD2              =          in_RD2               ;                
    Rt               =          in_Rt                ;                     
    Rd               =          in_Rd                ;                     
    shamt            =          in_shamt             ;                      
    SignImm          =          in_SignImm           ;                     
    PCplus4          =          in_PCplus4           ;
end

endmodule