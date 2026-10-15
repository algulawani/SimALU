module mux2_1(
    w,
    s,
    f
);

    input [1:0] w;
    input s;
    output reg f;

    always @ (*) begin
        if (s == 1'b0)
            f = w[0];
        else
            f = w[1];
    end
endmodule