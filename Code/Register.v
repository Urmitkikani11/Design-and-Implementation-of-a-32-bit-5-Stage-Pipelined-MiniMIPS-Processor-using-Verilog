module Register
(
input      clock,reset,RegWriteM,MemtoRegM,
input   wire    [31:0] ALUOutM,
input     [4:0]WriteRegM,
input      [31:0] RD,
output  reg   RegWriteW,MemtoRegW,
output  reg   [31:0]  ALUOutW,
output  reg   [4:0]WriteRegW,
output  reg   [31:0] ReadDataW
);
always @(posedge clock or negedge reset)
begin
  

    if( ~reset)
    begin
        MemtoRegW<=0;
        ReadDataW <= 0;
        ALUOutW <= 0;
        RegWriteW <= 0;
        WriteRegW <= 0;
    end
     else 
     begin
         MemtoRegW<=MemtoRegM;
        ReadDataW <= RD;
        RegWriteW <= RegWriteM;
        ALUOutW <= ALUOutM;
        WriteRegW <= WriteRegM;
     end
 end 

endmodule
