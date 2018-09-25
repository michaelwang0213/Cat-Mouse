`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:05 02/15/2018 
// Design Name: 
// Module Name:    top 
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
module top_fsm(
	input clk,
	input reset,
	input rightBtn,
	input leftBtn,
	input upBtn,
	input downBtn,
	//input Direction,
	//input Axis,
	input crightBtn,
	input cleftBtn,
	input cupBtn,
	input cdownBtn,

	output reg [7:0] segCode,
	output reg [3:0] an,
	output wire [2:0] red,	//red vga output - 3 bits
	output wire [2:0] green,//green vga output - 3 bits
	output wire [1:0] blue,	//blue vga output - 2 bits
	output wire hsync,		//horizontal sync out
	output wire vsync
	
	
);


wire [3:0] thousands;
wire [3:0] hundreds;
wire [3:0] tens;
wire [3:0] ones;


wire [7:0] thousandsDis;
wire [7:0] hundredsDis;
wire [7:0] tensDis;
wire [7:0] onesDis;

wire clk_5;
wire clk_100;
wire dclk;
wire right_state;
wire left_state;
wire up_state;
wire down_state;



wire [3:0]CatX;
wire [3:0] CatY;
wire [3:0]MouseX;
wire [3:0] MouseY;
wire [3:0] GoalX;
wire [3:0] GoalY;
wire [3:0] Goal2X;
wire [3:0] Goal2Y;
wire [13:0] Score;
wire GameOver;



debouncer up_db(
	.clk(clk),
	.pause(upBtn),
	.pause_state(up_state)
);

debouncer right_db(
	.clk(clk),
	.pause(rightBtn),
	.pause_state(right_state)
);

debouncer left_db(
	.clk(clk),
	.pause(leftBtn),
	.pause_state(left_state)
);


debouncer down_db(
	.clk(clk),
	.pause(downBtn),
	.pause_state(down_state)
);

debouncer cup_db(
	.clk(clk),
	.pause(cupBtn),
	.pause_state(cup_state)
);

debouncer cright_db(
	.clk(clk),
	.pause(crightBtn),
	.pause_state(cright_state)
);

debouncer cleft_db(
	.clk(clk),
	.pause(cleftBtn),
	.pause_state(cleft_state)
);


debouncer cdown_db(
	.clk(clk),
	.pause(cdownBtn),
	.pause_state(cdown_state)
);


clockdiv U1(
	.clk(clk),
	.reset(reset),
	.dclk(dclk)
	);

clock_divider divs(
	.clk(clk),
	.reset(reset),
	.clk_5(clk_5),
	.clk_100(clk_100)
);
/*
DirectionConverter catConv(
.clk(clk),
.dir(Direction),
.axis(Axis),
.charDir(catDir)
    );
*/

Location locate(
	.rightBtn(right_state),
	.leftBtn(left_state),
	.upBtn(up_state),
	.downBtn(down_state),
	.crightBtn(cright_state),
	.cleftBtn(cleft_state),
	.cupBtn(cup_state),
	.cdownBtn(cdown_state),
	.clock(clk_5),
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

scoreConverter converter(
	.score(Score),
	.onesDis(ones),
	.tensDis(tens),
	.hundredsDis(hundreds),
	.thousandsDis(thousands)
	);

display_comb thousandsPlace(
	.digit(thousands),
	.segCode(thousandsDis)
	);
display_comb hundredsPlace(
	.digit(hundreds),
	.segCode(hundredsDis)
	);
display_comb tensPlace(
	.digit(tens),
	.segCode(tensDis)
	);
display_comb onesPlace(
	.digit(ones),
	.segCode(onesDis)
	);

vga640x480 drawScreen(
	.clk(dclk),
	.reset(reset),
	.CatX(CatX),
	.CatY(CatY),
	.MouseX(MouseX),
	.MouseY(MouseY),
	.GoalX(GoalX),
	.GoalY(GoalY),
	.GameOver(GameOver),

	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)

);	
	
reg [1:0] count = 2'b00;

always @ (posedge clk_100)
begin
// phase normally
	if (count == 0) begin
		an <= 4'b1110;
		segCode = onesDis;
		count <= count + 1;
	end
	else if (count == 1) begin
		an <= 4'b1101;
		segCode = tensDis;
		count <= count + 1;
	end
	else if (count == 2) begin
		an <= 4'b1011;
		segCode = hundredsDis;
		count <= count + 1;
	end
	else begin
		an <= 4'b0111;
		segCode = thousandsDis;
		count <= count + 1;
	end		
end

		
endmodule
