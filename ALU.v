`timescale 100fs/100fs

module ALU(Ain,Bin,C,zero,ALUControl);

// input & output
input signed [31:0] Ain,Bin;
input [3:0] ALUControl;
output reg signed [31:0] C;
output reg zero;

// registers
reg signed [31:0] A,B;
reg unsigned [31:0] Au,Bu;


initial begin
    C=0;
    zero=0;
    A=0;
    B=0;
    Au=0;
    Bu=0;
end

always @(Ain,Bin,ALUControl) begin
    A=Ain;
    B=Bin;
    Au=Ain;
    Bu=Bin;
    zero=0; // zero=1, then branch
    case (ALUControl)
        4'b0000: // and 
        begin
            C=A&B;
        end
        4'b0001: // or 
        begin
            C=A|B;
        end
        4'b0010: // add
        begin
            C=A+B;
        end
        4'b0110: // sub 
        begin
            C=A-B;
        end
        4'b0111: // slt
        begin
            C= A < B ? 32'h0000_0001 : 32'h0000_0000;
        end
        4'b1100: // nor
        begin
            C=~(A | B);
        end
        4'b0011: // xor (notice)
        begin
            C=A^B;
        end
        4'b0100: // sll (notice)
        begin
            C=Bu<<A;
        end
        4'b0101: // srl (notice)
        begin
            C=Bu>>A;
        end
        4'b1000: // sra (notice)
        begin
            C=($signed(B))>>>A;
        end
        4'b1001: // beq
        begin
            C= A == B ? 32'h0000_0001 : 32'h0000_0000;
            zero = A == B ? 1 : 0;
        end
        4'b1010: // bne
        begin
            C= A != B ? 32'h0000_0001 : 32'h0000_0000;
            zero = A != B ? 1 : 0;
        end
        default: $display("Unknown ALUControl\n");
    endcase
end

endmodule