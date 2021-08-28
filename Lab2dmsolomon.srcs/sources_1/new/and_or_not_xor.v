`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Drew Solomon
// 
// Create Date: 11/03/2020 11:07:00 PM
// Design Name: 
// Module Name: and_or_not_xor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Uses switches to demonstrate the logic of an AND, OR, XOR, and NOT gate
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and_or_not_xor(
    input A,
    input B,
    input C,
    output outAND,
    output outOR,
    output outXOR,
    output notC
    );
    
    assign outAND = A & B;
    assign outOR = A | B;
    assign outXOR = A ^ B;
    assign notC = ~C;
    
endmodule
