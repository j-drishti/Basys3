//DATAPATH 
`timescale 1ns / 1ps
module gcd(
input clr,
input clk,
input [3:0] xin,
input [3:0] yin,
output reg [3:0] gcd,
input xmsel,
input ymsel,
input xld,
input yld,
input gld,
output reg equalflag,
output reg lessthanflag);
reg [3:0] x, y, xreg,yreg,reg_gcd;
wire [3:0] xmy,ymx;
assign xmy = x-y;
assign ymx = y-x;
always @(posedge clk)
begin
 if (clr == 1'b1)
 xreg <= 0;
 else if (xld == 1'b1)
 begin
 if (xmsel == 1'b0) xreg <= xmy;
 else xreg <= xin;
 end

 else
 xreg <= xreg;
end
always @(posedge clk)
 begin
 if (clr == 1'b1)
 yreg <= 0;
 else if (yld)
 begin
 if (ymsel == 1'b0) yreg <= ymx;
 else
 yreg <= yin;
 end
 else
 yreg <= yreg;
end
always @ (posedge clk)
begin
if (clr == 1'b1)
 reg_gcd <= 0;
else if (gld)
 begin
 if ( y==0||x==0) reg_gcd <= x + y;
 else reg_gcd <= x;
 end
else reg_gcd <= reg_gcd;
end
always@ (*)
begin
if (gld <= 1'b1) gcd <= reg_gcd;
else gcd <= gcd;
end
always@ (*)
begin
x <= xreg;
y <= yreg;
end
always@ (*)
begin
if (x < y) lessthanflag <=1'b1;
else lessthanflag <=1'b0;
end
always@(*)
begin
if (x==y)
equalflag <= 1'b1;
else if(x==0 || y==0)
equalflag <= 1'b1;
else
equalflag <= 1'b0;
end
endmodule
