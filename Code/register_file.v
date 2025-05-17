`timescale 1ns/1ps

module register_file #(
    parameter Data_Width = 32,
              addres_width = 5  
) (
    input wire clk, rst, WE3,
    input wire [addres_width-1:0] A1, A2, A3,
    input wire [Data_Width-1:0] WD3,
    output wire [Data_Width-1:0] RD1, RD2
);
localparam regfile_depth = 1 << addres_width;
reg [Data_Width-1:0] reg_file [0:regfile_depth-1];
integer i;

always @(negedge clk or posedge rst) begin  // Fixed to posedge rst
    if (rst) begin
        for (i = 0; i < regfile_depth; i = i + 1) reg_file[i] <= 0;
        reg_file[9] <= 32'd5;  // $t1 = 5
        reg_file[10] <= 32'd7; // $t2 = 7
    end
    else if (WE3) reg_file[A3] <= WD3;
end

assign RD1 = reg_file[A1];
assign RD2 = reg_file[A2];
endmodule
