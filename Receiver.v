`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:37 04/27/2022 
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
		input ps2d,
		input CLK,
		output [25:0]FinalNote	
    );
	 reg [25:0] Frec;
	 reg[7:0] data;

	 reg [3:0] estado;
	 reg [25:0] count;
	 reg clkRedu;

	 always @(posedge CLK) begin
		count <= count + 1;
		if(count == 1_786) begin 
			clkRedu <= !clkRedu;
			count <= 0;
		end
	 end

	 always @(posedge clkRedu)
	 begin 
		case(estado)
		0: begin
			if(ps2d == 0)
				estado <= 1;
			else
				estado <= 0;
		end
		1: begin
			data[0] <= ps2d;
			estado <= 2;
		end
		2: begin
			data[1] <= ps2d;
			estado <= 3;
		end
		3: begin
			data[2] <= ps2d;
			estado <= 4;
		end
		4: begin
			data[3] <= ps2d;
			estado <= 5;
		end
		5: begin
			data[4] <= ps2d;
			estado <= 6;
		end
		6: begin
			data[5] <= ps2d;
			estado <= 7;
		end
		7: begin
			data[6] <= ps2d;
			estado <= 8;
		end
		8: begin
			data[7] <= ps2d;
			estado <= 9;
		end
		9:
			estado <= 0;
		default:
			estado <= 0;
		endcase
	 end
	 
	 always @(posedge clkRedu) begin
		if(data == 8'h1C) //Do3
			Frec <= 190_840;
		else if(data == 8'h1B) //Re3
			Frec <= 173_611;
		else if (data == 8'h23) //Mi3
			Frec <= 151_515;
		else if (data == 8'h2B) //Fa3
			Frec <= 142_857;
		else 
			Frec <= 0;
	 end
		
	assign FinalNote = Frec;
endmodule
