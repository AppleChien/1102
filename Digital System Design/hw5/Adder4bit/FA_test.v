`timescale 1ns/10ps
module FA_test;
	reg  [3:0]a, b;
	reg c_input;
	wire  [3:0]s;
	wire c_output;
	Adder4bit Adder4bit(.a(a),.b(b),.s(s),.c_input(c_input),.c_output(c_output));
	
	initial begin
	a=0;b=0;c_input=0;
	#10 a=11;b=4;c_input=0;
	#10 a=7;b=13;c_input=1;
	#10 a=0;b=0;c_input=0;

	end
	initial $monitor("a=%b,b=%b,s=%b",a,b,s);

endmodule
