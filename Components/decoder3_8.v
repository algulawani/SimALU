module decoder3_8(
    w,
    en,
    f
);

    input [2:0] w;
    input en;
    output reg [7:0];

    always @ (*) begin
        if (en == 1'b0)
            f = 1'b0;
        else begin
            case (w)
                2'b000 : f = w[0];
                2'b001 : f = w[1];
                2'b010 : f = w[0];
                2'b011 : f = w[0];
                2'b100 : f = w[0];
                2'b101 : f = w[0];
                2'b110 : f = w[0];
                2'b111 : f = w[0];
            endcase
        end
    end
endmodule