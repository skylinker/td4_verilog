`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/08/13 23:54:32
// Design Name: 
// Module Name: td4
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


module td4(
    input CLK,
    input RST,
    input [3:0] DIP_SW,
    output [3:0] LED,
	 output [7:0] seg,
	 output [3:0] segsel
    );
    
    reg [3:0] pc; //program counter
    reg [3:0] out;
    reg [7:0] reg_in; //C:11:8,B:7:4,A:3:0
    reg carry_flg;
    
    wire [3:0] LOAD;
    wire [1:0] SELECT;
    wire [3:0] res;
    wire [3:0] y;
    wire carry;
    wire [7:0] run;
    wire [3:0] ImData;
	 
	 wire pulse;
    
    alu alu(.a(y), .b(ImData), .c0(1'b0), .s(res), .c4(carry));
    mux4 mux4_3(.c({1'b0, DIP_SW[3], reg_in[7], reg_in[3]}), .x(SELECT), .y(y[3]));
    mux4 mux4_2(.c({1'b0, DIP_SW[2], reg_in[6], reg_in[2]}), .x(SELECT), .y(y[2]));
    mux4 mux4_1(.c({1'b0, DIP_SW[1], reg_in[5], reg_in[1]}), .x(SELECT), .y(y[1]));
    mux4 mux4_0(.c({1'b0, DIP_SW[0], reg_in[4], reg_in[0]}), .x(SELECT), .y(y[0]));
    decoder decoder(.OP(run[7:4]), .C_Flag(carry_flg), .LOAD(LOAD), .SELECT(SELECT));
    rom rom(.adr(pc), .dout(run));
	 LED7Seg(.clk(CLK), .seg(seg), .segsel(segsel), .data({pc, out, reg_in}));
	 sw_clock(.CLK(CLK), .sw_input(DIP_SW[0]), .pulse(pulse));

    always @(posedge pulse) begin
        if(~RST) begin
            reg_in <= 8'h00;
            carry_flg <= 1'b0;
            pc <= 4'h0;
            out <= 4'h0;
        end else begin
            if(LOAD[3]) pc <= res; else pc <= pc + 1'b1;
            if(LOAD[2]) out <= res;
            if(LOAD[1]) reg_in[7:4] <= res;
            if(LOAD[0]) reg_in[3:0] <= res;
            carry_flg <= carry;
        end
    end
    
    assign ImData = run[3:0];
    assign LED = out;
    assign reg_in_out = {pc, LED, reg_in};
endmodule
