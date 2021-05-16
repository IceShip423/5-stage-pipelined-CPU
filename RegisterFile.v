`timescale 100fs/100fs

module RegisterFile(A1,A2,A3,WD,RD1,RD2,CLK,RegWrite);

// input & output
input [4:0] A1,A2,A3;
input [31:0] WD;
output reg [31:0] RD1,RD2;
input CLK;
input RegWrite;

// registers
reg signed [31:0] REG[31:0];

integer counter;

initial begin
    RD1 = 0;
    RD2 = 0;
    for(counter=0;counter<=31;counter=counter+1) begin
        REG[counter]=0;
    end
end

always @(negedge CLK) begin // read in the second half
    RD1 = REG[(A1)];
    RD2 = REG[(A2)];
end


always @(posedge CLK) begin // write in the first half
    #10;
    if (RegWrite==1)
        REG[(A3)]=WD;
    // counter=31;
    // while (counter>=0) begin
    //     $display(REG[counter]);
    //     counter = counter - 1 ;
    // end
end


endmodule
