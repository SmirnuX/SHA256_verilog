module testmodule
(
	C, R, LED_BAD, LED_GOOD
);
input C;
input R;
output LED_BAD;
output LED_GOOD;

wire	C;
wire	R;
wire [0:31] IN;
wire [0:255] OUT;
wire TRUE;
wire FALSE;

assign LED_BAD = FALSE;
assign LED_GOOD = TRUE;

Comparator CMP(
	.HASH (OUT),
	.R (R),
	.C (C),
	.LEDT (TRUE),
	.LEDF (FALSE)
);

Hash HSH (
	.IN (IN),
	.OUT (OUT)
);

TestDataGen TST (
	.R (R),
	.C (C),
	.WORD (IN)
);

endmodule
