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

module CPU;


/* CLK
-----------------------
*/

wire CLK;

clock clock(
    .CLK (CLK)
);


/* stage1: IF
------------------------
*/

wire [31:0] PC_F;

WB_IF WB_IF_1(
    .CLK (CLK),
    .PC  (),
    // out
    .PCF (PC_F)
);

/* stage2: ID
------------------------
*/

wire [31:0] inst_D;
wire [31:0] PCplus4_D;

IF_ID IF_ID_2(
    .CLK (CLK),
    .in_inst (),
    .in_PCplus4 (),
    // out
    .inst (inst_D),
    .PCplus4 (PCplus4_D)
);

/* stage3: EX
------------------------
*/

wire RegWrite_E,MemtoReg_E,MemWrite_E,Branch_E,ALUSrc_E,ALUSrc_shamt_E,RegDst_E;
wire [3:0] ALUControl_E;
wire [4:0] Rt_E,Rd_E;
wire [31:0] RD1_E,RD2_E,PCplus4_E,SignImm_E;

ID_EX ID_EX_3(

);

/* stage4: MEM
------------------------
*/

wire RegWrite_M,MemtoReg_M,MemWrite_M,Branch_M;
wire [31:0] ALUOut_M,WriteData_M,PCBranch_M;
wire [4:0] WriteReg_M;

EX_MEM EX_MEM_4(

);

/* stage5: WB
------------------------
*/

wire RegWrite_W,MemtoReg_W;
wire [31:0] ALUOut_W,ReadData_W;
wire [4:0] WriteReg;_W;

MEM_WB MEM_WB_5(

);








endmodule
