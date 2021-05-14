module clock(CLK);

// output
output reg CLK;

parameter CLK_CYCLE = 200;

initial begin
    CLK=0;
end

always begin
    #(CLK_CYCLE/2);
    CLK=~CLK;
end

endmodule