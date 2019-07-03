
TOP MODULE
`timescale 1ns / 1ps
module top(
input clk,
input go,
input clr,
input [3:0] A,
 input [3:0] B,
 output [7:0] cathode,
output [3:0] anode
);

wire clk190, clk25, deb_clr, deb_go, clk_pulse;
freq_divider ff(clk, clk190, clk25);
 debouncer dd(clk190, clr, deb_clr);
debouncer d3(clk190, go, deb_go);
pulse_debounce p0(deb_go, clk25, deb_clr, clk_pulse);
 reg [3:0] xin,yin;
 wire[3:0] gcd;
 always @(posedge clk)
 begin
 xin <=A;
 yin <=B;

 end

 gcd gg(deb_clr,clk25,xin,yin,gcd,xmsel, ymsel, xld, yld,gld,eqflag,ltflag);
 gcd_control ghD(deb_clr,clk25,clk_pulse,xmsel,ymsel,xld,yld,gld,eqflag,ltflag);
wire [3:0] tens, ones;
binary2bcd rr(gcd, tens, ones);
sevenseg tt(.clock(clk),.ones(ones),.tens(tens),.cathode(cathode),.anode(anode));
endmodule

