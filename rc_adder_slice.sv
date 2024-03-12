// The adder module provided and completed in the previous lab
module rc_adder_slice (
input logic a, b, c_in,
output logic s, c_out
);

    logic p, g;

    assign p = a ^ b;
    assign g = a & b;

    assign s     = p ^ c_in;
    assign c_out = g | (p & c_in);

endmodule