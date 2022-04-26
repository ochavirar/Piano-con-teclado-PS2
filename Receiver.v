`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:58 04/20/2022 
// Design Name: 
// Module Name:    Receiver 
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
module Receiver(
    input ps2c,
    input Rx,
	 output [7:0]Data
    );
	 
	 reg [7:0] code;
	 reg [3:0] estado;
		 
	 assign Data = code;
		 
	 always @(posedge ps2c)
	 begin 
		case(estado)
		0: begin
			estado <= 1;
			code <= 0;
		end
		1: begin
			code[7] <= Rx;
			estado <= 2;
		end
		2: begin
			code[6] <= Rx;
			estado <= 3;
		end
		3: begin
			code[5] <= Rx;
			estado <= 4;
		end
		4: begin
			code[4] <= Rx;
			estado <= 5;
		end
		5: begin
			code[3] <= Rx;
			estado <= 6;
		end
		6: begin
			code[2] <= Rx;
			estado <= 7;
		end
		7: begin
			code[1] <= Rx;
			estado <= 8;
		end
		8: begin
			code[0] <= Rx;
			estado <= 9;
		end
		9:
			estado <= 0;
		default:
			estado <= 0;
		endcase
	 end

endmodule

