`timescale 1ns / 1ps
module top(
input fclk,
output [7:0] cathode,
output [3:0] anode,
input pb_read,
input reset
);
wire [3:0] dout1; wire[4:0] dout2; //for both the BRAMs
reg count=0;
reg enw; //write enable for fifo
reg[3:0] add=0; //address
wire [3:0] ones,tens,hundreds,thousands;
blk_mem_gen_0 b1(.clka (fclk),.addra(add),.douta(dout1)) ; //BLOCK RAM1
blk_mem_gen_1 b2(.clka (fclk),.addra(add),.douta(dout2)); //BLOCK RAM 2
always @(posedge fclk)
begin
if(add>4'd9) //STORING ONLY 10 ADDRESSES
enw<=1'b0;
else
enw<=1'b1;
add<=add+1;
end
wire clk_190;
wire deb_read;
wire [4:0] fifo_out;
fdiv c1(.inpclk(fclk),.clk_div(clk_190));
debounce d1(.clk_deb(clk_190), .pb(pb_read),.deb_out(deb_read)); //CLOCK PULSE
wire temp1, temp2;
fifo_generator_0 f1
(
.rst(reset),
.wr_clk(fclk),
.rd_clk(clk_190),
.din(dout1+dout2), //input=sum1+sum2
.wr_en(enw),
.rd_en(deb_read),
.dout(fifo_out),
.full(temp1),
.empty(temp2)
);
sevenseg_all
s1(.clk(fclk),.anode(anode),.cathode(cathode),.ones(ones),.tens(tens),.thousands(thousands),.h
undreds(hundreds)); //seven segment display
bintoBCD
b11(.number(fifo_out),.ones(ones),.tens(tens),.thousands(thousands),.hundreds(hundreds));
endmodule
