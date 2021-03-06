// WARNING: Do NOT edit the input and output ports in this file in a text
// editor if you plan to continue editing the block that represents it in
// the Block Editor! File corruption is VERY likely to occur.

// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions
// and other software and tools, and its AMPP partner logic
// functions, and any output files from any of the foregoing
// (including device programming or simulation files), and any
// associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License
// Subscription Agreement, Altera MegaCore Function License
// Agreement, or other applicable license agreement, including,
// without limitation, that your use is for the sole purpose of
// programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the
// applicable agreement for further details.


// Generated by Quartus II 64-Bit Version 13.0 (Build Build 232 06/12/2013)
// Created on Wed May 12 02:41:07 2021

//  Module Declaration
module Comparator
(
// {{ALTERA_ARGS_BEGIN}} DO NOT REMOVE THIS LINE!
HASH, R, C, LEDT, LEDF
// {{ALTERA_ARGS_END}} DO NOT REMOVE THIS LINE!
);
// Port Declaration

// {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
input 	[0:255]	HASH;
input R;
input C;
output LEDT;
output LEDF;
// {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!
reg					LEDT;
reg					LEDF;
reg 		[0:255]	TRUE_HASH;
reg		[0:2]		COUNTER;

always @(posedge R or posedge C)
begin
	if (R == 1'b1)
	begin
		COUNTER <= 3'b000;
		TRUE_HASH <= 256'hdf3f619804a92fdb4057192dc43dd748ea778adc52bc498ce80524c014b81119;
	end
	else if (C == 1'b1)
	begin
		COUNTER = COUNTER + 1;
		case (COUNTER)
		3'b001: 	TRUE_HASH <= 256'hb40711a88c7039756fb8a73827eabe2c0fe5a0346ca7e0a104adc0fc764f528d;
		3'b010:	TRUE_HASH <= 256'hb2ed992186a5cb19f6668aade821f502c1d00970dfd0e35128d51bac4649916c;
		3'b011:	TRUE_HASH <= 256'h7a60030ee7988e0303d7aa0468de714a2dcf7196951a2da1fca66743257ea0cd;
		3'b100:	TRUE_HASH <= 256'h19dcffd4fdfd1187cf70b77b94b60bddb70bddc3c04ae8093ccdc283333ed18a;
		3'b101:	TRUE_HASH <= 256'had95131bc0b799c0b1af477fb14fcf26a6a9f76079e48bf090acb7e8367bfd0e;
		3'b110: 	TRUE_HASH <= 256'hfb64bd969a3579cbc8e0c5f1f7af1a334a2b77f346c5a62e87aa7204753b2445;
		3'b111:	TRUE_HASH <= 256'hdbed14ceb001d110d766b9013d3b5bbffad6915475a9ba07932d2ac057944c04;
		default: TRUE_HASH <= 256'hdf3f619804a92fdb4057192dc43dd748ea778adc52bc498ce80524c014b81119;
		endcase
	end	
end

always @(HASH or TRUE_HASH)
begin
	LEDT <= (HASH == TRUE_HASH);
	LEDF <= (HASH != TRUE_HASH);
end

endmodule
