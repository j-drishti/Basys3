`timescale 1ns / 1ps
module debouncer(
input clk_deb,
input push_button,
output deb_out
);
reg [0:2]ff;
always @(posedge clk_deb)
begin
ff[0]<=push_button;
ff[1]<=ff[0];
ff[2]<=ff[1];
end
assign deb_out= ff[0]&ff[1]&ff[2];
endmodule
