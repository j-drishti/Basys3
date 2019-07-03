`timescale 1ns / 1ps
module countr(
input clk,
outputreg[4:0]count=0,
input reset
);
always@(posedge clk)
begin
if(reset) count<= 4'd0;
else count<=count +1;
end
endmodule
