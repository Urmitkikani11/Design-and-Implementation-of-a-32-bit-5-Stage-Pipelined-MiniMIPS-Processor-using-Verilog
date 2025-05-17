module ALU_Decoder #(parameter width =6)
(
input      [width-1:0] funct,
input      [1:0]       Aluop,
output reg [2:0]       alucontrol
);

always @(*)
begin 
  case(Aluop)
    2'b00:alucontrol=3'b010;
    2'b01:alucontrol=3'b100;
    2'b10:begin
      case(funct)
        6'b100000:alucontrol=3'b010;
        6'b100010:alucontrol=3'b100;
        6'b101010:alucontrol=3'b110;
        6'b011100:alucontrol=3'b101;
        default  :alucontrol=3'b010;
      endcase
          end
    default:alucontrol=3'b010;
  endcase
end

endmodule
