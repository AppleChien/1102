module gohw1(D0,D1,D2,A0,A1,A2,A3,B0,B1,B2,B3);

input A0,A1,A2,A3,B0,B1,B2,B3;
output D0,D1,D2;
wire na0,na1,na2,na3,nb0,nb1,nb2,nb3,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,x0,x1,x2,x3;

not not0(na0,A0);
not not1(na1,A1);
not not2(na2,A2);
not not3(na3,A3);
not not4(nb0,B0);
not not5(nb1,B1);
not not6(nb2,B2);
not not7(nb3,B3);

and and1(t1,na3,B3);
and and2(t2,A3,nb3);
nor nor1(x3,t1,t2);

and and3(t3,na2,B2);
and and4(t4,A2,nb2);
nor nor2(x2,t3,t4);

and and5(t5,na1,B1);
and and6(t6,A1,nb1);
nor nor3(x1,t5,t6);

and and7(t7,na0,B0);
and and8(t8,A0,nb0);
nor nor4(x0,t7,t8);

and and9(t9,x3,t3);
and and10(t10,x3,t4);
and and11(t11,x3,x2,t5);
and and12(t12,x3,x2,t6);
and and13(t13,x3,x2,x1,t7);
and and14(t14,x3,x2,x1,t8);
and and15(D0,x3,x2,x1,x0);

or or1(D2,t1,t9,t11,t13);
or or2(D1,t2,t10,t12,t14);

endmodule
