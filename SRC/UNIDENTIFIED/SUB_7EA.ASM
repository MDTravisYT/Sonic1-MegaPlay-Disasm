SUB_7EA:
		BSR.W	SUB_800
		LEA		(V_256X256).L,	A0
		ANDI.W	#$1F,	D0
		MOVE.L	(A0,D0.W),	D0
		JMP		(A0,D0.W)