`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:37:03 04/20/2022 
// Design Name: 
// Module Name:    Top 
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
module Top(
		input PS2C,
		input PS2D,
		output [7:0] DATA
    );

	 reg [7:0]code;
	 reg [3:0] estado;

	 always @(negedge PS2C)
	 begin 
		case(estado)
		0: begin
			estado <= 1;
			code <= 0;
		end
		1: begin
			code[7] <= PS2D;
			estado <= 2;
		end
		2: begin
			code[6] <= PS2D;
			estado <= 3;
		end
		3: begin
			code[5] <= PS2D;
			estado <= 4;
		end
		4: begin
			code[4] <= PS2D;
			estado <= 5;
		end
		5: begin
			code[3] <= PS2D;
			estado <= 6;
		end
		6: begin
			code[2] <= PS2D;
			estado <= 7;
		end
		7: begin
			code[1] <= PS2D;
			estado <= 8;
		end
		8: begin
			code[0] <= PS2D;
			estado <= 9;
		end
		9:
			estado <= 0;
		default:
			estado <= 0;
		endcase
	 end

	assign DATA = code;

endmodule
