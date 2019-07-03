CLOCK-PULSE
`timescale 1ns / 1ps
module pulse_debounce(
input inp,
input clk,
input clr,
output out
);
reg d1,d2,d3;

always @(posedge clk)
begin
 d1 <= inp;
 d2 <= d1;
 d3 <= d2;
end

assign out = d1 & d2 & ~d3;
endmodule

