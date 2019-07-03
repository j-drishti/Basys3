DEBOUNCE
`timescale 1ns / 1ps
module debouncer(
input clock_in,
input clr_in,
output clr_out
);

reg D1,D2,D3;

 always@ (posedge clock_in)
 begin
 D1 <= clr_in;
 D2 <= D1;
 D3 <= D2;
 end

 assign clr_out = D1 && D2 && D3;
endmodule
