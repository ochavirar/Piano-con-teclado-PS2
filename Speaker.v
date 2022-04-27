`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:47 04/27/2022 
// Design Name: 
// Module Name:    Speaker 
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
module Speaker(
	input clk,
	input [7:0] note,
	output speakerNote
   );
	 
	 reg [3:0] estado;
	 reg [11:0] count;

	 always @(posedge CLK) begin
		count <= count + 1;
		if(count == 95_557) begin 
			clkRedu <= !clkRedu;
			count <= 0;
		end
	 end
	 
	 

assign speakerNote = clkRedu;

endmodule
