`timescale 1ns / 1ps


module top(input clk, input [5:0] a,
            input [5:0] b,
             output reg [15:0] que

    );
 

 wire clk;
 wire [5:0] sout1,aout1,bout1,sout2,aout2,bout2,sout3,aout3,bout3,sout4,aout4,bout4,sout5,aout5,bout5,sout6,aout6,bout6,q;
  wire [5:1] cout1,cout2,cout3,cout4,cout5,cout6,sign;
    circle c1(clk,b[5], 1'b1,a[5],cout1[5],sout1[5],aout1[5],bout1[5],q[5],a[5]);
    circle c2(clk,b[4], bout1[5],a[4],cout1[4],sout1[4],aout1[4],bout1[4],cout1[5],a[5]);
    circle c3(clk,b[3], bout1[4],a[3],cout1[3],sout1[3],aout1[3],bout1[3],cout1[4],a[5]);
    circle c4(clk,b[2], bout1[3],a[2],cout1[2],sout1[2],aout1[2],bout1[2],cout1[3],a[5]);
    circle c5(clk,b[1], bout1[2],a[1],cout1[1],sout1[1],aout1[1],bout1[1],cout1[2],a[5]);
    circle c6(clk,b[0], bout1[1],a[0],bout1[0],sout1[0],aout1[0],bout1[0],cout1[1],a[5]); 
    
    
    circle c21(clk,sout1[4], q[5],      a[5],cout2[5],sout2[5],aout2[5],bout2[5],q[4],q[5]);
    circle c22(clk,sout1[3], bout2[5],a[4],cout2[4],sout2[4],aout2[4],bout2[4],cout2[5],q[5]);
    circle c23(clk,sout1[2], bout2[4],a[3],cout2[3],sout2[3],aout2[3],bout2[3],cout2[4],q[5]);
    circle c24(clk,sout1[1], bout2[3],a[2],cout2[2],sout2[2],aout2[2],bout2[2],cout2[3],q[5]);
    circle c25(clk,sout1[0], bout2[2],a[1],cout2[1],sout2[1],aout2[1],bout2[1],cout2[2],q[5]);
    circle c26(clk,1'b0, bout2[1],a[0],bout2[0],sout2[0],aout2[0],bout2[0],cout2[1],q[5]);
    
     circle c31(clk,sout2[4], q[4],      a[5],cout3[5],sout3[5],aout3[5],bout3[5],q[3],q[4]);
    circle c32(clk,sout2[3], bout3[5],a[4],cout3[4],sout3[4],aout3[4],bout3[4],cout3[5],q[4]);
    circle c33(clk,sout2[2], bout3[4],a[3],cout3[3],sout3[3],aout3[3],bout3[3],cout3[4],q[4]);
    circle c34(clk,sout2[1], bout3[3],a[2],cout3[2],sout3[2],aout3[2],bout3[2],cout3[3],q[4]);
    circle c35(clk,sout2[0], bout3[2],a[1],cout3[1],sout3[1],aout3[1],bout3[1],cout3[2],q[4]);
    circle c36(clk,1'b0,    bout3[1],a[0],bout3[0],sout3[0],aout3[0],bout3[0],cout3[1],q[4]);
    
    circle c41(clk,sout3[4], q[3],      a[5],cout4[5],sout4[5],aout4[5],bout4[5],q[2],q[3]);
    circle c42(clk,sout3[3], bout4[5],a[4],cout4[4],sout4[4],aout4[4],bout4[4],cout4[5],q[3]);
    circle c43(clk,sout3[2], bout4[4],a[3],cout4[3],sout4[3],aout4[3],bout4[3],cout4[4],q[3]);
    circle c44(clk,sout3[1], bout4[3],a[2],cout4[2],sout4[2],aout4[2],bout4[2],cout4[3],q[3]);
    circle c45(clk,sout3[0], bout4[2],a[1],cout4[1],sout4[1],aout4[1],bout4[1],cout4[2],q[3]);
    circle c46(clk,1'b0,    bout4[1],a[0],bout4[0],sout4[0],aout4[0],bout4[0],cout4[1],q[3]);
            
    circle c51(clk,sout4[4], q[2],      a[5],cout5[5],sout5[5],aout5[5],bout5[5],q[1],q[2]);
    circle c52(clk,sout4[3], bout5[5],a[4],cout5[4],sout5[4],aout5[4],bout5[4],cout5[5],q[2]);
    circle c53(clk,sout4[2], bout5[4],a[3],cout5[3],sout5[3],aout5[3],bout5[3],cout5[4],q[2]);
    circle c54(clk,sout4[1], bout5[3],a[2],cout5[2],sout5[2],aout5[2],bout5[2],cout5[3],q[2]);
    circle c55(clk,sout4[0], bout5[2],a[1],cout5[1],sout5[1],aout5[1],bout5[1],cout5[2],q[2]);
    circle c56(clk,1'b0,    bout5[1],a[0],bout5[0],sout5[0],aout5[0],bout5[0],cout5[1],q[2]);
    
    circle c61(clk,sout5[4], q[1],      a[5],cout6[5],sout6[5],aout6[5],bout6[5],q[0],q[1]);
    circle c62(clk,sout5[3], bout6[5],a[4],cout6[4],sout6[4],aout6[4],bout6[4],cout6[5],q[1]);
    circle c63(clk,sout5[2], bout6[4],a[3],cout6[3],sout6[3],aout6[3],bout6[3],cout6[4],q[1]);
    circle c64(clk,sout5[1], bout6[3],a[2],cout6[2],sout6[2],aout6[2],bout6[2],cout6[3],q[1]);
    circle c65(clk,sout5[0], bout6[2],a[1],cout6[1],sout6[1],aout6[1],bout6[1],cout6[2],q[1]);
    circle c66(clk,1'b0,    bout6[1],a[0],bout6[0],sout6[0],aout6[0],bout6[0],cout6[1],q[1]);
     
     always @(posedge clk)
     begin
        if(b<a)
        que[8:0]<=q;
        
        else
        que<=q;
        
     end
endmodule
