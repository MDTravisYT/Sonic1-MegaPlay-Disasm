SUB_7BA:
		SBCD	-(A1),	-(A4)
		CMP.B	D0,	D2
		ORI.B	#0,	D0

LOC_7C2:
		MOVEQ	#DWORD_FFFF81,	D0
		BRA.S	LOC_7C8

;	===========================================================

LOC_7C6:
		MOVEQ	#DWORD_FFFF82,	D0

LOC_7C8:
		MOVE.W	#$100,	($A11100).L

LOC_7D0:
		BTST	#7,	($A11100).L
		BNE.S	LOC_7D0
		MOVE.B	D0,	($A01D8A).L
		MOVE.W	#0,	($A11100).L
		RTS