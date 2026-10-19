module ROL (
    a,
    y
);
    
    input [15:0] a;
    output [15:0] y;
    
    assign y = {a[14:0], a[15]}; 
endmodule