`timescale 1ns / 1ps
module top(
 input clock_in,
 input [3:0] x,
 input [31:0] p,
 input [5:0] y_prev,
 input [3:0]x_minus4,
 output reg [5:0] data

 );

always @(posedge clock_in) begin
if(p==0)
 data<= x;
else if(p<32'd4)
begin
data<= y_prev + x*x;
end
else
begin
data <= y_prev + (x-x_minus4)*(x+x_minus4);
end
end

endmodule
Testbench
`timescale 1ns / 1ps
module test(
 );

 reg clk=0;
 always #5 clk = !clk;

 reg [3:0]curr,x_minus4;
 reg [5:0] y_prev;
 reg[31:0] indx;
 wire[5:0] data;
 reg [3:0] x[8:0];
 reg[5:0] y[8:0];
integer i;

 top t( .clock_in(clk),
 .x(curr),
 .p(indx),
 .y_prev(y_prev),
 .x_minus4(x_minus4),
 .data(data));

 initial
 begin

 indx=0;
 y_prev=0;
 x_minus4=0;
 x[0]<=4'd1;
 x[1]<=4'd2;
 x[2]<=4'd3;
 x[3]<=4'd3;
 x[4]<=4'd3;
 x[5]<=4'd1;
 x[6]<=4'd2;
 x[7]<=4'd2;
 x[8]<=4'd1;

 #10

 for (i=0; i<9; i=i+1) begin

 indx<=i;
 curr<=x[i];
 y[i][5:0]<=data;

 if(i==0)
 begin
 y_prev<=0;
 x_minus4<=0;
 end

 else if(i<4)
 begin
 y_prev<=data[i-1];
 x_minus4<=0;
 end

 else
 begin
 y_prev<=data[i-1];
 x_minus4<=data[i-4];
 end



 end

 end
endmodule
