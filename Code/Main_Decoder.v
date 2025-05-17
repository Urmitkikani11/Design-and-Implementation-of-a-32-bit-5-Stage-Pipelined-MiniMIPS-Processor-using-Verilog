module Main_Decoder #(parameter width =6)
(
input      [width-1:0] opcode,
output reg             jump,
output reg             memtoreg,
output reg             memwrite,
output reg             branch,
output reg             alusrc,
output reg             regdst,
output reg             regwrite,
output reg [1:0]       aluop
);

always @(*)
begin
 case(opcode)
   6'b000000:begin
      jump    =1'b0;    
      memtoreg=1'b0;
      memwrite=1'b0;
      branch  =1'b0;
      alusrc  =1'b0;
      regdst  =1'b1;
      regwrite=1'b1;
      aluop   =2'b10;
             end
   6'b000010:begin
      jump    =1'b1;    
      memtoreg=1'b0;
      memwrite=1'b0;
      branch  =1'b0;
      alusrc  =1'b0;
      regdst  =1'b0;
      regwrite=1'b0;
      aluop   =2'b0;
             end
   6'b000100:begin
      jump    =1'b0;    
      memtoreg=1'b0;
      memwrite=1'b0;
      branch  =1'b1;
      alusrc  =1'b0;
      regdst  =1'b0;
      regwrite=1'b0;
      aluop   =2'b01;
             end
   6'b001000:begin
      jump    =1'b0;    
      memtoreg=1'b0;
      memwrite=1'b0;
      branch  =1'b0;
      alusrc  =1'b1;
      regdst  =1'b0;
      regwrite=1'b1;
      aluop   =2'b0;
             end
   6'b100011:begin
      jump    =1'b0;    
      memtoreg=1'b1;
      memwrite=1'b0;
      branch  =1'b0;
      alusrc  =1'b1;
      regdst  =1'b0;
      regwrite=1'b1;
      aluop   =2'b0;
             end
   6'b101011:begin
      jump    =1'b0;    
      memtoreg=1'b1;
      memwrite=1'b1;
      branch  =1'b0;
      alusrc  =1'b1;
      regdst  =1'b0;
      regwrite=1'b0;
      aluop   =2'b0;
             end
   default  :begin
      jump    =1'b0;    
      memtoreg=1'b0;
      memwrite=1'b0;
      branch  =1'b0;
      alusrc  =1'b0;
      regdst  =1'b0;
      regwrite=1'b0;
      aluop   =2'b0;
             end
  
 endcase
end

endmodule
