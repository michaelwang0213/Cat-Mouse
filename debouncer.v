`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:10 02/15/2018 
// Design Name: 
// Module Name:    debouncer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// code adapted from http://www.fpga4fun.com/Debouncer2.html
module debouncer (
	input clk,
	input pause,
	
	output pause_state
);

	reg pause_state_temp;
	
	reg [15:0] pause_cnt;
	
	wire pause_cnt_max = &pause_cnt;

	always @(posedge clk)
	if(pause == 0)
		begin
		pause_cnt <= 0;
		pause_state_temp <= 0;
		end
	else
	begin
		pause_cnt <= pause_cnt + 16'd1;
		if(pause_cnt_max)
			begin
			pause_state_temp <= 1;
			pause_cnt <= 0;
			end
	end
	
	assign pause_state = pause_state_temp;
endmodule
