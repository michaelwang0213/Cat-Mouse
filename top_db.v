`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:58:59 03/06/2018
// Design Name:   top_fsm
// Module Name:   C:/friends/tenlab4/top_db.v
// Project Name:  tenlab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_db;

	// Inputs
	reg clk;
	reg reset;
	reg pause;
	reg [1:0] SEL;
	reg ADJ;

	// Outputs
	wire [7:0] segCode;
	wire [3:0] an;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire hsync;
	wire vsync;

	// Instantiate the Unit Under Test (UUT)
	top_fsm uut (
		.clk(clk), 
		.reset(reset), 
		.pause(pause),  
		.segCode(segCode), 
		.an(an), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.hsync(hsync), 
		.vsync(vsync)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		pause = 0;
		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100;
		reset = 0;
        
		// Add stimulus here

	end
      
always #5 clk= ~clk;
endmodule

