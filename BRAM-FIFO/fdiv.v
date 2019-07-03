`timescale 1ns / 1ps
module fdiv(
output clk_div,
input inpclk
);
parameter width=20;
reg [width-1:0] count=0;
always @(posedge inpclk)
begin
count<=count+1;
end
assign clk_div=count[19];
endmodule
