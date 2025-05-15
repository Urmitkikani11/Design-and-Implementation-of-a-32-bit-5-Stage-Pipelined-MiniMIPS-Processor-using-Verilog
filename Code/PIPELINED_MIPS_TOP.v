`timescale 1ns/1ps 
 
module PIPELINED_MIPS_TOP ( 
    input   wire            CLK,     
    input   wire            RST,     
    output  wire   [15:0]   test_value,     
    output  wire   [31:0]   pc          // Added PC output 
); 
 
    wire            Jump; 
    wire            PCSrc;            
    wire            StallF; 
    wire            StallD; 
    wire            FlushE; 
    wire            ForwardAD; 
    wire            ForwardBD; 
    wire   [1:0]    ForwardAE; 
    wire   [1:0]    ForwardBE; 
    wire            RegWriteD; 
    wire            MemtoRegD; 
    wire            MemWriteD; 
    wire   [2:0]    ALUControlD; 
    wire            ALUSrcD; 
    wire            RegDstD;  
    wire   [5:0]    Op; 
    wire   [5:0]    Funct; 
    wire            EqualD; 
    wire   [4:0]    RsE;      
    wire   [4:0]    RtE; 
    wire   [4:0]    RsD;      
    wire   [4:0]    RtD;   
    wire   [4:0]    WriteRegE; 
    wire   [4:0]    WriteRegM; 
    wire   [4:0]    WriteRegW; 
    wire            RegWriteE; 
    wire            MemtoRegE; 
    wire            RegWriteM; 
    wire            MemtoRegM; 
    wire            RegWriteW; 
    wire            BranchD; 
 
    DataPath U_DataPath ( 
        .CLK(CLK), 
        .RST(RST), 
        .Jump(Jump), 
        .PCSrc(PCSrc),            
        .StallF(StallF), 
        .StallD(StallD), 
        .FlushE(FlushE), 
        .ForwardAD(ForwardAD), 
        .ForwardBD(ForwardBD), 
        .ForwardAE(ForwardAE), 
        .ForwardBE(ForwardBE), 
        .RegWriteD(RegWriteD), 
        .MemtoRegD(MemtoRegD), 
        .MemWriteD(MemWriteD), 
        .ALUControlD(ALUControlD), 
        .ALUSrcD(ALUSrcD), 
        .RegDstD(RegDstD), 
        .Op(Op), 
        .Funct(Funct), 
        .EqualD(EqualD), 
        .RsE(RsE),      
        .RtE(RtE), 
        .RsD(RsD),      
        .RtD(RtD),   
        .WriteRegE(WriteRegE), 
        .WriteRegM(WriteRegM), 
        .WriteRegW(WriteRegW), 
        .RegWriteE(RegWriteE), 
        .MemtoRegE(MemtoRegE), 
        .RegWriteM(RegWriteM), 
        .MemtoRegM(MemtoRegM), 
        .RegWriteW(RegWriteW), 
        .test_value(test_value), 
        .pc(pc)                 // Added PC output 
    ); 
 
    Control_Unit U_Control_Unit ( 
        .Funct(Funct), 
        .OPcode(Op), 
        .Zero(EqualD), 
        .Jump(Jump), 
        .MemtoReg(MemtoRegD), 
        .MemWrite(MemWriteD), 
        .Branch(BranchD), 
        .ALUSrc(ALUSrcD), 
        .RegDst(RegDstD), 
        .RegWrite(RegWriteD), 
        .ALUControl(ALUControlD), 
        .PCSrc(PCSrc) 
    ); 
    Hazard_Unit U_Hazard_Unit ( 
        .RegWriteM(RegWriteM),  
        .RegWriteW(RegWriteW),  
        .MemtoRegE(MemtoRegE),  
        .BranchD(BranchD),  
        .RegWriteE(RegWriteE),  
        .MemtoRegM(MemtoRegM),  
        .JumpD(Jump), 
        .RsE(RsE),  
        .RtE(RtE),  
        .RsD(RsD),  
        .RtD(RtD),  
        .WriteRegM(WriteRegM),  
        .WriteRegW(WriteRegW),  
        .WriteRegE(WriteRegE), 
        .ForwardAE(ForwardAE),  
        .ForwardBE(ForwardBE), 
        .ForwardAD(ForwardAD),  
        .ForwardBD(ForwardBD), 
        .FlushE(FlushE),  
        .StallD(StallD),  
        .StallF(StallF) 
    ); 
 
Endmodule 
