module DecodeStage ( 
    input  wire [31:0]   InstrD, 
    input  wire [31:0]   PCPlus4D, 
    input  wire [31:0]   ALUOutM, 
    input  wire [4:0]    WriteRegW, 
    input  wire          RegWriteW, 
    input  wire [31:0]   ResultW, 
    input  wire          RST, 
    input  wire          CLK, 
    input  wire          ForwardAD, 
    input  wire          ForwardBD, 
    input  wire [31:0]   PCF,          // Added PC input from Fetch stage 
    output wire [31:0]   RD1_D, 
    output wire [31:0]   RD2_D, 
    output wire [31:0]   SignImmD, 
    output wire [31:0]   PCBranchD, 
    output wire [31:0]   ShifterOut_26, 
    output wire [4:0]    RsD, 
    output wire [4:0]    RtD, 
    output wire [4:0]    RdD, 
    output wire          EqualD 
); 
 
    // Internal Connections 
    wire [31:0] MUX_RD1_out1; 
    wire [31:0] MUX_RD2_out2; 
    wire [31:0] ShifterOut_32; 
    wire [27:0] ShifterOut_28; 
 
    // Assign output statements 
    assign ShifterOut_26 = {InstrD[31:28], ShifterOut_28};  
    assign RsD = InstrD[25:21]; 
    assign RtD = InstrD[20:16]; 
    assign RdD = InstrD[15:11]; 
 
    // Instantiation of Register File 
    register_file U_register_file ( 
        .clk(CLK), 
        .rst(RST), 
        .WE3(RegWriteW), 
        .A1(InstrD[25:21]), 
        .A2(InstrD[20:16]), 
        .A3(WriteRegW), 
        .WD3(ResultW), 
        .RD1(RD1_D), 
        .RD2(RD2_D) 
    ); 
 
    // Instantiation of Multiplexers 
    Mux U_MUX_RD1 ( 
        .D0(RD1_D),  
        .D1(ALUOutM), 
        .S(ForwardAD),    
        .Y(MUX_RD1_out1)       
    ); 
 
    Mux U_MUX_RD2 ( 
        .D0(RD2_D),  
        .D1(ALUOutM), 
        .S(ForwardBD),    
        .Y(MUX_RD2_out2)    
    ); 
 
    // Instantiation of Comparator 
    Comparator U_Comparator ( 
        .IN1(MUX_RD1_out1), 
        .IN2(MUX_RD2_out2), 
        .OUT(EqualD)  
    ); 
 
    // Instantiation of Sign Extend 
    Sign_Extend U_Sign_Extend ( 
        .instr(InstrD[15:0]),  
        .SignImm(SignImmD) 
    ); 
 
    // Instantiation of first Shifter 
    shift_left U_shift_left_32 ( 
        .in_shift(SignImmD), 
        .out_shift(ShifterOut_32) 
    ); 
 
    // Instantiation of Second Shifter 
    shift_left #(.in_width(26), .out_width(28)) U_shift_left_26 ( 
        .in_shift(InstrD[25:0]), 
        .out_shift(ShifterOut_28) 
    ); 
 
    // Instantiation of Adder 
    Adder U_Adder ( 
        .A(ShifterOut_32), 
        .B(PCPlus4D), 
        .C(PCBranchD)  
    ); 
endmodule 
`timescale 1ns/1ps 
//control unit module 
module Control_Unit #(parameter width = 6) ( 
    input  [width-1:0]  Funct, 
    input  [width-1:0]  OPcode, 
    input  wire         Zero, 
    output wire         Jump, 
    output wire         MemtoReg, 
    output wire         MemWrite, 
    output wire         Branch, 
    output wire         ALUSrc, 
    output wire         RegDst, 
    output wire         RegWrite, 
    output wire [2:0]   ALUControl, 
    output wire         PCSrc 
); 
 
wire [1:0] ALUOp; 
 
assign PCSrc = Zero & Branch; 
 
Main_Decoder main_decoder ( 
    .opcode(OPcode), 
    .jump(Jump),  
    .memtoreg(MemtoReg),   
    .memwrite(MemWrite),  
    .branch(Branch), 
    .alusrc(ALUSrc), 
    .regdst(RegDst), 
    .regwrite(RegWrite),  
    .aluop(ALUOp) 
); 
 
ALU_Decoder alu_decoder ( 
    .funct(Funct),     
    .aluop(ALUOp),  
    .alucontrol(ALUControl) 
); 
 
endmodule 
 
// Main Decoder 
module Main_Decoder ( 
    input  [5:0] opcode, 
    output reg   jump, 
    output reg   memtoreg, 
    output reg   memwrite, 
    output reg   branch, 
    output reg   alusrc, 
    output reg   regdst, 
    output reg   regwrite, 
    output reg  [1:0] aluop 
); 
 
always @(*) begin 
    case (opcode) 
        6'b000000: begin // R-type (e.g., add) 
            jump = 0; 
            memtoreg = 0; 
            memwrite = 0; 
            branch = 0; 
            alusrc = 0; 
            regdst = 1; 
            regwrite = 1; 
            aluop = 2'b10; 
        end 
        6'b100011: begin // lw 
            jump = 0; 
            memtoreg = 1; 
            memwrite = 0; 
            branch = 0; 
            alusrc = 1; 
            regdst = 0; 
            regwrite = 1; 
            aluop = 2'b00; 
        end 
        6'b101011: begin // sw 
            jump = 0; 
            memtoreg = 0; // Don’t care 
            memwrite = 1; 
            branch = 0; 
            alusrc = 1; 
            regdst = 0;   // Don’t care 
            regwrite = 0; 
            aluop = 2'b00; 
        end 
        6'b000100: begin // beq 
            jump = 0; 
            memtoreg = 0; // Don’t care 
            memwrite = 0; 
            branch = 1; 
            alusrc = 0; 
            regdst = 0;   // Don’t care 
            regwrite = 0; 
            aluop = 2'b01; 
        end 
        6'b000010: begin // j 
            jump = 1; 
            memtoreg = 0; // Don’t care 
            memwrite = 0; 
            branch = 0; 
            alusrc = 0;   // Don’t care 
            regdst = 0;   // Don’t care 
            regwrite = 0; 
            aluop = 2'b00; // Don’t care 
        end 
        default: begin 
            jump = 0; 
            memtoreg = 0; 
            memwrite = 0; 
            branch = 0; 
            alusrc = 0; 
            regdst = 0; 
            regwrite = 0; 
            aluop = 2'b00; 
        end 
    endcase 
end 
 
endmodule 
 
// ALU Decoder 
module ALU_Decoder ( 
    input  [5:0] funct, 
    input  [1:0] aluop, 
    output reg [2:0] alucontrol 
); 
 
always @(*) begin 
    case (aluop) 
        2'b00: alucontrol = 3'b010; // Add (for lw, sw) 
        2'b01: alucontrol = 3'b110; // Subtract (for beq) 
        2'b10: begin // R-type 
            case (funct) 
                6'b100000: alucontrol = 3'b010; // add 
                6'b100010: alucontrol = 3'b110; // subtract 
                6'b100100: alucontrol = 3'b000; // and 
                6'b100101: alucontrol = 3'b001; // or 
                6'b101010: alucontrol = 3'b111; // slt 
                default:   alucontrol = 3'b000; // Default to and 
            endcase 
        end 
        default: alucontrol = 3'b000; // Default 
    endcase 
end 
endmodule 
