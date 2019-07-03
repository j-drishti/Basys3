`timescale 1ns / 1ps
module debounce(input clk_deb,
input pb,
output deb_out );
reg [2:0] ff;
always @(posedge clk_deb)
begin
ff[2]<=pb;
ff[1]<=ff[2];
ff[0]<=ff[1];
end
assign deb_out= ff[0]&ff[1]&~ff[2]; //inverting to generate one pulse
endmodule
