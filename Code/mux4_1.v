module mux4_1  
(
    input       wire        [31:0]      PCPlus4F,  
    input       wire        [31:0]      PCBranchD,
    input       wire        [31:0]      PCJumpD,
    input       wire        [1:0]       PCSrcD,
    output      reg         [31:0]      PCin
);

localparam normal = 2'b00,
           branch = 2'b01,
           jump   = 2'b10;

always @(*) 
begin
    case(PCSrcD)
        normal : PCin =  PCPlus4F;
        branch : PCin =  PCBranchD;
        jump   : PCin =  PCJumpD;
        default : PCin = 32'hFFFFFFFF;
    endcase    
end
endmodule
