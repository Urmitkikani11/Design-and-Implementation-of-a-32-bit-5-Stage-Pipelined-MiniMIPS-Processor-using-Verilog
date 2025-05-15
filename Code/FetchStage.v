module module FetchStage ( 
    input  wire             CLK, 
    input  wire             RST, 
    input  wire             StallF,  
    input  wire [31:0]      PCin, 
    output wire [31:0]      PCPlus4F, 
    output wire [31:0]      InstrF, 
    output wire [31:0]      PCF        // Added PC output 
); 
    wire [31:0] PCout; 
    PCunit U_PCunit ( 
        .CLK(CLK),  
        .RST(RST),  
        .StallF(StallF),  
        .PCin(PCin), 
        .PCF(PCout) 
    ); 
    Instruction_Memory U_Instruction_Memory ( 
        .A(PCout), 
        .RD(InstrF) 
    ); 
    Adder U_Adder ( 
        .A(PCout), 
        .B(32'd4), 
        .C(PCPlus4F) 
    ); 
    assign PCF = PCout;                // Output current PC to Decode stage 
endmodule ( 
    input  wire             CLK, 
    input  wire             RST, 
    input  wire             StallF,  
    input  wire [31:0]      PCin, 
    output wire [31:0]      PCPlus4F, 
    output wire [31:0]      InstrF, 
    output wire [31:0]      PCF        // Added PC output 
); 
    wire [31:0] PCout; 
    PCunit U_PCunit ( 
        .CLK(CLK),  
        .RST(RST),  
        .StallF(StallF),  
        .PCin(PCin), 
        .PCF(PCout) 
    ); 
    Instruction_Memory U_Instruction_Memory ( 
        .A(PCout), 
        .RD(InstrF) 
    ); 
    Adder U_Adder ( 
        .A(PCout), 
        .B(32'd4), 
        .C(PCPlus4F) 
    ); 
    assign PCF = PCout;                // Output current PC to Decode stage 
endmodule
