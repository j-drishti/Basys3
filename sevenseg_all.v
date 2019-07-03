
`timescale 1ns / 1ps
module sevenseg_all(
input clk,
input clr, // clear pin used to reset the LED display
input [3:0] ones,
input [3:0] tens,
input [3:0] hundreds,
input [3:0] thousands,
input [3:0] num,
output [7:0] cathode,
output [3:0] anode
);
reg [6:0]sseg_temp;
reg [3:0]an_temp = 4'b1110 ;
reg [17:0] count; //the 18 bit counter which allows us to multiplex at 1000Hz
always @ (posedge clk)
begin
count <= count + 1;
end
//code for display multiple digits (do not initialize an_temp in line 41 and comment out
lines 44 to 60)
always @ (*)
begin
case(count[17:16]) //using only the 2 MSB's of the counter
2'b00 : //When the 2 MSB's are 00 enable the fourth display
begin
case(ones)
4'd0 : sseg_temp = 7'b0000001; //to display 0
4'd1 : sseg_temp = 7'b1001111; //to display 1
4'd2 : sseg_temp = 7'b0010010; //to display 2
4'd3 : sseg_temp = 7'b0000110; //to display 3
4'd4 : sseg_temp = 7'b1001100; //to display 4
4'd5 : sseg_temp = 7'b0100100; //to display 5
4'd6 : sseg_temp = 7'b0100000; //to display 6
4'd7 : sseg_temp = 7'b0001111; //to display 7
4'd8 : sseg_temp = 7'b0000000; //to display 8
4'd9 : sseg_temp = 7'b0000100; //to display 9
default : sseg_temp = 7'b1111110; //dash
endcase
//sseg = ones;
an_temp = 4'b1110;
end
2'b01: //When the 2 MSB's are 01 enable the third display
begin
case(tens)
4'd0 : sseg_temp = 7'b0000001; //to display 0
4'd1 : sseg_temp = 7'b1001111; //to display 1
4'd2 : sseg_temp = 7'b0010010; //to display 2
4'd3 : sseg_temp = 7'b0000110; //to display 3
4'd4 : sseg_temp = 7'b1001100; //to display 4
4'd5 : sseg_temp = 7'b0100100; //to display 5
4'd6 : sseg_temp = 7'b0100000; //to display 6
4'd7 : sseg_temp = 7'b0001111; //to display 7
4'd8 : sseg_temp = 7'b0000000; //to display 8
4'd9 : sseg_temp = 7'b0000100; //to display 9
default : sseg_temp = 7'b1111110; //dash
endcase
//sseg = tens;
an_temp = 4'b1101;
end
2'b10: //When the 2 MSB's are 10 enable the second display
begin
case(hundreds)
4'd0 : sseg_temp = 7'b0000001; //to display 0
4'd1 : sseg_temp = 7'b1001111; //to display 1
4'd2 : sseg_temp = 7'b0010010; //to display 2
4'd3 : sseg_temp = 7'b0000110; //to display 3
4'd4 : sseg_temp = 7'b1001100; //to display 4
4'd5 : sseg_temp = 7'b0100100; //to display 5
4'd6 : sseg_temp = 7'b0100000; //to display 6
4'd7 : sseg_temp = 7'b0001111; //to display 7
4'd8 : sseg_temp = 7'b0000000; //to display 8
4'd9 : sseg_temp = 7'b0000100; //to display 9
default : sseg_temp = 7'b1111110; //dash
endcase
//sseg = hundreds;
an_temp = 4'b1011;
end
2'b11: //When the 2 MSB's are 11 enable the first display
begin
case(thousands)
4'd0 : sseg_temp = 7'b0000001; //to display 0
4'd1 : sseg_temp = 7'b1001111; //to display 1
4'd2 : sseg_temp = 7'b0010010; //to display 2
4'd3 : sseg_temp = 7'b0000110; //to display 3
4'd4 : sseg_temp = 7'b1001100; //to display 4
4'd5 : sseg_temp = 7'b0100100; //to display 5
4'd6 : sseg_temp = 7'b0100000; //to display 6
4'd7 : sseg_temp = 7'b0001111; //to display 7
4'd8 : sseg_temp = 7'b0000000; //to display 8
4'd9 : sseg_temp = 7'b0000100; //to display 9
default : sseg_temp = 7'b1111110; //dash
endcase
//sseg = thousands;
an_temp = 4'b0111;
end
endcase
end
assign anode = an_temp;
assign cathode = {sseg_temp, 1'b1};
endmodule
