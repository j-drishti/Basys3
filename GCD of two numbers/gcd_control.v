//GCD CONTROL  path
`timescale 1ns / 1ps
module gcd_control(
input clr,
input clk,
input go,
output reg xmsel,
output reg ymsel,
output reg xld,
output reg yld,
output reg gld,
input eqflag,
input ltflag);
reg [2:0] ps,ns;
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b011, s3 = 3'b100, s4=3'b101,s5=3'b110 ,done = 3'b010;
always @ (posedge clk or posedge clr)
begin
if(clr)
 ps<=s0;
else ps<=ns;
end
always @ (*)
begin
case (ps)
 s0:
 begin
 if(go) ns <= s1;
 else ns <= s0;
 end

 s1: ns <= s2;
 s2:
 begin
 if (eqflag == 1'b1)
 ns <= done;
 else ns <= s3;
 end
 done: begin
 if (clr) ns <= s0;
 else ns <= done;
 end
 s3: begin
 if (ltflag == 1'b1) ns <= s4;
 else ns <= s5;
 end

 s4: ns <= s2;

 s5: ns <= s2;
 default: ns <= ns;
endcase
end
always @(*)
begin
case(ps)
 s1: begin
 xmsel <= 1'b1;
 ymsel <= 1'b1;
 xld <= 1'b1;
 yld <= 1'b1;
 gld <= 1'b0;
 end


 done:
 begin
 xmsel<=1'b1;
 ymsel<=1'b1;
 gld<=1'b1;
 xld<=1'b0;
 yld<=1'b0;
 end

 s4:
 begin
 xmsel<=1'b0;
 ymsel<=1'b0;
 gld<=1'b0;
 yld<=1'b1;
 xld<=1'b0;
 end

 s5:
 begin
 xmsel<=1'b0;
 ymsel<=1'b0;
 gld<=1'b0;
 xld<=1'b1;
 yld<=1'b0;
 end
 default:
 begin
 xmsel<=1'b0;
 ymsel<=1'b0;
 gld<=1'b0;
 xld<=1'b0;
 yld<=1'b0;
 end
endcase
end
endmodule
