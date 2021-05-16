`timescale 100fs/100fs

module clock(CLK,ENABLE);

// input & output
input ENABLE;
output reg CLK;

parameter CLK_CYCLE = 2000;

initial begin
    CLK=0;
end

always begin
    if(ENABLE==1)
    begin
        #(CLK_CYCLE/2);
        CLK=~CLK;
    end
end

endmodule