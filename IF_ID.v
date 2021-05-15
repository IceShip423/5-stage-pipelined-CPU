`timescale 100fs/100fs

module IF_ID(CLK,in_PCplus4,PCplus4,in_inst,inst);

// input & output
input CLK;
input [31:0] in_inst;
output reg [31:0] inst;
input [31:0] in_PCplus4;
output reg [31:0] PCplus4;

always @(posedge CLK) begin
    inst             =          in_inst              ;                                         
    PCplus4          =          in_PCplus4           ;                      
end

endmodule