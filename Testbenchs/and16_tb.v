`timescale 1ns/1ns
`include "and16.v"

module and16_tb;
    reg  [15:0] a, b;
    wire [15:0] res;

    and16 dut (
        a,
        b,
        res
    );

    initial begin
        $dumpfile("and16_tb.vcd");
        $dumpvars(0, and16_tb);

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

        a = 16'hAAAA; b = 16'hFFFF; #10;
        #20

        a = 16'h5555; b = 16'hFFFF; #10;
        #20

        a = 16'hF0F0; b = 16'hFF00; #10;
        #20

        a = 16'h1234; b = 16'hABCD; #10;
        #20

        a = 16'h8000; b = 16'h8000; #10;
        #20

        a = 16'h0001; b = 16'h0001; #10;
        #20

        $display("Test Complete");
    end
endmodule
