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
	 
	 	//CUARTA  OCTAVA
		if(data == 8'h1Z) //Do4
			Frec <= 95_555;
		else if(data == 8'h22) //Re4
			Frec <= 85_132;
		else if (data == 8'h21) //Mi4
			Frec <= 75_843;
		else if (data == 8'h2A) //Fa4
			Frec <= 71_586;
		else if (data == 8'h32) //Sol4
			Frec <= 63_776;
		else if (data == 8'h31) //La4
			Frec <= 56_818;
		else if (data == 8'h3A) //Si4
			Frec <= 50_620;
			
	 //TERCERA OCTAVA
		else if(data == 8'h1C) //Do3
			Frec <= 190_840;
		else if(data == 8'h1B) //Re3
			Frec <= 173_611;
		else if (data == 8'h23) //Mi3
			Frec <= 151_515;
		else if (data == 8'h2B) //Fa3
			Frec <= 142_857;
		else if (data == 8'h34) //Sol3
			Frec <= 127_551;
		else if (data == 8'h33) //La3
			Frec <= 113_636;
		else if (data == 8'h3B) //Si3
			Frec <= 101_239;
			
		//SEGUNDA OCTAVA 
		
		else if(data == 8'h15) //Do2
			Frec <= 382_205;
		else if(data == 8'h1D) //Re2
			Frec <= 340_507;
		else if (data == 8'h24) //Mi2
			Frec <= 303_361;
		else if (data == 8'h2D) //Fa2
			Frec <= 286_336;
		else if (data == 8'h2C) //Sol2
			Frec <= 255_102;
		else if (data == 8'h35) //La2
			Frec <= 227_273;
		else if (data == 8'h3C) //Si2
			Frec <= 202_478;
			
		//PRIMERA  OCTAVA 
		
			else if(data == 8'h16) //Do1
			Frec <= 764_526;
		else if(data == 8'h1E) //Re1
			Frec <= 681_013;
		else if (data == 8'h26) //Mi1
			Frec <= 606_796;
		else if (data == 8'h25) //Fa1
			Frec <= 572_737;
		else if (data == 8'h2E) //Sol1
			Frec <= 510_204;
		else if (data == 8'h36) //La1
			Frec <= 454_545;
		else if (data == 8'h3D) //Si1
			Frec <= 404_924;
		else 
			Frec <= 0;
	 end
		
	assign FinalNote = Frec;
endmodule
