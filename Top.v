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
		output [7:0] DATA,
		output NOTE
    );
	 wire [11:0] nota;
	
	 Receiver receiver(.ps2d(PS2D), .CLK(clk),.FinalNote(nota));
	 Speaker speaker(.clk(CLK),.Frecuencia(nota),.speakerNote(NOTE));
endmodule
