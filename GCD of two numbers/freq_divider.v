FREQUENCY DIVIDER
`timescale 1ns / 1ps
module freq_divider(
input clk_in,
output clk19,
output clk25
);

reg [19:0] count;

always @(posedge clk_in)
begin
 count = count + 1;
end

assign clk19 = count[18];
assign clk25 = count[1];
endmodule
