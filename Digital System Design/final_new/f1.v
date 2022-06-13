
module f1(
	//////////////////// Push Button X3 ////////////////////
		b,	// Pushbutton[2:0]
	//////////////////// DPDT Switch X6 ////////////////////
		sw,	// Toggle Switch[9:0]
	//////////////////// 7-SEG Dispaly X1 ////////////////////
		HEX0_D,	// Seven Segment Digit 0
		HEX0_DP,	// Seven Segment Digit DP 0
		HEX1_D,	// Seven Segment Digit 1
		HEX1_DP,	// Seven Segment Digit DP 1
HEX2_D,	// Seven Segment Digit 2
		HEX2_DP,	// Seven Segment Digit DP 2
HEX3_D,	// Seven Segment Digit 3
		HEX3_DP,	// Seven Segment Digit DP 3
	////////////////////////	LED		////////////////////////
		LED,	//	LED Green[9:0]
);

	input [9:0]sw;
	input [2:0]b;
	reg [3:0]input_num;
reg [3:0]same;

	integer input_num3;
	integer input_num2;
	integer input_num1;
	integer input_num0;

	integer answer0;
integer answer1;
integer answer2;
integer answer3;

	output reg [3:0]LED;
integer index = 0; // �ĴX��
integer A = 0;
integer B = 0;
integer state_input = 1;

//�C�q��ܾ�
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
	


initial begin	
	answer3 = 9;
	answer2 = 5;
	answer1 = 2;
	answer0 = 7;
	input_num3 = 0;
	input_num2 = 0;
	input_num1 = 0;
	input_num0 = 0;
	
end
	
always @(negedge b[2] && state_input) if(state_input == 1) index = (index + 1) % 4;
always @(1) state_input = sw[0];

always @(negedge b[0])
begin
case(state_input)
1:
begin
		case(sw - 1)
2: input_num = 1;
		4: input_num = 2;
		8: input_num = 3;
		16: input_num = 4;
		32: input_num = 5;
		64: input_num = 6;
		128: input_num = 7;
		256: input_num = 8;
		512: input_num = 9;
		endcase

		case(index)
		0: input_num0 = input_num;
		1: input_num1 = input_num;
		2: input_num2 = input_num;
		3: input_num3 = input_num;
		endcase

		case(input_num3)
		9: HEX3_D = 7'b0011000; 
		8: HEX3_D = 7'b0000000;
7: HEX3_D = 7'b1111000;
6: HEX3_D = 7'b0000010;
5: HEX3_D = 7'b0010010;
4: HEX3_D = 7'b1000000;
		3: HEX3_D = 7'b0110000;
		2: HEX3_D = 7'b0100100;
		1: HEX3_D = 7'b1111001;
		0: HEX3_D = 7'b1000000;
		endcase

		case(input_num2)
		9: HEX2_D = 7'b0011000;
		8: HEX2_D = 7'b0000000;
7: HEX2_D = 7'b1111000;
6: HEX2_D = 7'b0000010;
5: HEX2_D = 7'b0010010;
4: HEX2_D = 7'b1000000;
		3: HEX2_D = 7'b0110000;
		2: HEX2_D = 7'b0100100;
		1: HEX2_D = 7'b1111001;
		0: HEX2_D = 7'b1000000;
		endcase

		case(input_num1)
		9: HEX1_D = 7'b0011000;
		8: HEX1_D = 7'b0000000;
7: HEX1_D = 7'b1111000;
6: HEX1_D = 7'b0000010;
5: HEX1_D = 7'b0010010;
4: HEX1_D = 7'b1000000;
		3: HEX1_D = 7'b0110000;
		2: HEX1_D = 7'b0100100;
		1: HEX1_D = 7'b1111001;
		0: HEX1_D = 7'b1000000;
		endcase

		case(input_num0)
		9: HEX0_D = 7'b0011000;
		8: HEX0_D = 7'b0000000;
7: HEX0_D = 7'b1111000;
6: HEX0_D = 7'b0000010;
5: HEX0_D = 7'b0010010;
4: HEX0_D = 7'b1000000;
		3: HEX0_D = 7'b0110000;
		2: HEX0_D = 7'b0100100;
		1: HEX0_D = 7'b1111001;
		0: HEX0_D = 7'b1000000;
		endcase
	end
	0:
begin
		A = 0;
B = 0;
same[3:0] = 4'b0000;

//�P�_A
if(answer0 == input_num0) begin A = A + 1; same[0] = 1; end
if(answer1 == input_num1) begin A = A + 1; same[1] = 1; end
if(answer2 == input_num2) begin A = A + 1; same[2] = 1; end
if(answer3 == input_num3) begin A = A + 1; same[3] = 1; end

//�P�_B
if(answer0 == input_num1 && ~same[0]) begin B = B + 1; same[0] = 1; end
if(answer0 == input_num2 && ~same[0]) begin B = B + 1; same[0] = 1; end
if(answer0 == input_num3 && ~same[0]) begin B = B + 1; same[0] = 1; end
if(answer1 == input_num0 && ~same[1]) begin B = B + 1; same[1] = 1; end
if(answer1 == input_num2 && ~same[1]) begin B = B + 1; same[1] = 1; end
if(answer1 == input_num3 && ~same[1]) begin B = B + 1; same[1] = 1; end
if(answer2 == input_num0 && ~same[2]) begin B = B + 1; same[2] = 1; end
if(answer2 == input_num1 && ~same[2]) begin B = B + 1; same[2] = 1; end
if(answer2 == input_num3 && ~same[2]) begin B = B + 1; same[2] = 1; end
if(answer3 == input_num0 && ~same[3]) begin B = B + 1; same[3] = 1; end
if(answer3 == input_num1 && ~same[3]) begin B = B + 1; same[3] = 1; end
if(answer3 == input_num2 && ~same[3]) begin B = B + 1; same[3] = 1; end

//�C�q���

case(A)
	0: HEX3_D = 7'b1000000; //0
1: HEX3_D = 7'b1111001;  //1
2: HEX3_D = 7'b0100100; //2
3: HEX3_D = 7'b0110000; //3
4: HEX3_D = 7'b0011001; //4
endcase
	
case(B)
0: HEX1_D = 7'b1000000; //0
1: HEX1_D = 7'b1111001;  //1
2: HEX1_D = 7'b0100100; //2
3: HEX1_D = 7'b0110000; //3
4: HEX1_D = 7'b0011001; //4
endcase

HEX2_D = 7'b0001000; //A
HEX0_D = 7'b0000011; //b
end
	endcase
end
	
//����LED�O
always@ (state_input)
begin
if(state_input == 1)
begin
		case(index)
			0: begin LED[0] = 1; LED[1] = 0; LED[2] = 0; LED[3] = 0; end
			1: begin LED[0] = 0; LED[1] = 1; LED[2] = 0; LED[3] = 0; end
			2: begin LED[0] = 0; LED[1] = 0; LED[2] = 1; LED[3] = 0; end
			3: begin LED[0] = 0; LED[1] = 0; LED[2] = 0; LED[3] = 1; end
		endcase
end
end

endmodule
