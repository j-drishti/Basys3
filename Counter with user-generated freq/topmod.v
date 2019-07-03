`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module topmod(inputfclk,inputreset,input[1:0]opt,outputreg[4:0]count);

  wire[4:0]cnt1, cnt2, cnt3,cnt4;
  onefreq f(fclk, oclk);
  
  freqdivider #(1) f1(.clk(oclk), .clk_out(clk_out));
  debouncerd1(.push_button(reset),.clk_deb(oclk),.deb_out(deb_out));countr
  c1(.clk(clk_out), .count(cnt1) , .reset(deb_out));
  
  freqdivider #(2) f2(.clk(oclk), .clk_out(clk_out2));
  debouncerd2(.push_button(reset),.clk_deb(oclk),.deb_out(deb_out));countr
  c2(.clk(clk_out2), .count(cnt2) , .reset(deb_out));
  
  freqdivider #(4) f3(.clk(oclk), .clk_out(clk_out3));
  debouncerd3(.push_button(reset),.clk_deb(oclk),.deb_out(deb_out));countr
  c3(.clk(clk_out3), .count(cnt3) , .reset(deb_out));
  
  freqdivider #(8) f4(.clk(oclk), .clk_out(clk_out4));
  debouncerd4(.push_button(reset),.clk_deb(oclk),.deb_out(deb_out));countr
  c4(.clk(clk_out4), .count(cnt4) , .reset(deb_out));
  
  always @(*)
  begin
  if(opt==2'b00) count<=cnt1;
  else if(opt==2'b01) count<=cnt2;
  else if(opt==2'b10) count<=cnt3;
  else if(opt==2'b11) count<=cnt4;
  else count<=cnt4;
  end
  
  endmodule
