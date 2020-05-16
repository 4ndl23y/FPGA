// 176 log elem

module single_port_mem(
	input [7:0]data,
	input [3:0]addr,
	input we, clk,
	output [7:0]q
);

	reg [7:0] ram[15:0];
	reg [3:0] addr_reg;
	
	assign q = ram[addr_reg];
	
	always @(posedge clk)
	begin
		if(we)
		begin
			ram[addr] <= data;
		end
		addr_reg <= addr;
	end
	
endmodule





/*
module single_port_memtest;

	reg [7:0]data;
	reg [3:0]addr;
	reg we, clk;
	wire [7:0]q;

	single_port_mem DUT(
		.data(data),
		.addr(addr),
		.we(we),
		.clk(clk),
		.q(q)
	);
	
	
	initial 
	begin
		we = 0;
		clk = 0;
		data = 8'b10001101;
		addr = 4'b0000;
	end

	always #5 begin clk = ~clk; end
	
	always #10 begin data = data + 1; addr++; end
	always #80 begin we = ~we; end
	

endmodule*/