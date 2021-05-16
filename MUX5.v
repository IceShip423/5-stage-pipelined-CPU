`timescale 100fs/100fs

module MUX5(A0,A1,C,Control);

// input & output
input [4:0] A0,A1;
output reg [4:0] C;
input Control;

initial begin
    C=0;
end

always @(A0,A1,Control) begin
    if (Control==0)
        C=A0;
    else 
        C=A1;
end

endmodule