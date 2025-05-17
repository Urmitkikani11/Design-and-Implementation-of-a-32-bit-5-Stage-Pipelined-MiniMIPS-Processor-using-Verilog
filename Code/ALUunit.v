module ALUunit
    (
        input wire [31:0] SrcAE, SrcBE,
        input wire [2 :0] ALUControlE,
        output reg [31:0] ALUOutE
    );

reg ZeroE;
always @(*) 
begin
    case (ALUControlE)
        3'b000 : ALUOutE = SrcAE & SrcBE;
        3'b001 : ALUOutE = SrcAE | SrcBE;
        3'b010 : ALUOutE = SrcAE + SrcBE;
        3'b100 : ALUOutE = SrcAE - SrcBE;
        3'b101 : ALUOutE = SrcAE * SrcBE;
        3'b110 : ALUOutE = SrcAE < SrcBE;
        default: ALUOutE = 0;
    endcase    
    ZeroE = ~|(ALUOutE);
end
endmodule
