SUB_6E8:
		MOVEA.L	A0,	A1
		MOVE.W	D1,	D2
		
LOC_6EC:
		MOVE.B	(A1),	D3
		MOVE.B	#$FF,	D0
		MOVE.B	D0,	(A1)
		CMP.B	(A1),	D0
		BNE.S	LOC_712
		NOT.W	D0
		MOVE.B	D0,	(A1)
		CMP.B	(A1),	D0
		BNE.S	LOC_712
		MOVE.B	#$55,	D0
		MOVE.B	D0,	(A1)
		CMP.B	(A1),	D0
		BNE.S	LOC_712
		NOT.W	D0
		MOVE.B	D0,	(A1)
		CMP.B	(A1),	D0
		BEQ.S	LOC_714
		
LOC_712:
		BSET	D7,	D6
		
LOC_714:
		MOVE.B	D3,	(A1)
		ADDQ.W	#2,	A1
		DBF		D2,	LOC_6EC
		RTS