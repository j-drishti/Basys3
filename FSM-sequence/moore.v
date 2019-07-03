FSM CODE FOR OVERLAPPING SEQUENCE
`timescale 1ns / 1ps
//overlapping
module moore(
 input fsm_clk,
 input clr,
 input din, //push btton input
 output reg seq_det=1'b0, //if output detected
 output reg [2:0] ps //present state
 );

 //three always blks-- present state, next state, dout

 reg [2:0]ns; //next state
 parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101;

 always @(posedge fsm_clk or posedge clr) //this if for present state
 begin
 if(clr)
 ps<=s0;
 else
 ps<=ns;

 end

 always @(*) //combinational blk- next state
 begin
 case (ps)

 s0: if(din) //if din is 1
 ns<=s1;
 else
 ns<=s0;
 s1:
 if (din)
 ns<=s1;
 else
 ns<=s2;

 s2:
 if (din==1'b0)
 ns<=s0;
 else
 ns<=s3;
 s3:
 if (din==1'b1) ns<=s1;
 else ns<=s4;
 s4:
 if (din==1'b1) ns<=s3;
 else ns<=s0;

 default: ns<=ns;

 endcase

 end

 always @(posedge fsm_clk) //ouput led
 begin
 if (clr)
 seq_det=1'b0;
 else if (ps==s4)
 seq_det<=1'b1;
 else
 seq_det<=1'b0;
 end

endmodule
