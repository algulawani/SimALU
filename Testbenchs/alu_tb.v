`timescale 1ns/1ns
`include "alu.v"

module alu_tb;
    reg  [15:0] a, b;
    reg  [3:0] op;
    reg  cin;
    wire [15:0] result;
    wire zero, negative, overflow, cout;

    alu dut (
        a,
        b,
        op,
        cin,
        result,
        zero,
        negative,
        overflow,
        cout
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        a = 16'h1234; b = 16'hABCD; op = 4'd0; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'hFFFF; op = 4'd0; cin = 1; #10;
        #20

        a = 16'h1234; b = 16'hABCD; op = 4'd1; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd1; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'hFFFF; op = 4'd1; cin = 0; #10;
        #20

        a = 16'h1234; b = 16'hABCD; op = 4'd2; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h8000; op = 4'd2; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd2; cin = 0; #10;
        #20

        a = 16'hF0F0; b = 16'hFF00; op = 4'd3; cin = 0; #10;
        #20

        a = 16'hAAAA; b = 16'h5555; op = 4'd3; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'hFFFF; op = 4'd3; cin = 0; #10;
        #20

        a = 16'hF0F0; b = 16'h0F0F; op = 4'd4; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h0000; op = 4'd4; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0001; op = 4'd4; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'hAAAA; op = 4'd5; cin = 0; #10;
        #20

        a = 16'h1234; b = 16'h1234; op = 4'd5; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0001; op = 4'd5; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h0000; op = 4'd6; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd6; cin = 0; #10;
        #20

        a = 16'h00FF; b = 16'hFFFF; op = 4'd6; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0001; op = 4'd7; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0001; op = 4'd7; cin = 1; #10;
        #20

        a = 16'hFFFF; b = 16'h0001; op = 4'd7; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd7; cin = 1; #10;
        #20

        a = 16'h7FFF; b = 16'h0001; op = 4'd7; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h8000; op = 4'd7; cin = 0; #10;
        #20

        a = 16'h1234; b = 16'h4321; op = 4'd7; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h0000; op = 4'd8; cin = 0; #10;
        #20

        a = 16'h00FF; b = 16'h0000; op = 4'd8; cin = 0; #10;
        #20

        a = 16'h7FFF; b = 16'h0000; op = 4'd8; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd8; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h0000; op = 4'd9; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0000; op = 4'd9; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd9; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd9; cin = 0; #10;
        #20

        a = 16'h1234; b = 16'h0000; op = 4'd9; cin = 0; #10;
        #20

        a = 16'h0005; b = 16'h0003; op = 4'd10; cin = 1; #10;
        #20

        a = 16'h0005; b = 16'h0003; op = 4'd10; cin = 0; #10;
        #20

        a = 16'h0003; b = 16'h0005; op = 4'd10; cin = 1; #10;
        #20

        a = 16'h1234; b = 16'h1234; op = 4'd10; cin = 1; #10;
        #20

        a = 16'h8000; b = 16'h0001; op = 4'd10; cin = 1; #10;
        #20

        a = 16'h0000; b = 16'h0000; op = 4'd10; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0000; op = 4'd11; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd11; cin = 0; #10;
        #20

        a = 16'hAAAA; b = 16'h0000; op = 4'd11; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd12; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0000; op = 4'd12; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd12; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd13; cin = 0; #10;
        #20

        a = 16'h4000; b = 16'h0000; op = 4'd13; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; op = 4'd13; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd14; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0000; op = 4'd14; cin = 0; #10;
        #20

        a = 16'h8001; b = 16'h0000; op = 4'd14; cin = 0; #10;
        #20

        a = 16'h0001; b = 16'h0000; op = 4'd15; cin = 0; #10;
        #20

        a = 16'h8000; b = 16'h0000; op = 4'd15; cin = 0; #10;
        #20

        a = 16'h8001; b = 16'h0000; op = 4'd15; cin = 0; #10;
        #20

        $display("Test Complete");
    end
endmodule
