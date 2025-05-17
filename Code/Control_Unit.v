`timescale 1ns/1ps

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
