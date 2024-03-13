module module_b(
input logic a,
input logic b, 
output logic y1,
output logic y2,
output logic y3
);

always_comb
begin

y1 = a & b;
y2 = a | b;
y3 = a ^ b;

end

endmodule