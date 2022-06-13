module hw5(str_out, match, rst, str_in, clk);
 input clk, rst, str_in ;
 output reg[2:0]str_out;
 output reg match;
 reg out,current_state, next_state;
 parameter state0 = 0, state1 = 1,state2 = 2,state3 = 3; 

 always@(posedge clk or posedge rst)
	begin //CS
	if(rst) current_state <= state0;
	else current_state <= next_state;	    
	end
 
always@(current_state or str_in)
	begin //NS
	case(current_state)
	state0:
		next_state = (str_in==0)?state1:state0;
	state1:
		next_state = (str_in==0)?state0:state2;
	state2:
		next_state = (str_in==0)?state3:state2;
	state3:
		next_state = (str_in==0)?state0:state1;
		
	endcase
	end
	
always@(posedge clk or posedge rst)
if(rst)str_out=0;
else
	begin //OL
	
	str_out[2]=str_out[1];
	str_out[1]=str_out[0];
	str_out[0]=str_in;
	match=(str_out==6)?1:0;
	end 	
endmodule
