`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 11:49:31 AM
// Design Name: 
// Module Name: tb_lab2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_lab2(

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
        aa = 0;
        bb = 1;
        #100
        aa = 1;
        #100
        cc = 1;
        #100
        cc = 0;
    
        #1000;
    end

 
endmodule
