`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/13 22:16:00
// Design Name: 
// Module Name: max2
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


module mux2(
    input [1:0] c,
    input x,
    output y
    );
    
    assign y = (~x & c[0]) | (x & c[1]);
endmodule
