`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/14 08:44:35
// Design Name: 
// Module Name: rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rom(
    input [3:0] adr,
    output reg [7:0] dout
    );
    always @(adr) begin
        case(adr)
		  /*
				4'b0000: dout <= 8'b10110011;
				4'b0001: dout <= 8'b10110110;
				4'b0010: dout <= 8'b10111100;
				4'b0011: dout <= 8'b10111000;
				4'b0100: dout <= 8'b10111000;
				4'b0101: dout <= 8'b10111100;
				4'b0110: dout <= 8'b10110110;
				4'b0111: dout <= 8'b10110011;
				4'b1000: dout <= 8'b10110001;
				4'b1001: dout <= 8'b10110001;
				4'b1010: dout <= 8'b11110000;
			*/
			
				4'b0000: dout <= 8'b01100000; //IN B
				4'b0001: dout <= 8'b10010000; //OUT B
				4'b0010: dout <= 8'b11110000; //JMP 0
				default: dout <= 8'b11111111;
			
			/*
            4'b0000: dout <= 8'b00000110; //ADD A, Im
            4'b0001: dout <= 8'b01000000; //MOV B, A
            4'b0010: dout <= 8'b00100000; //IN A
            4'b0011: dout <= 8'b00010000; //MOV A, B
            4'b0100: dout <= 8'b01011000; //ADD B, 8
            4'b0101: dout <= 8'b01100000; //IN B
            4'b0110: dout <= 8'b01110010; //MOV B, 3
            4'b0111: dout <= 8'b10010000; //OUT B
            4'b1000: dout <= 8'b10110110; //OUT 6
            4'b1001: dout <= 8'b11111101; //JMP 11
            4'b1010: dout <= 8'b00110000; //MOV A, 0
            4'b1011: dout <= 8'b01110000; //MOV B, 0
            4'b1100: dout <= 8'b10110000; //OUT 0
            4'b1101: dout <= 8'b01011100; //ADD B, 12
            4'b1110: dout <= 8'b11101010; //JNC 10
            4'b1111: dout <= 8'b11111111; //JMP 15
			*/
        endcase
    end
endmodule
