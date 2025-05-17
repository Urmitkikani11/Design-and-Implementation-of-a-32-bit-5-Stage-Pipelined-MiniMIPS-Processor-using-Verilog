module shift_left #(parameter in_width =32, out_width =32)
(
    input   wire    [in_width-1:0]   in_shift,
    output  wire    [out_width-1:0]  out_shift
);

assign out_shift = in_shift << 2;

endmodule
