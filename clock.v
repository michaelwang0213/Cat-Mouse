`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:58 02/13/2018 
// Design Name: 
// Module Name:    clock 
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
module clock_divider  (
input wire clk, 
input wire reset, 
output wire clk_5,
output wire clk_100
);

//output reg clk_2; 
//output reg clk_5; //blink
//output reg clk_100; //display

reg [31:0] r_reg5;
wire [31:0] r_nxt5;
reg clk_track5;

reg [31:0] r_reg100;
wire [31:0] r_nxt100;
reg clk_track100;


	always @(posedge clk or posedge reset)
	begin
	
		//////////////
		if(reset)
		begin
				r_reg5 <= 0;
			clk_track5 <= 1'b0;
			r_reg100 <= 0;
			clk_track100 <= 1'b0;
			
		end
		else
		begin

			if (r_nxt5 == 125000)  // for now divides by 10
			begin
				r_reg5 <= 0;
				clk_track5 <= ~clk_track5;
			end
			else
				r_reg5<= r_nxt5;
			/////////////////////////////////////////////////

			if (r_nxt100 == 50000)  // for now divides by 100
			begin
				r_reg100 <= 0;
				clk_track100 <= ~clk_track100;
			end
			else
				r_reg100<= r_nxt100;
		end
	end

	assign r_nxt5 = r_reg5 + 1;
	assign clk_5 = clk_track5;

	assign r_nxt100 = r_reg100 + 1;
	assign clk_100 = clk_track100;


endmodule

