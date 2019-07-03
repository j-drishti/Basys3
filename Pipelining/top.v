`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 11:34:29 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    
    input [3:0] a,
    input[3:0] b,
    input fclk,
    output [7:0] cathode,
    output [3:0] anode


    );
    
    wire c1;
    wire [7:0] p;
    
    FULLADDER D(a[0]&b[0],1'b0,1'b0, c1,p[0]);
    FULLADDER D2(a[1]&b[0],1'b0,c1, c2,s0);
    FULLADDER ER(a[2]&b[0],1'b0,c2, c3,s1);
    FULLADDER FF(a[3]&b[0],1'b0,c3, o1,s2);
    
    FULLADDER FF3(a[0]&b[1],s0,1'b0, c4,p[1]);
    FULLADDER HG(a[1]&b[1],s1,c4, c5,s3);
    FULLADDER DFD(a[2]&b[1],s2,c5, c6,s4);
    FULLADDER T5(a[3]&b[1],o1,c6, o2,s5);
    
    FULLADDER B(a[0]&b[2],s3,1'b0, c7,p[2]);
    FULLADDER RF(a[1]&b[2],s4,c7, c8,s6);
    FULLADDER FFR(a[2]&b[2],s5,c8, c9,s7);
    FULLADDER X(a[3]&b[2],o2,c9, o3,s8);
    
    FULLADDER HJT(a[0]&b[3],s6,1'b0, c10,p[3]);
    FULLADDER R5(a[1]&b[3],s7,c10, c11,p[4]);
    FULLADDER  Y(a[2]&b[3],s8,c11, c12,p[5]);
    FULLADDER Z(a[3]&b[3],o3,c12, p[7],p[6]);  
    

        wire[3:0] ones, hundreds, thousands, tens;
        binary2bcd(.number(p), .ones(ones), .tens(tens), .hundreds(hundreds), .thousands(thousands));
        sevenseg_all s1(.clk(fclk),.clr(0), .num(p),.cathode(cathode) ,.anode(anode),.ones(ones), .hundreds(hundreds), .thousands(thousands), .tens(tens));
       
endmodule
