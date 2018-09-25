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
module Location( input wire rightBtn,
input wire leftBtn,
input wire upBtn,
input wire downBtn,
input wire crightBtn,
input wire cleftBtn,
input wire cupBtn,
input wire cdownBtn,
	input wire clock,
	input wire reset,
	output wire [3:0]CatX,
	output wire [3:0] CatY,
	output wire [3:0]MouseX,
	output wire [3:0] MouseY,
	output wire [3:0] GoalX,
	output wire [3:0] GoalY,
	output wire [13:0] Score,
	output wire GameOver
    );


reg[3:0] catX;
reg[3:0] catY;
reg[3:0] mouseX;
reg[3:0] mouseY;
reg[13:0] score;
reg gameOver = 0;
reg[3:0] goalX;
reg[3:0] goalY;
reg[5:0] cheeseCount;
reg[32:0] count;

//Set a hardcoded map generation
//1's are spaces can't move to
//has a buffer around the edges
reg [15:0] map[0:12];



always @(posedge clock or posedge reset)
	begin
		if(reset)
		begin
		map[0] <= 16'b1111111111111111;
		map[1] <= 16'b1000000110000011;
		map[2] <= 16'b1100110000110001;
		map[3] <= 16'b1001100000011101;
		map[4] <= 16'b1000001011000001;
		map[5] <= 16'b1010100000010101;
		map[6] <= 16'b1000101001010001;
		map[7] <= 16'b1010100000010101;
		map[8] <= 16'b1000001101000001;
		map[9] <= 16'b1011100000011101;
		map[10] <= 16'b1000100000110001;
		map[11] <= 16'b1100000110000011;
		map[12] <= 16'b1111111111111111;
			mouseX = 5;
			mouseY = 3;
			catX = 9;
			catY = 11;
			goalX = 14;
			goalY = 10;
			count <= 0;
			cheeseCount = 0;
			gameOver = 0;
			score = 0;
		end
		else
			begin
				if (!gameOver)
					begin
					/////////////MOUSE LOGIC
					//each time cheese is reached, the mouse gets fatter moves slower
					if(count%(cheeseCount+65) == 0)
							begin
							//each time the mouse moves lose one score
							//makes it so mouse must always actively head towards goal
								if(score > 0) 
									score = score -1;
								if(upBtn)
									begin
										if(!map[mouseY-1][mouseX])
											begin
												mouseY = mouseY - 1;
											end
									end
								else if(rightBtn)
									begin
										if(!map[mouseY][mouseX+1])
											begin
												mouseX = mouseX + 1;
											end
									end
								else if(downBtn)
									begin
										if(!map[mouseY+1][mouseX])
											begin
												mouseY = mouseY + 1;
											end
										end
								else if(leftBtn)
									begin
										if(!map[mouseY][mouseX-1])
											begin
												mouseX = mouseX - 1;
											end
									end
								else //staying still
									begin
										if(score > 0)
											score = score +1; 
									end
								
								
					
					
							end	
						/////////////////CAT LOGIC. Cat always moves the same speed
						if(count%(65 - cheeseCount) == 0)
							begin
								if(cupBtn)
									begin
									if(!map[catY-1][catX])
										begin
											catY = catY - 1;
										end
									end
								else if(crightBtn)
									begin 
									if(!map[catY][catX+1])
										begin
											catX = catX + 1;
										end
									end
								else if(cdownBtn)
									begin
									if(!map[catY+1][catX])
										begin
											catY = catY + 1;
										end
										end
								else if(cleftBtn)
									begin
									if(!map[catY][catX-1])
										begin
											catX = catX - 1;
										end
									end
								else //verilog needs an else for else ifs
									begin
										score = score;
									end
						
								//if mouse and cat overlap, game over
								if(catX == mouseX && mouseY == catY)
										gameOver = 1;
									end
							end
							/////////feature. Stops cat from sitting on cheese
						if((catX <= goalX+1 || goalX+1 < goalX) && (catX >= goalX-1 || goalX<goalX-1)  && (catY <= goalY +1 || goalY > goalY +1) && (catY >= goalY-1 || goalY  < goalY-1))
							begin
								goalX = count%15;
								goalY = count%12;
							end
						//if mouse reaches cheese, inscrease score
						if(mouseX == goalX && mouseY == goalY)
							begin
								score = 50+score+goalX+goalY;
								if(cheeseCount < 64)
									cheeseCount = cheeseCount + 1;
								goalX = count%15;
								goalY = count%12;
							end
						
							
						if(map[goalY][goalX]) //if the cheese is spawned in an invalid spot
							begin
								goalX = count%15;
								goalY = count%12;
							end
						
						/////////////////////////
						count <= count+1;
			end
	end
	


	assign CatX = catX;
	assign  CatY = catY;
	assign MouseX = mouseX;
	assign  MouseY = mouseY;
	assign GoalX = goalX;
	assign  GoalY = goalY;
	assign Score = score;
	assign GameOver = gameOver;

endmodule
