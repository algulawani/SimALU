`timescale 1ns/1ns
`include "ROL.v"

module ROL_tb;
    reg  [15:0] a;
    wire [15:0] y;

    ROL dut (
        a,
        y
    );

    initial begin
        $dumpfile("ROL_tb.vcd");
        $dumpvars(0, ROL_tb);

        a = 16'h0000; #10;
        #20

        a = 16'hFFFF; #10;
        #20

        a = 16'h0001; #10;
        #20

        a = 16'h8000; #10;
        #20

        a = 16'hAAAA; #10;
        #20

        a = 16'h5555; #10;
        #20

        a = 16'h8001; #10;
        #20

        a = 16'h7FFF; #10;
        #20

        a = 16'h1234; #10;
        #20

        $display("Test Complete");
    end
endmodule
