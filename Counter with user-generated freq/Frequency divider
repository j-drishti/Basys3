
`timescale 1ns / 1ps
module freqdivider(
output clk_out,
input clk
);
parameter width=26;
reg [width-1:0] count=0;
always@(posedge clk)
begin
count<=count+1;
end
assign clk_out= count[width-1];
endmodule
