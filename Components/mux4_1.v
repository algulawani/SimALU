`include "mux2_1.v"

module mux4_1(
    w,
    s,
    f
);

    input [3:0] w;
    input [1:0] s;
    wire [1:0] i;
    output f;

    mux2_1 MUX10(w[1:0], s[0], i[0]);
    mux2_1 MUX11(w[2:3], s[0], i[1]);
    mux2_1 MUX20(i, s[0], f);
endmodule