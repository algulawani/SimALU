module SR0 (
    a,
    y
);

    input  [15:0] a;
    output [15:0] y;

    assign y = {1'b0, a[15:1]};   // drop LSB, fill MSB with 0
endmodule