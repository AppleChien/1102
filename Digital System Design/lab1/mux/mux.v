module mux(input [9:0]sw, output reg [9:0]LED);
	
	always @(sw)
	begin
		LED[0] = sw[0];
		LED[1] = sw[1];
		LED[2] = sw[2];
		LED[3] = sw[3];
		LED[4] = sw[4];
		LED[5] = sw[5];
		LED[6] = sw[6];
		LED[7] = sw[7];
		LED[8] = sw[8];
		LED[9] = sw[9];
	end
	
endmodule
