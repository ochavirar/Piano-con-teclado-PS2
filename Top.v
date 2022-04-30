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
		input PS2D,
		input clk,
		output reg NOTEF,
		input PS2C
    );
	 wire[25:0] note;
	 reg [25:0] count;
	 Receiver receiver(.ps2d(PS2D), .CLK(PS2C), .FinalNote(note));
	 
	 always @(posedge clk) begin
		begin
			count <= count + 1;
			if(count == note) begin
				NOTEF <= !NOTEF; //Tooglear ClkRedu
				count <= 0;
			end
		end
	 end
endmodule
