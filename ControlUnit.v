`timescale 100fs/100fs

module ControlUnit(Op,Funct,RegWrite,MemtoReg,MemWrite,Branch,ALUControl,ALUSrc,ALUSrc_shamt,RegDst);

// input & output
input [5:0] Op,Funct;
output reg RegWrite,MemtoReg,MemWrite,Branch;
output reg [3:0] ALUControl;
output reg ALUSrc,ALUSrc_shamt,RegDst;

initial begin
        RegWrite=0;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b0000;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst =0;
end

always @(Op, Funct) begin
    if (Op==6'h0 && Funct==6'h20) // add
    begin
        $display("add");
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
        $display("addu");
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
        $display("addi");
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
        $display("addiu");
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
        $display("sub");
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
        $display("subu");
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
        $display("and");
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
        $display("andi");
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
        $display("nor");
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
        $display("or");
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
        $display("ori");
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
        $display("xor");
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
        $display("xori");
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
        $display("sll");
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
        $display("sllv");
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
        $display("sra");
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
        $display("srav");
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
        $display("srl");
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
        $display("srlv");
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
        $display("beq");
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
        $display("bne");
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
        $display("slt");
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
        $display("lw");
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
        $display("sw");
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
    else
    begin
        $display("Control Unit can't recognize");
        RegWrite=0;
        MemtoReg=0;
        MemWrite=0;
        Branch=0;
        ALUControl=4'b1011;
        ALUSrc=0;
        ALUSrc_shamt=0;
        RegDst=0; // x
    end
    
end


endmodule