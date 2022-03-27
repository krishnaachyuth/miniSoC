`timescale 1ns / 1ps
module tb;

reg clk;
reg VSSD;
reg EN_VCO;
reg VSSA;
reg VDDD;
reg VDDA;
reg VCO_IN;
reg REF;

pll dut (.clk(clk),.VSSD(VSSD),.EN_VCO(EN_VCO),.VSSA(VSSA),.VDDD(VDDD),.VDDA(VDDA),.VCO_IN(VCO_IN),.REF(REF));

// always #5 clk =!clk;
initial 
begin
	{REF,EN_VCO}=0;
	VCO_IN = 1'b0;
	VDDA = 1.8;
	VDDD = 1.8;
	VSSA = 0;
	VSSD = 0;
end

initial
begin
	repeat(10)
	begin
	EN_VCO=1;
	#10 REF = ~REF;
	end
$finish;
end

endmodule

	