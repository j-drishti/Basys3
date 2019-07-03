`timescale 1ns / 1ps
module bintoBCD(number, thousands, hundreds, tens, ones);
// I/O Signal Definitions
input [4:0] number;
output reg [3:0] thousands;
output reg [3:0] hundreds;
output reg [3:0] tens;
output reg [3:0] ones;
// Internal variable for storing bits
reg [19:0] shift;//n=(n*ceil(n/3))
integer i;
always @(number)
begin
// Clear previous number and store new number in shift register
shift[19:8] = 0;
shift[7:0] = number;
// Loop eight times
for (i=0; i<8; i=i+1) begin
if (shift[11:8] >= 5)//ones
shift[11:8] = shift[11:8] + 3;
if (shift[15:12] >= 5)//tens
shift[15:12] = shift[15:12] + 3;
if (shift[19:16] >= 5)//hundreds
shift[19:16] = shift[19:16] + 3;
// Shift entire register left once
shift = shift << 1;//left shift by one
end
// Push decimal numbers to output
hundreds = shift[19:16];
tens = shift[15:12];
ones = shift[11:8];
thousands= 4'b0000;
end
endmodule
