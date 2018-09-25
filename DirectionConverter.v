`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:44 03/13/2018 
// Design Name: 
// Module Name:    DirectionConverter 
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
module DirectionConverter(//Not used
input wire clk,
input wire dir,
input wire axis,
output wire[1:0] charDir
    );

reg[1:0] tempDir;

always @(posedge clk)
	begin
		if(axis)
			begin
			if(dir)
				tempDir = 1;
			else
				tempDir = 3;
			end
		else
		begin
			if(dir)
				tempDir = 0;
			else
				tempDir = 2;
			end
	end
		
assign charDir = tempDir;


endmodule
