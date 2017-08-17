`timescale 1ns / 1ps

module sw_clock(
    input CLK,
	 input RST,
	 input sw_input,
    output reg pulse
    );
	 
	 reg [15:0] count;
	 
	//-----------------------------------------------------
	// チャタリング除去
	//-----------------------------------------------------
	reg sw;
	always @(posedge CLK) begin
    if(~RST) count <= 0;
    else count <= count + 1;
	end
	
	always @(posedge CLK) begin
    if(count==0)
      begin
        sw <= sw_input;
      end
	end

	//-------------------------------
	// 1CLKパルス生成
	//-------------------------------
	reg pulse_tmp;
	always @(posedge CLK) begin
		pulse_tmp <= sw;
		pulse <= (~pulse_tmp & sw);
	end
	
endmodule