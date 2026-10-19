`include "adder16.v"
`include "and16.v"
`include "or16.v"
`include "xor16.v"
`include "not16.v"
`include "decoder4_16.v"
`include "SL0.v"
`include "SR0.v"
`include "SRS.v"
`include "ROL.v"
`include "ROR.v"

module alu(
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

    input [15:0] a;
    input [15:0] b;
    input [3:0] op;
    input cin;
    output reg [15:0] result;
    output zero;
    output negative;
    output overflow;
    output cout;

    wire [15:0] sel;
    decoder4_16 DEC(op, sel);

    wire [15:0] and_res;
    wire [15:0] or_res;
    wire [15:0] xor_res;
    wire [15:0] not_res;

    and16 AND1(a, b, and_res);
    or16  OR1(a, b, or_res);
    xor16 XOR1(a, b, xor_res);
    not16 NOT1(a, not_res);

    wire [15:0] sl0_res;
    wire [15:0] sr0_res;
    wire [15:0] srs_res;
    wire [15:0] rol_res;
    wire [15:0] ror_res;

    SL0 SL01(a, sl0_res);
    SR0 SR01(a, sr0_res);
    SRS SRS1(a, srs_res);
    ROL ROL1(a, rol_res);
    ROR ROR1(a, ror_res);

    reg [15:0] x;
    reg [15:0] y;
    reg add_cin;

    wire [15:0] sum;
    wire add_cout;
    wire c15;

    always @(*) begin
        x = a;
        y = 16'b0;
        add_cin = 1'b0;

        if (sel[7]) begin       
            y = b;
            add_cin = cin;
        end
        if (sel[8]) begin       
            add_cin = 1'b1;
        end
        if (sel[9]) begin       
            x = ~a;
            add_cin = 1'b1;
        end
        if (sel[10]) begin      
            y = ~b;
            add_cin = cin;
        end
    end

    adder16 ADD1(x, y, add_cin, sum, add_cout, c15);

    wire is_arith;
    assign is_arith = sel[7] | sel[8] | sel[9] | sel[10];

    always @(*) begin
        result = 16'b0;

        if (sel[0])  result = 16'b0;    
        if (sel[1])  result = a;         
        if (sel[2])  result = b;         
        if (sel[3])  result = and_res;   
        if (sel[4])  result = or_res;    
        if (sel[5])  result = xor_res;   
        if (sel[6])  result = not_res;   
        if (is_arith) result = sum;      
        if (sel[11]) result = sl0_res;   
        if (sel[12]) result = sr0_res;   
        if (sel[13]) result = srs_res;   
        if (sel[14]) result = rol_res;   
        if (sel[15]) result = ror_res;   
    end

    assign zero = (result == 16'b0);
    assign negative = result[15];
    assign cout = is_arith & add_cout;
    assign overflow = is_arith & (c15 ^ add_cout);
endmodule