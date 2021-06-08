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
// Created on Wed May 12 03:03:57 2021

//  Module Declaration
module Hash
(
	// {{ALTERA_ARGS_BEGIN}} DO NOT REMOVE THIS LINE!
	IN, OUT, PREVIEW
	// {{ALTERA_ARGS_END}} DO NOT REMOVE THIS LINE!
);
// Port Declaration

	// {{ALTERA_IO_BEGIN}} DO NOT REMOVE THIS LINE!
	input		[0:31]	IN;	//4 байта - входящее собщение
	output	[0:255]	OUT;
	output	[0:15]	PREVIEW;
	// {{ALTERA_IO_END}} DO NOT REMOVE THIS LINE!
reg	[0:255]	OUT;	
reg	[0:15]	PREVIEW;

//Квадратные корни первых восьми простых чисел
reg	[0:31]	H0;
reg	[0:31]	H1;
reg	[0:31]	H2;
reg	[0:31]	H3;
reg	[0:31]	H4;
reg	[0:31]	H5;
reg	[0:31]	H6;
reg	[0:31]	H7;

//Кубические корни первых 64 простых чисел
reg [0:31] k[0:63];

reg [0:31] w[0:63];	//Слова

reg [0:511] message;	//Сообщение
integer i;
reg [0:31] s0;
reg [0:31] s1;
reg [0:31] sum0;
reg [0:31] sum1;
reg [0:31] Ma;
reg [0:31] Ch;
reg [0:31] t1;
reg [0:31] t2;
reg [0:31] a;
reg [0:31] b;
reg [0:31] c;
reg [0:31] d;
reg [0:31] e;
reg [0:31] f;
reg [0:31] g;
reg [0:31] h;

always @(IN)
begin
	k[0] = 32'h428a2f98;
	k[1] = 32'h71374491;
	k[2] = 32'hb5c0fbcf;
	k[3] = 32'he9b5dba5;
	k[4] = 32'h3956c25b; 
	k[5] = 32'h59f111f1;
	k[6] = 32'h923f82a4; 
	k[7] = 32'hab1c5ed5;
	k[8] = 32'hd807aa98;
	k[9] = 32'h12835b01;
	k[10] = 32'h243185be;
	k[11] = 32'h550c7dc3;
	k[12] = 32'h72be5d74;
	k[13] = 32'h80deb1fe;
	k[14] = 32'h9bdc06a7;
	k[15] = 32'hc19bf174;
	k[16] = 32'he49b69c1;
	k[17] = 32'hefbe4786;
	k[18] = 32'h0fc19dc6;
	k[19] = 32'h240ca1cc;
	k[20] = 32'h2de92c6f;
	k[21] = 32'h4a7484aa;
	k[22] = 32'h5cb0a9dc;
	k[23] = 32'h76f988da;
	k[24] = 32'h983e5152;
	k[25] = 32'ha831c66d;
	k[26] = 32'hb00327c8;
	k[27] = 32'hbf597fc7;
	k[28] = 32'hc6e00bf3;
	k[29] = 32'hd5a79147;
	k[30] = 32'h06ca6351;
	k[31] = 32'h14292967;
	k[32] = 32'h27b70a85;
	k[33] = 32'h2e1b2138;
	k[34] = 32'h4d2c6dfc;
	k[35] = 32'h53380d13;
	k[36] = 32'h650a7354;
	k[37] = 32'h766a0abb;
	k[38] = 32'h81c2c92e;
	k[39] = 32'h92722c85;
	k[40] = 32'ha2bfe8a1;
	k[41] = 32'ha81a664b;
	k[42] = 32'hc24b8b70;
	k[43] = 32'hc76c51a3;
	k[44] = 32'hd192e819;
	k[45] = 32'hd6990624;
	k[46] = 32'hf40e3585;
	k[47] = 32'h106aa070;
	k[48] = 32'h19a4c116;
	k[49] = 32'h1e376c08;
	k[50] = 32'h2748774c;
	k[51] = 32'h34b0bcb5;
	k[52] = 32'h391c0cb3;
	k[53] = 32'h4ed8aa4a;
	k[54] = 32'h5b9cca4f;
	k[55] = 32'h682e6ff3;
	k[56] = 32'h748f82ee;
	k[57] = 32'h78a5636f;
	k[58] = 32'h84c87814; 
	k[59] = 32'h8cc70208;
	k[60] = 32'h90befffa;
	k[61] = 32'ha4506ceb;
	k[62] = 32'hbef9a3f7;
	k[63] = 32'hc67178f2;
	
	//Инициализация Hi
	H0 = 32'h6a09e667;
	H1 = 32'hbb67ae85;
	H2 = 32'h3c6ef372;
	H3 = 32'ha54ff53a;
	H4 = 32'h510e527f;
	H5 = 32'h9b05688c;
	H6 = 32'h1f83d9ab;
	H7 = 32'h5be0cd19;

	//Добавление единицы в конец
	message = {IN[0:31], 1'b1, 415'b0, 64'h20};

	//Разбиение на 16 слов по 32 бита
	for (i = 0; i < 16; i = i + 1)
	begin
		w[i] = message[0:31];
		message = message << 32;
	end

	//Генерируются дополнительные 48 слов
	for (i = 16; i < 64; i = i+1)
	begin
		s0 = {w[i-15][25:31], w[i-15][0:24]} ^ {w[i-15][14:31], w[i-15][0:13]}  ^ (w[i-15] >> 3);
		s1 = {w[i-2][15:31], w[i-2][0:14]} ^ {w[i-2][13:31], w[i-2][0:12]} ^ (w[i-2] >> 10);
		w[i] = w[i-16] + s0 + w[i-7] + s1;
	end

	//Инициализируются вспомогательные переменные
	a = H0;
	b = H1;
	c = H2;
	d = H3;
	e = H4;
	f = H5;
	g = H6;
	h = H7;

	//Основной цикл
	for (i = 0; i < 64; i = i+1)
	begin
		sum0 = {a[30:31], a[0:29]} ^ {a[19:31], a[0:18]} ^ {a[10:31], a[0:9]};
		Ma = (a & b) ^ (a & c) ^ (b & c);
		t2 = sum0 + Ma;
		sum1 = {e[26:31], e[0:25]} ^ {e[21:31], e[0:20]} ^ {e[7:31],e[0:6]};
		Ch = (e & f) ^ ((~e) & g);
		t1 = h + sum1 + Ch + k[i] + w[i];
		h = g;
		g = f;
		f = e;
		e = d + t1;
		d = c;
		c = b;
		b = a;
		a = t1 + t2;
	end
	
	//Вспомогателньые переменные добавляются к H-кам
	H0 = H0 + a;
	H1 = H1 + b;
	H2 = H2 + c;
	H3 = H3 + d;
	H4 = H4 + e;
	H5 = H5 + f;
	H6 = H6 + g;
	H7 = H7 + h;
	OUT = {H0, H1, H2, H3, H4, H5, H6, H7};
	PREVIEW <= OUT[0:15];
end

endmodule