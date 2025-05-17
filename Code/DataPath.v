`timescale 1ns/1ps

module DataPath (
    input   wire            CLK,
    input   wire            RST,
    input   wire            Jump,
    input   wire            PCSrc,           
    input   wire            StallF,
    input   wire            StallD,
    input   wire            FlushE,
    input   wire            ForwardAD,
    input   wire            ForwardBD,
    input   wire   [1:0]    ForwardAE,
    input   wire   [1:0]    ForwardBE,
    input   wire            RegWriteD,
    input   wire            MemtoRegD,
    input   wire            MemWriteD,
    input   wire   [2:0]    ALUControlD,
    input   wire            ALUSrcD,
    input   wire            RegDstD,
    output  wire   [5:0]    Op,
    output  wire   [5:0]    Funct,
    output  wire            EqualD,
    output  wire   [4:0]    RsE,     
    output  wire   [4:0]    RtE,
    output  wire   [4:0]    RsD,     
    output  wire   [4:0]    RtD,  
    output  wire   [4:0]    WriteRegE,
    output  wire   [4:0]    WriteRegM,
    output  wire   [4:0]    WriteRegW,
    output  wire            RegWriteE,
    output  wire            MemtoRegE,
    output  wire            RegWriteM,
    output  wire            MemtoRegM,
    output  wire            RegWriteW,
    output  wire   [15:0]   test_value,
    output  wire   [31:0]   pc         // PC output
);

    wire    [31:0]  PCPlus4F;
    wire    [31:0]  PCBranchD;
    wire    [31:0]  PCJumpD;
    wire    [31:0]  PCin;
    wire    [31:0]  InstrF;
    wire    [1:0]   PCSrcD;
    wire            CLRF;    
    wire    [31:0]  PCPlus4D;    
    wire    [31:0]  InstrD;    
    wire    [31:0]  ResultW;     
    wire    [31:0]  RD1_D;     
    wire    [31:0]  RD2_D;     
    wire    [31:0]  SignImmD;     
    wire    [4:0]   RdD;     
    wire    [31:0]  PCF;           // PC from FetchStage

    wire            MemWriteE;
    wire   [2:0]    ALUControlE;
    wire            ALUSrcE;
    wire            RegDstE;
    wire    [31:0]  RD1_E;     
    wire    [31:0]  RD2_E;     
    wire    [31:0]  SignImmE;     
    wire    [4:0]   RdE;     
    wire    [31:0]  ALUOutE;     
    wire    [31:0]  WriteDataE;

    wire            MemWriteM;
    wire    [31:0]  ALUOutM;     
    wire    [31:0]  WriteDataM;     
    wire    [31:0]  ReadDataM;

    wire    [31:0]  ReadDataW;     
    wire            MemtoRegW;     
    wire    [31:0]  ALUOutW;     

    assign PCSrcD = {Jump, PCSrc}; 
    assign CLRF = |(PCSrcD);
    assign Op = InstrD[31:26];
    assign Funct = InstrD[5:0];
    assign pc = PCF;               // Output PC to top module

    mux4_1 U_mux4_1 (
        .PCPlus4F(PCPlus4F),  
        .PCBranchD(PCBranchD),
        .PCJumpD(PCJumpD),
        .PCSrcD(PCSrcD),
        .PCin(PCin)
    );

    FetchStage U_FetchStage (
        .CLK(CLK),
        .RST(RST),
        .StallF(StallF), 
        .PCin(PCin),
        .PCPlus4F(PCPlus4F),
        .InstrF(InstrF),
        .PCF(PCF)
    );

    FetchToDecode_REG U_FetchToDecode_REG (
        .CLK(CLK),
        .RST(RST),
        .PCPlus4F(PCPlus4F),
        .InstrF(InstrF),
        .StallD(StallD),
        .CLR(CLRF),
        .PCPlus4D(PCPlus4D),
        .InstrD(InstrD)
    );

    DecodeStage U_DecodeStage (
        .CLK(CLK),
        .RST(RST),
        .InstrD(InstrD),
        .PCPlus4D(PCPlus4D),
        .ALUOutM(ALUOutM),
        .WriteRegW(WriteRegW),
        .RegWriteW(RegWriteW),
        .ResultW(ResultW),
        .ForwardAD(ForwardAD),
        .ForwardBD(ForwardBD),
        .PCF(PCF),
        .RD1_D(RD1_D),
        .RD2_D(RD2_D),
        .SignImmD(SignImmD),
        .PCBranchD(PCBranchD),
        .ShifterOut_26(PCJumpD),
        .RsD(RsD),
        .RtD(RtD),
        .RdD(RdD),
        .EqualD(EqualD)
    );  // Fixed: Added closing parenthesis

    DecodeRegister U_DecodeRegister (
        .CLK(CLK),
        .RST(RST),
        .CLR(FlushE),
        .RegWriteD(RegWriteD),
        .MemtoRegD(MemtoRegD),
        .MemWriteD(MemWriteD),
        .ALUControlD(ALUControlD),
        .ALUSrcD(ALUSrcD),
        .RegDstD(RegDstD),
        .RD1_D(RD1_D),
        .RD2_D(RD2_D),
        .RsD(RsD),
        .RtD(RtD),
        .RdD(RdD),
        .SignImmD(SignImmD),
        .RegWriteE(RegWriteE),
        .MemtoRegE(MemtoRegE),
        .MemWriteE(MemWriteE),
        .ALUControlE(ALUControlE),
        .ALUSrcE(ALUSrcE),
        .RegDstE(RegDstE),
        .RD1_E(RD1_E),
        .RD2_E(RD2_E),
        .RsE(RsE),
        .RtE(RtE),
        .RdE(RdE),
        .SignImmE(SignImmE)
    );

    Execute_Block U_Execute_Block (
        .ALUSrcE(ALUSrcE),
        .RegDstE(RegDstE),
        .ForwardAE(ForwardAE),
        .ForwardBE(ForwardBE),
        .ALUControlE(ALUControlE), 
        .RD1_E(RD1_E),
        .RD2_E(RD2_E),
        .SignImmE(SignImmE),
        .RsE(RsE),
        .RtE(RtE),
        .RdE(RdE),
        .ALUOutE(ALUOutE),
        .WriteDataE(WriteDataE),
        .WriteRegE(WriteRegE),
        .Wd3E(ResultW),
        .ALUOutM(ALUOutM)
    );

    Execute_Reg U_Execute_Reg (
        .clk(CLK),
        .RST(RST),
        .RegWriteE(RegWriteE),
        .MemtoRegE(MemtoRegE),
        .MemWriteE(MemWriteE),
        .ALUOutE(ALUOutE),
        .WriteDataE(WriteDataE),
        .WriteRegE(WriteRegE),
        .RegWriteM(RegWriteM),
        .MemtoRegM(MemtoRegM),
        .MemWriteM(MemWriteM),
        .ALUOutM(ALUOutM),
        .WriteDataM(WriteDataM),
        .WriteRegM(WriteRegM)
    );

    DataMem U_DataMem (
        .clk(CLK),
        .rst(RST),
        .A(ALUOutM),
        .WD(WriteDataM),
        .WE(MemWriteM), 
        .RD(ReadDataM),
        .test_value(test_value)
    );

    Register U_Register (
        .clock(CLK),
        .reset(RST),
        .RegWriteM(RegWriteM),
        .MemtoRegM(MemtoRegM),
        .ALUOutM(ALUOutM),
        .WriteRegM(WriteRegM),
        .RD(ReadDataM),
        .RegWriteW(RegWriteW),
        .MemtoRegW(MemtoRegW),
        .ALUOutW(ALUOutW),
        .WriteRegW(WriteRegW),
        .ReadDataW(ReadDataW)
    );

    WriteBack_Mux U_WriteBack_Mux (
        .MemtoRegW(MemtoRegW),
        .ReadDataW(ReadDataW), 
        .ALUOutW(ALUOutW),
        .ResultW(ResultW)
    );

endmodule
