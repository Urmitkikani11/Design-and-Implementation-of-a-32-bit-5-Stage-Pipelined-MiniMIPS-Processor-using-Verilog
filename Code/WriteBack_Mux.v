module WriteBack_Mux
    (
        input MemtoRegW,
        input [31:0] ReadDataW, ALUOutW,
        output [31:0] ResultW
    );
assign ResultW = (MemtoRegW) ? ReadDataW : ALUOutW;
endmodule
