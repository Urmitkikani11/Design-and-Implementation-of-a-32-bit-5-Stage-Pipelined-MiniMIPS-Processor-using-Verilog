`timescale 1ns/1ps

module Hazard_Unit (
    input wire RegWriteM, RegWriteW, MemtoRegE, BranchD, RegWriteE, MemtoRegM, JumpD,
    input wire [4:0] RsE, RtE, RsD, RtD, WriteRegM, WriteRegW, WriteRegE,
    output reg [1:0] ForwardAE, ForwardBE,
    output wire ForwardAD, ForwardBD, FlushE, StallD, StallF
);
    wire lwstall, branchstall;

    always @(*) begin
        ForwardAE = (RsE != 0 && RsE == WriteRegM && RegWriteM) ? 2'b10 :
                    (RsE != 0 && RsE == WriteRegW && RegWriteW) ? 2'b01 : 2'b00;
        ForwardBE = (RtE != 0 && RtE == WriteRegM && RegWriteM) ? 2'b10 :
                    (RtE != 0 && RtE == WriteRegW && RegWriteW) ? 2'b01 : 2'b00;
    end

    assign lwstall = ((RsD == RtE) || (RtD == RtE)) && MemtoRegE && (RtE != 0);
    assign branchstall = (BranchD && RegWriteE && ((WriteRegE == RsD) || (WriteRegE == RtD)) && (WriteRegE != 0)) ||
                         (BranchD && MemtoRegM && ((WriteRegM == RsD) || (WriteRegM == RtD)) && (WriteRegM != 0));

    assign ForwardAD = (RsD != 0) && (RsD == WriteRegM) && RegWriteM;
    assign ForwardBD = (RtD != 0) && (RtD == WriteRegM) && RegWriteM;

    assign StallF = lwstall || branchstall;
    assign StallD = lwstall || branchstall;
    assign FlushE = lwstall || branchstall;  
endmodule
