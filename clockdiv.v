`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:36 03/19/2013 
// Design Name: 
// Module Name:    clockdiv 
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
module clockdiv(
	input wire clk,		//master clock: 50MHz
	input wire reset,		//asynchronous reset
	output wire dclk		//pixel clock: 25MHz
	);

// 17-bit counter variable
reg [17:0] q;

// Clock divider --
// Each bit in q is a clock signal that is
// only a fraction of the master clock.
always @(posedge clk or posedge reset)
begin
	// reset condition
	if (reset == 1)
		q <= 0;
	// increment counter by one
	else
		q <= q + 1;
end

// 50Mhz � 2^17 = 381.47Hz
//assign segclk = q[17];

// 50Mhz � 2^1 = 25MHz
assign dclk = q[1];

endmodule
