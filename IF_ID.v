`timescale 100fs/100fs

module IF_ID(CLK,RESET,in_PCplus4,PCplus4,in_inst,inst);

// input & output
input CLK,RESET;
input [31:0] in_inst;
output reg [31:0] inst;
input [31:0] in_PCplus4;
output reg [31:0] PCplus4;

initial begin
    inst             <=          32'b0    ;                                         
    PCplus4          <=          0        ;   
end


always @(posedge CLK) begin
    if (RESET) begin
        inst             <=    32'b001000_00000_00000_0000000000000000;
        PCplus4          <=          -1       ; 
    end
    else begin
        inst             <=          in_inst          ;                                         
        PCplus4          <=          in_PCplus4       ;                      
    end
end

endmodule