`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/13 23:13:00
// Design Name: 
// Module Name: full_addr
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


module full_addr(
    input a,
    input b,
    input c0,
    output s,
    output c1
    );
    
    assign s = (a ^ b) ^ c0;
    assign c1 = (a & b) | ((a ^ b) & c0);
endmodule
