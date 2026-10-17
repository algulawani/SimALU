`include "fulladder.v"

module adder16 (
    a,
    b,
    cin,
    sum,
    cout,
    c15      
);
    input  [15:0] a;
    input  [15:0] b,
    input cin;
    output [15:0] sum;
    output cout;
    output c15;
    wire [16:0] c;

    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : bit_slice
            full_adder fa (
                a[i],
                b[i],
                c[i],
                sum[i],
                c[i+1]
            );
        end
    endgenerate

    assign cout = c[16];
    assign c15  = c[15];
endmodule