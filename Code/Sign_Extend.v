module Sign_Extend (
input      [15:0] instr,
output reg [31:0] SignImm
);

always @(*)
begin
  if(instr[15])
    SignImm = {16'd65535,instr[15:0]};
  else
    SignImm = {16'b0,instr[15:0]};
end

endmodule
