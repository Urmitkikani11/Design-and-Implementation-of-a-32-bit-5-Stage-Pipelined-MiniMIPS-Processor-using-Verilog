module FetchToDecode_REG (
    input wire CLK, RST, StallD, CLR,
    input wire [31:0] PCPlus4F, InstrF,
    output reg [31:0] PCPlus4D, InstrD
);
    always @(posedge CLK or posedge RST) begin  // Fixed to posedge RST
        if (RST) begin  // Active-high reset
            PCPlus4D <= 0;
            InstrD <= 0;
        end
        else if (CLR && !StallD) begin
            PCPlus4D <= 0;
            InstrD <= 0;
        end
        else if (!StallD) begin
            PCPlus4D <= PCPlus4F;
            InstrD <= InstrF;
        end
    end
endmodule
