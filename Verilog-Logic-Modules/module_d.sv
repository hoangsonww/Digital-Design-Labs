module module_d (
input logic a,
input logic b, 
output logic y1,
output logic y2,
output logic y3
);

assign y1 = a & b;

assign y2 = a | b;

assign y3 = a ^ b;

endmodule