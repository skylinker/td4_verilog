`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/14 07:43:16
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [3:0] OP,
    input C_Flag,
    output [3:0] LOAD,
    output [1:0] SELECT
    );
    assign SELECT[1] = OP[1];
    assign SELECT[0] = OP[0] | OP[3];
    assign LOAD[3] = ~((~OP[2]) | (~OP[3]) | ((~OP[0]) & C_Flag));
    assign LOAD[2] = (~OP[2]) & OP[3];
    assign LOAD[1] = ~((~OP[2]) | OP[3]);
    assign LOAD[0] = ~(OP[2] | OP[3]);
endmodule
