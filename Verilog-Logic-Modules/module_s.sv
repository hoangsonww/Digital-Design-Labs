module module_s(
input logic a,
input logic b, 
output logic y1,
output logic y2,
output logic y3
);

and U1 (y1,a,b);

or U2 (y2,a,b);

xor U3 (y3,a,b);

endmodule