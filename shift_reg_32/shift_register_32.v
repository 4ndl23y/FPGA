module shift_register_32(
	input wire clk, data,
	output wire [31:0]q
);
	reg [31:0]qreg;
	
	assign q = qreg;
	
	always @(posedge clk)
	begin
		qreg[31:1] <= qreg[30:0];
		qreg[0] <= data;
	end
endmodule





/*
module shift_register_32test;

	reg clk;
	reg data;
	wire [31:0]q;


	shift_register_32 DUT(
		.clk(clk),
		.data(data),
		.q(q)
	);
	
	integer arr[32] = {0,1,1,1,0,0,1,0,0,0,0,0,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,0,0,1,0};
	integer i = 0;
	
	initial clk = 0;
	initial data = 0;

	always #5 begin clk = ~clk; end
	always #10 begin data = arr[i]; i = (i < 31 ? i + 1 : 0); end

endmodule*/
