`include "CPU.v"
`timescale 100fs/100fs

module CPU_tb;

CPU CPU_test(

);


initial begin
    $display("Begin");
    #30000;
    $display("End");
end

endmodule