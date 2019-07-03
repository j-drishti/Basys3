
//this module generates one clock pulse
`timescale 1ns / 1ps
module debounce(
input clk,
input deb_in,
output deb_out
);
reg D1,D2,D3;
always@(posedge clk)
begin
D1 <= deb_in;
D2 <= D1;
D3 <= D2;
end
assign deb_out = D1 && D2 && ~D3;
endmodule
