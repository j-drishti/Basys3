`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2018 09:15:49 AM
// Design Name: 
// Module Name: FULLADDER
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


module FULLADDER(
    input A,
    input B,
    input C,
    output Cout,
    output Sum
    );
    
    assign Sum= A^B^C;
    assign Cout= A&B | B&C | A&C;
endmodule
