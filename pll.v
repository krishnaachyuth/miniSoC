// input to PLL - VSSD,EN_VCO,VSSA,VDDD,VDDA,VCO_IN,REF
// output - clk
// required clock output 40Mhz = 25ns https://www.unitjuggler.com/convert-frequency-from-MHz-to-ns(p).html?val=40

`timescale 1ns / 1ps
module pll( 
	output reg clk,
	input  VCO_IN,
	input  VDDA,
	input  VDDD,
	input  VSSA,
	input  VSSD,
	input  EN_VCO,
	input  REF
);

	//reg clk;
	//wire VSSD,VSSA,VDDD,VDDA;
	real period,lastedge,refpd;

// initialising clock period, lastedge
initial 
begin
	lastedge <= 0.0;
	period = 25.0;
	clk <= 0.0;
end


//clock determined by period
always @(posedge clk or EN_VCO)
begin
	if(EN_VCO == 1'b1)
	begin
		#(period / 2.0);
		clk <= (clk == 1'b0);
	end
	else if (EN_VCO == 1'b0)
	begin
		clk <=1'b0;
	end
	else 
	begin
		clk <= 1'bx;
	end
end

always@(posedge REF)
begin
	if(lastedge > 0.0)
	begin
		refpd = $realtime- lastedge;
		period = (refpd/8.0);
	end
lastedge = $realtime;
end

endmodule






