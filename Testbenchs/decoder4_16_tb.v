`timescale 1ns/1ns
`include "decoder4_16.v"

module decoder4_16_tb;
    reg  [3:0] w;
    wire [15:0] f;

    decoder4_16 dut (
        w,
        f
    );

    initial begin
        $dumpfile("decoder4_16_tb.vcd");
        $dumpvars(0, decoder4_16_tb);

        w = 4'd0; #10;
        #20

        w = 4'd1; #10;
        #20

        w = 4'd2; #10;
        #20

        w = 4'd3; #10;
        #20

        w = 4'd4; #10;
        #20

        w = 4'd5; #10;
        #20

        w = 4'd6; #10;
        #20

        w = 4'd7; #10;
        #20

        w = 4'd8; #10;
        #20

        w = 4'd9; #10;
        #20

        w = 4'd10; #10;
        #20

        w = 4'd11; #10;
        #20

        w = 4'd12; #10;
        #20

        w = 4'd13; #10;
        #20

        w = 4'd14; #10;
        #20

        w = 4'd15; #10;
        #20

        $display("Test Complete");
    end
endmodule
