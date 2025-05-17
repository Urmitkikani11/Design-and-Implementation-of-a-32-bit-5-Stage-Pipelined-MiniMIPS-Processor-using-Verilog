`timescale 1ns/1ps

module PCunit (
    input   wire                CLK, 
    input   wire                RST, 
    input   wire                StallF, 
    input   wire    [31:0]      PCin,
    output  reg     [31:0]      PCF
);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        PCF <= 32'b0;           // Reset to 0 on active-high RST
    end
    else if (!StallF) begin
        PCF <= PCin;            // Update PCF with PCin if not stalled
    end
end

endmodule
