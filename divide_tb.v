`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:04 02/15/2018
// Design Name:   clock_divider
// Module Name:   C:/Desktop/tenlab3/divide_tb.v
// Project Name:  tenlab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divide_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk_1;
	wire clk_2;
	wire clk_5;
	wire clk_100;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clk(clk), 
		.reset(reset), 
		.clk_1(clk_1),
		.clk_2(clk_2),
		.clk_5(clk_5),
		.clk_100(clk_100)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100;
		reset = 0;

        
		// Add stimulus here

	end
      
	always #1 clk = ~clk;
	
endmodule

