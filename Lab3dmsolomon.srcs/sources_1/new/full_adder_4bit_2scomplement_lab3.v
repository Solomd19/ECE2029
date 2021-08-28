`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2020 01:00:59 PM
// Design Name: 
// Module Name: full_adder_4bit_2scomplement_lab3
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


module full_adder_4bit_2scomplement_lab3(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output OF_S,
    output C_MSB
    );
    
    wire [3:0] C_out;
    wire [3:0] Sum;
    
    one_bit_full_adder U0(A[0], B[0], 0, Sum[0], C_out[0]);
    one_bit_full_adder U1(A[1], B[1], C_out[0], Sum[1], C_out[1]);
    one_bit_full_adder U2(A[2], B[2], C_out[1], Sum[2], C_out[2]);
    one_bit_full_adder U3(A[3], B[3], C_out[2], Sum[3], C_out[3]);
    
    assign OF_S = ~A[3] & ~B[3] & C_out[2] | A[3] & B[3] & ~C_out[2];
    assign C_MSB = C_out[3];
    
endmodule
