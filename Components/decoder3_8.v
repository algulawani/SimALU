module decoder3_8(
    w,
    en,
    f
);

    input [2:0] w;
    input en;
    output reg f [7:0];

    always @ (*) begin
        if (en == 1'b0)
            f = 1'b0;
        else begin
            f = 8'b0;
            f[w] = 1'b1;
        end
    end
endmodule