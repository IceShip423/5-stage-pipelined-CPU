`include "ALU.v"
`include "Clock.v"
`include "ControlUnit.v"
`include "EX_MEM.v"
`include "ID_EX.v"
`include "IF_ID.v"
`include "InstructionRAM.v"
`include "MainMemory.v"
`include "MEM_WB.v"
`include "MUX5.v"
`include "MUX32.v"
`include "RegisterFile.v"
`include "SignExtend.v"
`include "WB_IF.v"

`timescale 100fs/100fs

module CPU;


/* CLK
-----------------------
*/

wire CLK;

clock clock_1(
    // out
    .CLK       (CLK)
);


/* MUX32_1
------------------------
*/

wire [31:0] PC;

MUX32 MUX32_1(
    .A0             (PC_F+4),     
    .A1             (PCBranch_M),    
    .Control        (zero_M & Branch_M),
    // out        
    .C              (PC)   
);



/* stage1: IF
------------------------
*/

wire [31:0] PC_F;

WB_IF WB_IF_1(
    .CLK        (CLK),
    .PC         (PC),
    // out
    .PCF        (PC_F)
);

/* InstructionMem
------------------------
*/

wire [31:0] instr_F;

InstructionRAM InstructionRAM_1(
    .CLOCK               (CLK),                         
    .RESET               (0),            
    .ENABLE              (1),             
    .FETCH_ADDRESS       (PC_F),                    
    // out                           
    .DATA                (instr_F)           
);


/* stage2: ID
------------------------
*/

wire [31:0] instr_D;
wire [31:0] PCplus4_D;

IF_ID IF_ID_2(
    .CLK                 (CLK),
    .in_inst             (instr_F),
    .in_PCplus4          (PC_F+4),
    // out
    .inst                (instr_D),
    .PCplus4             (PCplus4_D)
);

/* Control Unit
------------------------
*/

wire [4:0] RegWrite_D;
wire MemtoReg_D,MemWrite_D,Branch_D;
wire [3:0] ALUControl_D;
wire ALUSrc_D,ALUSrc_shamt_D,RegDst_D;

ControlUnit ControlUnit_1(
    .Op                    (instr_D[31:26]),           
    .Funct                 (instr_D[5:0]),   
    // out                    
    .RegWrite              (RegWrite_D),      
    .MemtoReg              (MemtoReg_D),      
    .MemWrite              (MemWrite_D),      
    .Branch                (Branch_D),    
    .ALUControl            (ALUControl_D),        
    .ALUSrc                (ALUSrc_D),    
    .ALUSrc_shamt          (ALUSrc_shamt_D),          
    .RegDst                (RegDst_D)    
);


/* Register File
------------------------
*/

wire [31:0] RD1_D,RD2_D;

RegisterFile RegisterFile_1(
    .CLK                 (CLK),                       
    .A1                  (instr_D[25:21]),                                  
    .A2                  (instr_D[20:16]),                      
    .A3                  (WriteReg_W),                      
    .WD                  (Result_W),                      
    .RegWrite            (RegWrite_W),                             
    // out
    .RD1                 (RD1_D),                       
    .RD2                 (RD2_D)                       
);


/* Sign Extend
------------------------
*/

wire [31:0] SignImm_D;

SignExtend SignExtend_1(
    .num16               (instr_D[15:0]),
    // out
    .num32               (SignImm_D)
);


/* stage3: EX
------------------------
*/

wire RegWrite_E,MemtoReg_E,MemWrite_E,Branch_E,ALUSrc_E,ALUSrc_shamt_E,RegDst_E;
wire [3:0] ALUControl_E;
wire [4:0] Rt_E,Rd_E,shamt_E;
wire signed [31:0] RD1_E,RD2_E,PCplus4_E,SignImm_E;

ID_EX ID_EX_3(
    .CLK               (CLK),                        
    .in_RegWrite       (RegWrite_D),                          
    .in_MemtoReg       (MemtoReg_D),                      
    .in_MemWrite       (MemWrite_D),                      
    .in_Branch         (Branch_D),                    
    .in_ALUControl     (ALUControl_D),                        
    .in_ALUSrc         (ALUSrc_D),                    
    .in_ALUSrc_shamt   (ALUSrc_shamt_D),                          
    .in_RegDst         (RegDst_D),                    
    .in_RD1            (RD1_D),                 
    .in_RD2            (RD2_D),                 
    .in_Rt             (instr_D[20:16]),                
    .in_Rd             (instr_D[15:11]),                
    .in_SignImm        (SignImm_D),                     
    .in_PCplus4        (PCplus4_D),
    // out                     
    .RegWrite          (RegWrite_E),                   
    .MemtoReg          (MemtoReg_E),                   
    .MemWrite          (MemWrite_E),                   
    .Branch            (Branch_E),                 
    .ALUControl        (ALUControl_E),                     
    .ALUSrc            (ALUSrc_E),                 
    .ALUSrc_shamt      (ALUSrc_shamt_E),                       
    .RegDst            (RegDst_E),                 
    .RD1               (RD1_E),              
    .RD2               (RD2_E),              
    .Rt                (Rt_E),             
    .Rd                (Rd_E),
    .shamt             (shamt_E)             
    .SignImm           (SignImm_E),                  
    .PCplus4           (PCplus4_E)                  
);                  


/* MUX32_2
------------------------
*/

wire [31:0] SrcB_E;

MUX32 MUX32_2(
    .A0             (RD2_E),     
    .A1             (SignImm_E),    
    .Control        (ALUSrc_E),
    // out        
    .C              (SrcB_E)   
);

/* MUX32_3
------------------------
*/

wire [31:0] SrcA_E;

MUX32 MUX32_3(
    .A0             (RD1_E),     
    .A1             (shamt_E),    
    .Control        (ALUSrc_shamt_E),
    // out        
    .C              (SrcA_E)   
);

/* MUX32_4 (not implemented)
------------------------

wire [31:0] PCBranch_E;

MUX32 MUX32_4(
    .A0             (),     
    .A1             (),    
    .Control        (),
    // out        
    .C              ()   
);
*/


/* MUX5
------------------------
*/

wire [4:0] WriteReg_E;

MUX5 MUX5_1(
    .A0             (Rt_E),     
    .A1             (Rd_E),    
    .Control        (RegDst_E),
    // out        
    .C              (WriteReg_E)   
);


/* ALU
------------------------
*/

wire [31:0] ALUOut_E;
wire zero_E;

ALU ALU_1(
    .Ain               (SrcA_E),                    
    .Bin               (SrcB_E),        
    .ALUControl        (ALUControl_E),               
    // out
    .C                 (ALUOut_E),      
    .zero              (zero_E)         
);


/* stage4: MEM
------------------------
*/

wire RegWrite_M,MemtoReg_M,MemWrite_M,Branch_M,zero_M;
wire [31:0] ALUOut_M,WriteData_M,PCBranch_M;
wire [4:0] WriteReg_M;

EX_MEM EX_MEM_4(
    .CLK                (CLK),
    .in_RegWrite        (RegWrite_E),                                       
    .in_MemtoReg        (MemtoReg_E),                                    
    .in_MemWrite        (MemWrite_E),                                    
    .in_Branch          (Branch_E),                                  
    .in_ALUOut          (ALUOut_E),                                  
    .in_zero            (zero_E),                                
    .in_WriteData       (RD2_E),                                     
    .in_WriteReg        (WriteReg_E),                                    
    .in_PCBranch        ((SignImm_E<<2)+PCplus4_E),
    // out                                    
    .RegWrite           (RegWrite_M),                                 
    .MemtoReg           (MemtoReg_M),                                 
    .MemWrite           (MemWrite_M),                                 
    .Branch             (Branch_M),                               
    .ALUOut             (ALUOut_M),                               
    .zero               (zero_M),                             
    .WriteData          (WriteData_M),                                  
    .WriteReg           (WriteReg_M),                                 
    .PCBranch           (PCBranch_M)                                 
);


/* MainMemroy
------------------------
*/

wire [31:0] ReadData_M;

MainMemory MainMemory_1(
    .CLOCK                    (CLK),                   
    .RESET                    (0),     
    .ENABLE                   (MemWrite_M),      
    .FETCH_ADDRESS            (ALUOut_M),
    .EDIT_SERIAL              ({MemWrite_M,ALUOut_M[31:0],WriteData_M[31:0]})             
    // out
    .DATA                     (ReadData_M)    
);


/* stage5: WB
------------------------
*/

wire RegWrite_W,MemtoReg_W;
wire [31:0] ALUOut_W,ReadData_W;
wire [4:0] WriteReg_W;

MEM_WB MEM_WB_5(
    CLK               (CLK),                            
    in_RegWrite       (RegWrite_M),                    
    in_MemtoReg       (MemtoReg_M),                    
    in_ALUOut         (ALUOut_M),                  
    in_ReadData       (ReadData_M),                    
    in_WriteReg       (WriteReg_M),
    // out                    
    RegWrite          (RegWrite_W),                 
    MemtoReg          (MemtoReg_W),                 
    ALUOut            (ALUOut_W),               
    ReadData          (ReadData_W),                 
    WriteReg          (WriteReg_W)                 
);

/* MUX32_5
------------------------
*/

wire [31:0] Result_W;

MUX5 MUX32_5(
    .A0             (ALUOut_W),     
    .A1             (ReadData_W),    
    .Control        (MemtoReg_W),
    // out        
    .C              (Result_W)   
);


endmodule
