`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:19 03/06/2018
// Design Name:   Location
// Module Name:   C:/friends/tenlab4/location_db.v
// Project Name:  tenlab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Location
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module location_db;

	// Inputs

	reg [2:0] catDir;
	reg clock;
	reg reset;

	// Outputs
	wire [3:0] CatX;
	wire [3:0] CatY;
	wire [3:0] MouseX;
	wire [3:0] MouseY;
	wire [3:0] GoalX;
	wire [3:0] GoalY;
	wire GameOver;
	wire [13:0] Score;

	// Instantiate the Unit Under Test (UUT)
	Location uut (
		.mouseDir(mouseDir), 
		.catDir(catDir), 
		.clock(clock), 
		.reset(reset), 
		.CatX(CatX), 
		.CatY(CatY), 
		.MouseX(MouseX), 
		.MouseY(MouseY), 
		.GoalX(GoalX), 
		.GoalY(GoalY), 
		.Goal2X(Goal2X), 
		.Goal2Y(Goal2Y), 
		.GameOver(GameOver), 
		.Score(Score)
	);

	initial begin
		// Initialize Inputs
		mouseDir = 0;
		catDir = 0;
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100
		reset = 0;
		mouseDir = 1;
		catDir = 1;
		
      
		
		// Add stimulus here

	end
      
always #5 clock = ~clock;
endmodule

