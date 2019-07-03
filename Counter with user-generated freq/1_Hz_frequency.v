`timescale 1ns / 1ps
module onefreq(clk_in, clko);
output clko;
input clk_in;
reg clko;
reg [27:0]count;
initial
begin
clko <= 1'b0;
count <= 28'b0;
end
always @(posedge clk_in)
begin
if(count < 28'b0010111110101111000010000000)
count <= count + 1'b1;
else if(count === 28'b0010111110101111000010000000)
begin
clko <= ~clko;
count <= 28'b0;
end
end
endmodule
