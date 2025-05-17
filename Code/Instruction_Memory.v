module Instruction_Memory (
    input   wire  [31:0]    A,    // Address input (PC)
    output  reg   [31:0]    RD    // Read data output (instruction)
);

reg [31:0] MEM [0:256];  // Memory array (257 words, 32-bit each)

initial begin
    MEM[0] = 32'h012A4020;  // add $t0, $t1, $t2
    MEM[1] = 32'h01095820;  // add $t3, $t0, $t1
    MEM[2] = 32'h016A6022;  // sub $t4, $t3, $t2
    MEM[3] = 32'h00000000;  // NOP (optional, to pad the memory)
    // Remaining locations implicitly 0 or can be filled with NOPs
end

always @(*) begin
    RD = MEM[A >> 2];  // Word-aligned access (divide address by 4)
end

endmodule
