`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:07:14 03/13/2018
// Design Name:   DirectionConverter
// Module Name:   C:/friends/tenlab4/convTest.v
// Project Name:  tenlab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DirectionConverter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module convTest;

	// Inputs
	reg clk;
	reg dir;
	reg axis;

	// Outputs
	wire [1:0] charDir;

	// Instantiate the Unit Under Test (UUT)
	DirectionConverter uut (
		.clk(clk), 
		.dir(dir), 
		.axis(axis), 
		.charDir(charDir)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dir = 0;
		axis = 0;


		// Wait 100 ns for global reset to finish
		#100;
		dir = 1;
		#100
		axis = 1;

	
        
		// Add stimulus here

	end
	
always #5 clk = ~clk;
      
endmodule

