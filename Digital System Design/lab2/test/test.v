module FA(A, B, S, C_in, C_out);

	input A, B, C_in;
	output S, C_out;
	
	assign S = A ^ B ^ C_in,
	C_out = ((A ^ B) & C_in) | (A & B);
	
endmodule
	
module test(SW, HEX3_DP, HEX3_D, HEX2_DP, HEX2_D, HEX1_DP, HEX1_D, HEX0_DP, HEX0_D);
	
	input [9:0]SW;
	
	output HEX3_DP;
	output HEX2_DP;
	output HEX1_DP;
	output HEX0_DP;
	
	output [6:0]HEX3_D;
	output [6:0]HEX2_D;
	output [6:0]HEX1_D;
	output [6:0]HEX0_D;
	
	reg HEX3_DP;
	reg HEX2_DP;
	reg HEX1_DP;
	reg HEX0_DP;
	
	reg [6:0]HEX3_D;
	reg [6:0]HEX2_D;
	reg [6:0]HEX1_D;
	reg [6:0]HEX0_D;
	
	reg [2:0] in_a;
	reg [2:0] in_b;
	reg c_input;
	reg [3:0] sum;
	//wire c_output;
	reg [2:0] c;
	
	always @(SW)
	begin
		in_a[2] = SW[9];
		in_a[1] = SW[8];
		in_a[0] = SW[7];
		
		HEX3_DP = 0;
		
		case(in_a)
			3'b000: HEX3_D = 7'b1000000; //0
			3'b001: HEX3_D = 7'b1111001; //1
			3'b010: HEX3_D = 7'b0100100; //2
			3'b011: HEX3_D = 7'b0110000; //3
			3'b100: HEX3_D = 7'b0011001; //4
			3'b101: HEX3_D = 7'b0010010; //5
			3'b110: HEX3_D = 7'b0000010; //6
			3'b111: HEX3_D = 7'b1111000; //7	
		endcase
		
		in_b[2] = SW[6];
		in_b[1] = SW[5];
		in_b[0] = SW[4];
		
		HEX2_DP = 0;
		
		case(in_b)
			3'b000: HEX2_D = 7'b1000000; //0
			3'b001: HEX2_D = 7'b1111001; //1
			3'b010: HEX2_D = 7'b0100100; //2
			3'b011: HEX2_D = 7'b0110000; //3
			3'b100: HEX2_D = 7'b0011001; //4
			3'b101: HEX2_D = 7'b0010010; //5
			3'b110: HEX2_D = 7'b0000010; //6
			3'b111: HEX2_D = 7'b1111000; //7
		endcase
		
		c_input = SW[0];
		
		sum[0] = in_a[0] ^ in_b[0] ^ c_input;
		c[1] = ((in_a[0] ^ in_b[0]) & c_input | (in_a[0] & in_b[0]));
		//c[1] = (in_a[0] & in_b[0])| ( in_a[0] & c_input) | (c_input & in_b[0]);
		
		sum[1] = in_a[1] ^ in_b[1] ^ c[1];
		c[2] = ((in_a[1] ^ in_b[1]) & c[1] | (in_a[1] & in_b[1]));
		//c[2] = (in_a[1] & in_b[1])| ( in_a[1] & c_input) | (c_input & in_b[1]);
		
		sum[2] = in_a[2] ^ in_b[2] ^ c[2];
		sum[3] = ((in_a[2] ^ in_b[2]) & c[2] | (in_a[2] & in_b[2]));
		//sum[3] = (in_a[2] & in_b[2])| ( in_a[2] & c_input) | (c_input & in_b[2]);
		
		HEX1_DP = 0;
		HEX0_DP = 0;
		
		case(sum)
			4'b0000: begin HEX1_D = 7'b1000000; HEX0_D = 7'b1000000; end //0
			4'b0001: begin HEX1_D = 7'b1000000; HEX0_D = 7'b1111001; end //1
			4'b0010: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0100100; end //2
			4'b0011: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0110000; end //3
			4'b0100: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0011001; end //4
			4'b0101: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0010010; end //5
			4'b0110: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0000010; end //6
			4'b0111: begin HEX1_D = 7'b1000000; HEX0_D = 7'b1111000; end //7
			4'b1000: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0000000; end //8
			4'b1001: begin HEX1_D = 7'b1000000; HEX0_D = 7'b0010000; end //9
			4'b1010: begin HEX1_D = 7'b1111001; HEX0_D = 7'b1000000; end //10
			4'b1011: begin HEX1_D = 7'b1111001; HEX0_D = 7'b1111001; end //11
			4'b1100: begin HEX1_D = 7'b1111001; HEX0_D = 7'b0100100; end //12
			4'b1101: begin HEX1_D = 7'b1111001; HEX0_D = 7'b0110000; end //13
			4'b1110: begin HEX1_D = 7'b1111001; HEX0_D = 7'b0011001; end //14
			4'b1111: begin HEX1_D = 7'b1111001; HEX0_D = 7'b0010010; end //15
		endcase
	end
	
endmodule
