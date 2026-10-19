`timescale 1ns/1ns
`include "mux2_1.v"

module mux2_1_tb;
    reg  [1:0] w;
    reg  s;
    wire f;

    mux2_1 dut (
        w,
        s,
        f
    );

    initial begin
        $dumpfile("mux2_1_tb.vcd");
        $dumpvars(0, mux2_1_tb);

        w = 2'b00; s = 0; #10;
        #20

        w = 2'b01; s = 0; #10;
        #20

        w = 2'b10; s = 0; #10;
        #20

        w = 2'b11; s = 0; #10;
        #20

        w = 2'b00; s = 1; #10;
        #20

        w = 2'b01; s = 1; #10;
        #20

        w = 2'b10; s = 1; #10;
        #20

        w = 2'b11; s = 1; #10;
        #20

        $display("Test Complete");
    end
endmodule
