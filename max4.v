`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/13 22:04:03
// Design Name: 
// Module Name: max4
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


module mux4(
    input [3:0] c,
    input [1:0] x,
    output y
    );
    
    wire y1;
    wire y0;
    
    mux2 mux2_1(.c(c[3:2]), .x(x[0]), .y(y1));
    mux2 mux2_0(.c(c[1:0]), .x(x[0]), .y(y0));
    
    assign y = (~x[1]) ? y0 : y1;
endmodule
