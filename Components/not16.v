module not16(
    a,
    res
);

    input [15:0] a;
    output [15:0] res;

    assign res = ~a;
endmodule