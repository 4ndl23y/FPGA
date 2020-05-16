
module serializer50to10(
	input clk,
	input [49:0]in,
	output [9:0]out,
	output reg sync
);

	reg [9:0]outreg;
	integer i = 0;

	assign out = outreg;
	initial sync = 1;
	
	always @(posedge clk) 
	begin
	
		case(i)
			0 : begin outreg[9:0] <= in[9:0]; 	i++; sync = 0; end
			1 : begin outreg[9:0] <= in[19:10]; i++; 				end
			2 : begin outreg[9:0] <= in[29:20]; i++; 				end
			3 : begin outreg[9:0] <= in[39:30]; i++; 				end
			4 : begin outreg[9:0] <= in[49:40]; i = 0; sync = 1; end
		endcase	
		
	end
	
endmodule





/*
module serializer50to10test;

	reg clk;
	reg [49:0]in;
	wire [9:0]out;
	wire sync;

	serializer50to10 DUT(
		.clk(clk), 
		.in(in), 
		.out(out), 
		.sync(sync)
	);

	initial 
	begin
		clk = 1;
		in = 50'b01001110110111001010001011101001111111000101001100;
		#100;
	end
      
   always begin #5 clk = ~clk; end
	always begin #40 in = in + 5; end

endmodule*/
