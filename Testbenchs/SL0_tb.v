`timescale 1ns/1ns
`include "SL0.v"

module SL0_tb;
    reg  [15:0] a;
    wire [15:0] y;

    SL0 dut (
        a,
        y
    );

    initial begin
        $dumpfile("SL0_tb.vcd");
        $dumpvars(0, SL0_tb);

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
