`timescale 1ns / 1ps
module top(
 input mclk,
 input clr,
 input [1:0] pb_seq, //two push buttons to get 0 and 1
 output reg led,
 input opt,
 output [7:0] cathode,
 output [3:0] anode
 );
 wire clk_190, push_clk, pb_press;
 wire [2:0] cnt1,cnt2;
 reg[2:0] ps;
 wire led1,led2;
 freqdivider #(20) f(.clk_out(clk_190), .clk(mclk));
 assign pb_press= pb_seq[0]||pb_seq[1]; //when either of the buttons is pressed
 debounce d( .clk(clk_190),.deb_in(pb_press),.deb_out(push_clk)); //clock pulse
 moore1 m( .fsm_clk(push_clk), //non overlapping
 .clr(clr),
 .din(pb_seq[1]), //push btton input.
 .seq_det(led1),
 .ps(cnt1));

 moore mb( .fsm_clk(push_clk), //overlapping
 .clr(clr),
 .din(pb_seq[1]), //push btton input.
 .seq_det(led2),
 .ps(cnt2));


 sevenseg_all s1(
 .clk(mclk),
 .clr(clr),
 .ones(ps),
 .tens(4'd5),
 .cathode(cathode),
 .anode(anode));


 always @(*)
 begin
 if(opt==2'b00)
 begin //non overlapping
 ps<=cnt1;
 led<=led1;
 end
 else
 begin
 ps<=cnt2; //overlapping
 led<=led2;
 end
 end

endmodule
