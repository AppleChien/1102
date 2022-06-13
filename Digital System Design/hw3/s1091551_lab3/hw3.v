module hw3(D , clk , enable , seed);
input clk, enable, seed;
output [5:0] D;

reg [5:0] D,out;

always @(posedge clk)

begin
  
    if (enable) begin
      out<=seed;
      D[0] <= out;
      D[1] <= D[0];
      D[2] <= D[1];
      D[3] <= D[2];
      D[4] <= D[3];
      D[5] <= D[4];
  
   end else begin
      out<=(D[5] ^ D[4]);
      D[0] <= out;
      D[1] <= D[0];
      D[2] <= D[1];
      D[3] <= D[2];
      D[4] <= D[3];
      D[5] <= D[4];
  end
  
end

endmodule
