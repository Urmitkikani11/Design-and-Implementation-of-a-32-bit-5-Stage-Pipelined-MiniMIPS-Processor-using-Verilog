module Comparator (
input  wire [31:0] IN1,
input  wire [31:0] IN2,
output wire        OUT   
);

assign OUT = (IN1 == IN2 )? 1'b1:1'b0;

endmodule
