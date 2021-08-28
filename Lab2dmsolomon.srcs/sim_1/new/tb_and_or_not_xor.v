module tb_and_or_not_xor(
);

reg aa, bb, cc;
wire out1, out2, out3, out4;

and_or_not_xor U1(aa,bb,cc,out1,out2,out3,out4);

initial begin
    //initialize variables
    aa = 0;
    bb = 0;
    cc = 0;
    #100
    aa = 1;
    #100
    bb = 1;
    #100
    cc = 1;
    #100
    cc = 0;
    
    #1000;
end

endmodule