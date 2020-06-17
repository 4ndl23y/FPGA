// 644 logic elements for Max II


module deserializer10to49(
		input [0:9]in,
		input clk,
		input sync,
		output [0:48]out
);

	reg [0:48]outreg;
	reg [489:0]data; // 49 * 10 - 1
	
	integer count_in = 1;
	integer count_out = 1;

	assign out = outreg;

	always @(posedge clk) 
	begin
		case(count_in)
			1: 	begin	data[9:0] <= in; 		count_in++; end
			2: 	begin	data[19:10] <= in;	count_in++; end
			3: 	begin	data[29:20] <= in;	count_in++; end
			4: 	begin	data[39:30] <= in;	count_in++; end
			5: 	begin data[49:40] <= in;	count_in++; end
			6: 	begin data[59:50] <= in;	count_in++; end
			7: 	begin data[69:60] <= in;	count_in++; end
			8: 	begin data[79:70] <= in;	count_in++; end
			9: 	begin data[89:80] <= in;	count_in++; end
			10: 	begin data[99:90] <= in;	count_in++; end
			11: 	begin data[109:100] <= in;	count_in++; end
			12: 	begin data[119:110] <= in;	count_in++; end
			13: 	begin data[129:120] <= in;	count_in++; end
			14: 	begin data[139:130] <= in;	count_in++; end
			15: 	begin data[149:140] <= in;	count_in++; end
			16: 	begin data[159:150] <= in;	count_in++; end
			17: 	begin data[169:160] <= in;	count_in++; end
			18: 	begin data[179:170] <= in;	count_in++; end
			19: 	begin data[189:180] <= in;	count_in++; end
			20: 	begin data[199:190] <= in;	count_in++; end
			21: 	begin data[209:200] <= in;	count_in++; end
			22: 	begin data[219:210] <= in;	count_in++; end
			23: 	begin data[229:220] <= in;	count_in++; end
			24: 	begin data[239:230] <= in;	count_in++; end
			25: 	begin data[249:240] <= in;	count_in++; end
			26: 	begin data[259:250] <= in;	count_in++; end
			27: 	begin data[269:260] <= in;	count_in++; end
			28: 	begin data[279:270] <= in;	count_in++; end
			29: 	begin data[289:280] <= in;	count_in++; end
			30: 	begin data[299:290] <= in;	count_in++; end
			31: 	begin data[309:300] <= in;	count_in++; end
			32: 	begin data[319:310] <= in;	count_in++; end
			33: 	begin data[329:320] <= in;	count_in++; end
			34:	begin data[339:330] <= in;	count_in++; end
			35:	begin data[349:340] <= in;	count_in++; end
			36:	begin data[359:350] <= in;	count_in++; end
			37: 	begin data[369:360] <= in;	count_in++; end
			38: 	begin data[379:370] <= in;	count_in++; end
			39: 	begin data[389:380] <= in;	count_in++; end
			40: 	begin data[399:390] <= in;	count_in++; end
			41: 	begin data[409:400] <= in;	count_in++; end
			42: 	begin data[419:410] <= in;	count_in++; end
			43: 	begin data[429:420] <= in;	count_in++; end
			44: 	begin data[439:430] <= in;	count_in++; end
			45: 	begin data[449:440] <= in;	count_in++; end
			46: 	begin data[459:450] <= in;	count_in++; end
			47: 	begin data[469:460] <= in;	count_in++; end
			48:	begin data[479:470] <= in;	count_in++; end
			49: 	begin data[489:480] <= in;	count_in = 1; end
			default: ;
		 endcase;
	end

	always @(negedge sync)
	begin
		case(count_out)
			1: 	begin outreg <= data[48:0]; 		count_out++; end
			2: 	begin outreg <= data[97:49];		count_out++; end
			3: 	begin outreg <= data[146:98];		count_out++; end
			4: 	begin outreg <= data[195:147];	count_out++; end
			5: 	begin outreg <= data[244:196];	count_out++; end
			6: 	begin outreg <= data[293:245];	count_out++; end
			7: 	begin outreg <= data[342:294];	count_out++; end
			8: 	begin outreg <= data[391:343];	count_out++; end
			9: 	begin outreg <= data[440:392];	count_out++; end
			10: 	begin outreg <= data[489:441];	count_out = 1; end
			default: ;
		endcase;
	end
	
endmodule


/*
module deserializer10to49test;

		reg [0:9]in;
		reg clk;
		reg sync;
		wire [0:48]out;
		
		deserializer10to49 DUT(
			.in(in),
			.clk(clk),
			.sync(sync),
			.out(out)
		);
		
		initial 
		begin
			in = 10'b1011010111;
			clk = 0;
			sync = 0;
			#100;
		end
		
		
		always #10 begin clk = ~clk; end
		always #20 begin in = in + 1; end
		always #49 begin sync = ~sync; end // 49*2
		
endmodule*/

