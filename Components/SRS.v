module SRS (
    a,
    y
);

    input [15:0] a;
    output [15:0] y;

    assign y = {a[15], a[15:1]}; 
endmodule