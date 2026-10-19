`timescale 1ns/1ns
`include "or16.v"

module or16_tb;
    reg  [15:0] a, b;
    wire [15:0] res;

    or16 dut (
        a,
        b,
        res
    );

    initial begin
        $dumpfile("or16_tb.vcd");
        $dumpvars(0, or16_tb);

        a = 16'h0000; b = 16'h0000; #10;
        #20

        a = 16'hFFFF; b = 16'hFFFF; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; #10;
        #20

        a = 16'h0000; b = 16'hFFFF; #10;
        #20

        a = 16'hAAAA; b = 16'h5555; #10;
        #20

        a = 16'hAAAA; b = 16'hAAAA; #10;
        #20

        a = 16'hF0F0; b = 16'h0F00; #10;
        #20

        a = 16'h1234; b = 16'hABCD; #10;
        #20

        a = 16'h8000; b = 16'h0001; #10;
        #20

        a = 16'h0001; b = 16'h0001; #10;
        #20

        $display("Test Complete");
    end
endmodule
