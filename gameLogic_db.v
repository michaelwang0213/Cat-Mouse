`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:35 03/13/2018
// Design Name:   Location
// Module Name:   C:/Users/152/Desktop/test/gameLogic_db.v
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

module gameLogic_db;

	// Inputs
	reg rightBtn;
	reg leftBtn;
	reg upBtn;
	reg downBtn;
	reg crightBtn;
	reg cleftBtn;
	reg cupBtn;
	reg cdownBtn;
	reg clock;
	reg reset;

	// Outputs
	wire [3:0] CatX;
	wire [3:0] CatY;
	wire [3:0] MouseX;
	wire [3:0] MouseY;
	wire [3:0] GoalX;
	wire [3:0] GoalY;
	wire [13:0] Score;
	wire GameOver;

	// Instantiate the Unit Under Test (UUT)
	Location uut (
		.rightBtn(rightBtn), 
		.leftBtn(leftBtn), 
		.upBtn(upBtn), 
		.downBtn(downBtn), 
		.crightBtn(crightBtn), 
		.cleftBtn(cleftBtn), 
		.cupBtn(cupBtn), 
		.cdownBtn(cdownBtn), 
		.clock(clock), 
		.reset(reset), 
		.CatX(CatX), 
		.CatY(CatY), 
		.MouseX(MouseX), 
		.MouseY(MouseY), 
		.GoalX(GoalX), 
		.GoalY(GoalY), 
		.Score(Score),
		.GameOver(GameOver)
	);

	initial begin
		// Initialize Inputs
		rightBtn = 0;
		leftBtn = 0;
		upBtn = 0;
		downBtn = 0;
		crightBtn = 0;
		cleftBtn = 0;
		cupBtn = 0;
		cdownBtn = 0;
		clock = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#100
		reset = 0;
		rightBtn = 1;
		crightBtn = 1;
       
		// Add stimulus here

	end
	
	always #5 clock = ~clock;
      
endmodule

