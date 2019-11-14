`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:45:24 10/24/2019 
// Design Name: 
// Module Name:    music 
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
module music(clk,speaker,sw,led, status);
	  parameter noteF4 = 25000000/349/2,
					noteG4 = 25000000/392/2,
					noteC5 = 25000000/523/2;
    input clk;
	 input [2:0] sw;
	 output [2:0] led;
    output speaker;
	 output reg status = 0;


reg[15:0] counter;
always@(posedge clk)
	if(counter==0) 
			
	begin
		case(sw)
			3'b110:begin
				counter <= noteC5 - 1;
				status <= 1;
			end
			3'b101:begin
				counter <= noteG4 - 1;
				status <= 1;
			end
			3'b011:begin
				counter <= noteF4 - 1;
				status <= 1;
			end
			default : status <= 0;
		endcase
	end
	else
		counter <= counter-1;

		
reg speaker;
always @(posedge clk) //play sound: send data to buzzer
	if(counter == 0 && status == 1 ) 
		speaker <= ~speaker;	
	else if(status == 0) 	speaker <= 0;
		
	assign led = sw;
endmodule
