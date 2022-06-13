module hw1(x,y,V,D0,D1,D2,D3);

input D0,D1,D2,D3;
output x,y,V;
wire ND2,out1,out2;

not not1(ND2,D2);
or or1(x,D2,D3);
and and1(out1,D1,ND2);
or or2(y,D3,out1);
or or3(V,x,D0,D1);


endmodule
