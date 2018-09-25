`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:21 02/27/2018 
// Design Name: 
// Module Name:    Location 
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
Module display_comb(
	input wire [3:0] digit,
	out wire [7:0] segCode
);
reg[7:0]seven;

always @ (*) begin
	if (digit == 4'h1)
		seven = 8'b11111001;
	else if (digit == 4'h2)
		seven = 8'b10100100;
	else if (digit == 4'h3)
		seven = 8'b10110000;
	else if (digit == 4'h4)
		seven = 8'b10011001;
	else if (digit == 4'h5)
		seven =8'b10010010;
	else if (digit == 4'h6)
		seven = 8'b10000010;
	else if (digit == 4'h7)
		seven = 8'b11111000;
	else if (digit == 4'h8)
		seven = 8'b10000000;
	else if (digit == 4'h9)
		seven = 8'b10010000;
	else
		seven=8'b11111111;
end
assign segCode = seven; 
endmodule


