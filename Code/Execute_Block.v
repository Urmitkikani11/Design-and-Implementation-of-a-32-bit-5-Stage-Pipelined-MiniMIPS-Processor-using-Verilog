module Execute_Block (
    input ALUSrcE, RegDstE,
    input [1:0] ForwardAE, ForwardBE,
    input [2:0] ALUControlE,
    input [31:0] RD1_E, RD2_E, SignImmE, Wd3E, ALUOutM,
    input [4:0] RsE, RtE, RdE,
    output [31:0] ALUOutE, WriteDataE,
    output [4:0] WriteRegE
);
    wire [31:0] SrcAE, SrcBE;

    ALUunit aluunit (.SrcAE(SrcAE), .SrcBE(SrcBE), .ALUControlE(ALUControlE), .ALUOutE(ALUOutE));
    TwoIn_Mux #(.width(5)) WriteRegE_MUX (.D0(RtE), .D1(RdE), .S(RegDstE), .Y(WriteRegE));
    TwoIn_Mux #(.width(32)) SrcBE_MUX (.D0(RD2_E), .D1(SignImmE), .S(ALUSrcE), .Y(SrcBE));  // Fixed: D0 = RD2_E
    FourIn_Mux #(.width(32)) SrcAE_MUX (.D0(RD1_E), .D1(Wd3E), .D2(ALUOutM), .S(ForwardAE), .Y(SrcAE));
    FourIn_Mux #(.width(32)) WriteDataE_MUX (.D0(RD2_E), .D1(Wd3E), .D2(ALUOutM), .S(ForwardBE), .Y(WriteDataE));
endmodule
