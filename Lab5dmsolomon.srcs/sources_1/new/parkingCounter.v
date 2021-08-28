`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:27:28 AM
// Design Name: 
// Module Name: parkingCounter
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


module parkingCounter(
input clk, 
input reset, a, b, c, d,
output [3:0] an,
output [6:0] seg);
    
    
    wire [7:0]count;
    wire increment;
    wire decrement;
    parameter zero = 4'b0000;
    wire clk_out;
    wire [3:0] mux_out;
    wire [1:0] counter_out;
    
    //slowclock();
    enter_fsm U8(clk, reset, a, b, increment);
    exit_fsm U9(clk, reset, c, d, decrement);
    counter U10(clk, reset, increment, decrement, count);
    



binary_to_BCD u11(count, ones, tens, hundreds);
mux4to1 u12(ones, tens, hundreds, zero, counter_out, mux_out);
slowclock u13(clk, clk_out);
my_counter u14(clk_out, counter_out);
decoder2to4 u15(counter_out, an);
bcd7seg u16(mux_out, seg);
    
endmodule
