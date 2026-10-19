`timescale 1ns/1ns
`include "decoder3_8.v"

module decoder3_8_tb;
    reg  [2:0] w;
    reg  en;
    wire [7:0] f;

    decoder3_8 dut (
        w,
        en,
        f
    );

    initial begin
        $dumpfile("decoder3_8_tb.vcd");
        $dumpvars(0, decoder3_8_tb);

        w = 3'd0; en = 0; #10;
        #20

        w = 3'd0; en = 1; #10;
        #20

        w = 3'd1; en = 1; #10;
        #20

        w = 3'd2; en = 1; #10;
        #20

        w = 3'd3; en = 1; #10;
        #20

        w = 3'd4; en = 1; #10;
        #20

        w = 3'd5; en = 1; #10;
        #20

        w = 3'd6; en = 1; #10;
        #20

        w = 3'd7; en = 1; #10;
        #20

        $display("Test Complete");
    end
endmodule
