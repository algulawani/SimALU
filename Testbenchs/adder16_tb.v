`timescale 1ns/1ns
`include "adder16.v"

module adder16_tb;
    reg  [15:0] a, b;
    reg  cin;
    wire [15:0] sum;
    wire cout, c15;

    adder16 dut (
        a,
        b,
        cin,
        sum,
        cout,
        c15
    );

    initial begin
        $dumpfile("adder16_tb.vcd");
        $dumpvars(0, adder16_tb);

        a = 16'h0000; b = 16'h0000; cin = 0; #10;
        #20

        a = 16'h0000; b = 16'h0000; cin = 1; #10;
        #20

        a = 16'h0001; b = 16'h0001; cin = 0; #10;
        #20

        a = 16'h1234; b = 16'h4321; cin = 0; #10;
        #20

        a = 16'hAAAA; b = 16'h5555; cin = 0; #10;
        #20

        // AAAA + 5555 + 1 ripples a carry through all 16 bits
        a = 16'hAAAA; b = 16'h5555; cin = 1; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'h0000; cin = 1; #10;
        #20

        a = 16'hFFFF; b = 16'h0001; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'hFFFF; cin = 0; #10;
        #20

        a = 16'hFFFF; b = 16'hFFFF; cin = 1; #10;
        #20

        // 7FFF + 1: carry into bit 15 but none out (signed overflow)
        a = 16'h7FFF; b = 16'h0001; cin = 0; #10;
        #20

        // 8000 + 8000: carry out but none into bit 15 (signed overflow)
        a = 16'h8000; b = 16'h8000; cin = 0; #10;
        #20

        a = 16'h00FF; b = 16'h0001; cin = 0; #10;
        #20

        $display("Test Complete");
    end
endmodule
