module FourIn_Mux #(parameter width =32)
(
input  wire [width-1:0] D0, D1,D2,
input  wire [1:0]       S,
output reg  [width-1:0] Y
);
always @(*)
begin
  case(S)
    2'b00:Y=D0;
    2'b01:Y=D1;
    2'b10:Y=D2;
    default:Y=0;
  endcase
end

endmodule
