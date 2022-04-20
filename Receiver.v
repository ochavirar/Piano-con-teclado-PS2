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
    input clk,
    input Rx,
	 output clock
    );
	 
	 reg [0:7] data;
	 reg [11:0] conteo;
	 reg Frecuencia1;
	 
	 always@(posedge clk)
		 begin
			conteo <= conteo +1;
							
			if(conteo == (2_083))
				begin
					Frecuencia1 <= !Frecuencia1;
					conteo <= 0;
				end
		 end


endmodule

