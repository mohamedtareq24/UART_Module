//8-bit Shift Register 
module Shift_Register(
	input d,
	input clk,
	input en,
	input reset,
	output reg [8:0] out //output is 8-bits
);
	//Triggered by the positive edge of the clock
always @(posedge clk)
	begin
		if(~reset)
			out <= 0; //non - blocking assignment
		else if(en)
			out <= {d, out[8:1]};

	end

endmodule 
