`timescale 100fs/100fs

module ControlUnit(Op,Funct,RegWrite,MemtoReg,MemWrite,Branch,ALUControl,ALUSrc,ALUSrc_shamt,RegDst);

// input & output
input [5:0] Op,Funct;
output reg RegWrite,MemtoReg,MemWrite,Branch;
output reg [3:0] ALUControl;
output reg ALUSrc,ALUSrc_shamt,RegDst;


always @(Op, Funct) begin
    if (Op==6'h0 && Funct==6'h20) // add
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'h0 && Funct==6'h21) // addu (add)
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'h8) // addi
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst =0;
    end
    else if (Op==6'h9) // addiu (addi)
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst =0;
    end
    else if (Op==6'h0 && Funct==6'h22) // sub
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0110;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'h0 && Funct==6'h23) // subu (sub)
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0110;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'h0 && Funct==6'h24) // &&
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0000;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'hc) // &&i
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0000;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst =0;
    end
    else if (Op==6'h0 && Funct==6'h27) // nor
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b1100;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'h0 && Funct==6'h25) // or
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0001;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'hd) // ori
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0001;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst =0;
    end
    else if (Op==6'h0 && Funct==6'h26) // xor
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0011;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =1;
    end
    else if (Op==6'he) // xori
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0011;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst =0;
    end
    else if (Op==6'h0 && Funct==6'h0) // sll
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0100;
        ALUSrc=0;
        ALUSrc_shamt=1;
        RegDst=1;
    end
    else if (Op==6'h0 && Funct==6'h4) // sllv
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0100;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=1;
    end
    else if (Op==6'h0 && Funct==6'h3) // sra
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b1000;
        ALUSrc=0;
        ALUSrc_shamt=1;
        RegDst=1;
    end
    else if (Op==6'h0 && Funct==6'h7) // srav
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b1000;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=1;
    end
    else if (Op==6'h0 && Funct==6'h2) // srl
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0101;
        ALUSrc=0;
        ALUSrc_shamt=1;
        RegDst=1;
    end
    else if (Op==6'h0 && Funct==6'h6) // srlv
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0101;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=1;
    end
    else if (Op==6'h4) // beq
    begin
        RegWrite=0;
        MemtoReg=0;
        MemWrite=0;
        Branch=1;
        ALUControl=4'b1001;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=0; // x
    end
    else if (Op==6'h5) // bne
    begin
        RegWrite=0;
        MemtoReg=0;
        MemWrite=0;
        Branch=1;
        ALUControl=4'b1010;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=0; // x
    end
    else if (Op==6'h0 && Funct==6'h2a) // slt
    begin
        RegWrite=1;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0111;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=1;
    end
    else if (Op==6'h23) // lw
    begin
        RegWrite=1;
        MemtoReg=1;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst=0;
    end
    else if (Op==6'h2b) // sw
    begin
        RegWrite=0;
        MemtoReg=0;
        MemWrite=1;
        Branch=0;
        ALUControl=4'b0010;
        ALUSrc=1;
        ALUSrc_shamt=0;
        RegDst=0; // x
    end
    /*
    else if (Op==6'h2) // j
    begin
        RegWrite=0;
        MemtoReg=0;
        MemWrite=0;
        Branch=;
        ALUControl=4'b;
        ALUSrc=;
        ALUSrc_shamt=0;
        RegDst =;
    end
    else if (Op==6'h3) // jal
    begin
        RegWrite=;
        MemtoReg=;
        MemWrite=;
        Branch=;
        ALUControl=4'b;
        ALUSrc=;
        ALUSrc_shamt=0;
        RegDst =;
    end
    else if (Op==6'h0 && Funct==6'h8) // jr
    begin
        RegWrite=;
        MemtoReg=;
        MemWrite=;
        Branch=;
        ALUControl=4'b;
        ALUSrc=;
        ALUSrc_shamt=0;
        RegDst =;
    end
    */
    
end


endmodule