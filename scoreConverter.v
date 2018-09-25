`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:44 03/06/2018 
// Design Name: 
// Module Name:    scoreConverter 
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
module scoreConverter( input wire [13:0] score,
	output wire [7:0] onesDis,
	output wire [7:0] tensDis,
	output wire [7:0] hundredsDis,
	output wire [7:0] thousandsDis
    );

reg [7:0] onesTemp;
reg [7:0] tensTemp;
reg [7:0] hundredsTemp;
reg [7:0] thousandsTemp;
reg [13:0] scoreTemp;

always @ (*)
begin
	thousandsTemp = score / 1000;
	scoreTemp = score - thousandsTemp*1000;
	hundredsTemp = scoreTemp/100;
	scoreTemp = scoreTemp - hundredsTemp*100;
	tensTemp = scoreTemp/10;
	onesTemp = scoreTemp - tensTemp * 10;
end


	assign onesDis = onesTemp;
	assign tensDis = tensTemp;
	assign hundredsDis = hundredsTemp;
	assign thousandsDis = thousandsTemp;
	


endmodule
