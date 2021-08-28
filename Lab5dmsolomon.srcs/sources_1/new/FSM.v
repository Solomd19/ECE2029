`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 04:53:45 PM
// Design Name: 
// Module Name: FSM
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


module enter_fsm(
 input clk,
 input reset,
 input sensor_1,
 input sensor_2,
 output count_flag);
 
 //FSM enter_fsm(clk, reset, a_deb, b_deb, increment);

 localparam S00 = 0, S01 = 1, S10 = 2, FLAG = 3;
 reg [1:0] current_state = 0; // Current State
 reg [1:0] next_state = 0; // Next State
 reg set_flag = 1; // Flag for when to count
//--------------------------------------------------------------------------------------------
// Next state sequential logic
//--------------------------------------------------------------------------------------------

 always @(posedge clk) begin
 if (reset) current_state <= S00;
else current_state <= next_state;
 end
//--------------------------------------------------------------------------------------------
// Next state combinational logic
//--------------------------------------------------------------------------------------------
 always @(current_state, sensor_1, sensor_2)
 begin
 case(current_state)
 
S00: begin
    if (sensor_1 & ~sensor_2)
        next_state = S01;
    else
        next_state = S00;
end

S01: begin
    if (~sensor_1 & sensor_2)
        next_state = S10;
    else
        next_state = S01;
end

S10: begin
    if(~sensor_1 & ~sensor_2)
        next_state = FLAG;
    else
        next_state = S10;
end

FLAG: begin
    next_state = S00;
end

default: begin // Implied-latch free implementation
    next_state = S00;
end

endcase
end
//--------------------------------------------------------------------------------------------
// Combinational output logic for each state
//--------------------------------------------------------------------------------------------
 always @(current_state) begin
case (current_state)

S00: begin
    set_flag = 0;
 end
 
S01: begin
    set_flag = 0;
end

S10: begin
    set_flag = 0;
end

FLAG: begin
    set_flag = 1;
end

default: begin
    set_flag = 0;
 end
endcase
end
//--------------------------------------------------------------------------------------------
// Output assignment
//--------------------------------------------------------------------------------------------
assign count_flag = set_flag;
endmodule
