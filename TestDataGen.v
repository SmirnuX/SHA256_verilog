module TestDataGen
(
// {{ALTERA_ARGS_BEGIN}} DO NOT REMOVE THIS LINE!
R, C, WORD
// {{ALTERA_ARGS_END}} DO NOT REMOVE THIS LINE!
);
// Port Declaration

// {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
input R;
input C;
output 	[0:31]	WORD;
// {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!
reg		[0:31]	WORD;
reg		[0:2]		COUNTER;

always @(posedge R or posedge C)
begin
	if (R == 1'b1)
	begin
		COUNTER <= 3'b000;
		WORD <= 32'h0000_0000;
	end
	else if (C == 1'b1)
	begin
		COUNTER = COUNTER + 1;
		case (COUNTER)
		3'b001: 	WORD <= 32'h0000_0001;
		3'b010:	WORD <= 32'h1234_5678;
		3'b011:	WORD <= 32'hABCD_EF00;
		3'b100:	WORD <= 32'hBAD0_E0F0;
		3'b101:	WORD <= 32'hFFFF_FFFF;
		3'b110: 	WORD <= 32'h0128_0256;
		3'b111:	WORD <= 32'hAAAA_AAAA;
		default: WORD <= 32'h0000_0000;
		endcase
	end
end

endmodule
