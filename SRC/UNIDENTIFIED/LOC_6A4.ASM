LOC_6A4:
		MOVEQ	#0,	D0
		BSR.W	SUB_7EA
		ADD.W	D6,	D6
		MOVE.W	WORD_6B4(PC,D6.W),	D0
		BRA.W	SUB_4F6
		
WORD_6B4:
		DC.W	$FF81
		DC.W	$FF83
		DC.W	$FF82
		DC.W	$FF84