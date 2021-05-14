module IF_ID(CLK,PCplus4;);

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