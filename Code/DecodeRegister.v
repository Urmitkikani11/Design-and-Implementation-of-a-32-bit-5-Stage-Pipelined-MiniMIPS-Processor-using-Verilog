module DecodeRegister (
    input wire RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, CLR, CLK, RST,
    input wire [2:0] ALUControlD,
    input wire [31:0] RD1_D, RD2_D, SignImmD,
    input wire [4:0] RsD, RtD, RdD,
    output reg RegWriteE, MemtoRegE, MemWriteE, ALUSrcE, RegDstE,
    output reg [2:0] ALUControlE,
    output reg [31:0] RD1_E, RD2_E, SignImmE,
    output reg [4:0] RsE, RtE, RdE
);
    always @(posedge CLK or posedge RST) begin
        if (RST) begin  // Fixed to active-high reset
            RegWriteE <= 0; MemtoRegE <= 0; MemWriteE <= 0; ALUControlE <= 0;
            ALUSrcE <= 0; RegDstE <= 0; RD1_E <= 0; RD2_E <= 0; RsE <= 0; RtE <= 0; RdE <= 0; SignImmE <= 0;
        end
        else if (CLR) begin
            RegWriteE <= 0; MemtoRegE <= 0; MemWriteE <= 0; ALUControlE <= 0;
            ALUSrcE <= 0; RegDstE <= 0; RD1_E <= 0; RD2_E <= 0; RsE <= 0; RtE <= 0; RdE <= 0; SignImmE <= 0;
        end
        else begin
            RegWriteE <= RegWriteD; MemtoRegE <= MemtoRegD; MemWriteE <= MemWriteD; ALUControlE <= ALUControlD;
            ALUSrcE <= ALUSrcD; RegDstE <= RegDstD; RD1_E <= RD1_D; RD2_E <= RD2_D;
            RsE <= RsD; RtE <= RtD; RdE <= RdD; SignImmE <= SignImmD;
        end
    end
endmodule
