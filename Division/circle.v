`timescale 1ns / 1ps
////////////////////


module circle(input clk, input sin, input bin, input ain, input cin, output sout, 
output aout, output bout,output cout, input sign

    );
    
    
    //always #5 clk=!clk;
    wire ai;
    fulladder g( clk,ai^bin, sin, cin, sout,sign,cout);
     reg a;
     always @ (posedge clk)
    begin
    if(sign==1)
        a<=~ain + 1;
    else
        a<=ain;
    end
    assign bout=bin;
    assign aout=ain;
    assign ai=a;
endmodule

