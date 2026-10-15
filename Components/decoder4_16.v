`include "decoder3_8.v"

module decoder4_16(
    w,
    f
);

    input [3:0] w;
    output [15:0] f;

    decoder3_8 DC10(w[2:0], ~w[3], f[7:0]);
    decoder3_8 DC11(w[2:0], w[3], f[15:8]);
endmodule