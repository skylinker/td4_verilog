`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/13 23:09:01
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] a,
    input [3:0] b,
    input c0,
    output [3:0] s,
    output c4
    );
    
    wire c1, c2, c3;
    
    full_addr full_addr3(.a(a[3]), .b(b[3]), .c0(c3), .s(s[3]), .c1(c4));
    full_addr full_addr2(.a(a[2]), .b(b[2]), .c0(c2), .s(s[2]), .c1(c3));
    full_addr full_addr1(.a(a[1]), .b(b[1]), .c0(c1), .s(s[1]), .c1(c2));
    full_addr full_addr0(.a(a[0]), .b(b[0]), .c0(c0), .s(s[0]), .c1(c1));
endmodule
