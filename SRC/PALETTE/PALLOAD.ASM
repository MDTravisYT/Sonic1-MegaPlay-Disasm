PALLOAD1:
		LEA		(PALPOINTERS).L,	A1
		LSL.W	#3,	D0
		ADDA.W	D0,	A1
		MOVEA.L	(A1)+,	A2
		MOVEA.W	(A1)+,	A3
		ADDA.W	#$80,	A3
		MOVE.W	(A1)+,	D7
		
	PL1_LOOP:
		MOVE.L	(A2)+,	(A3)+
		DBF		D7,	PL1_LOOP
		RTS
		
PALLOAD2:
		LEA		(PALPOINTERS).L,	A1
		LSL.W	#3,	D0
		ADDA.W	D0,	A1
		MOVEA.L	(A1)+,	A2
		MOVEA.W	(A1)+,	A3
		MOVE.W	(A1)+,	D7
		
	PL2_LOOP:
		MOVE.L	(A2)+,	(A3)+
		DBF		D7,	PL2_LOOP
		RTS
		
PALLOAD3_WATER:
		LEA		(PALPOINTERS).L,	A1
		LSL.W	#3,	D0
		ADDA.W	D0,	A1
		MOVEA.L	(A1)+,	A2
		MOVEA.W	(A1)+,	A3
		SUBA.W	#$80,	A3
		MOVE.W	(A1)+,	D7
		
	PL3_LOOP:
		MOVE.L	(A2)+,	(A3)+
		DBF		D7,	PL3_LOOP
		RTS
		
PALLOAD4_WATER:
		LEA		(PALPOINTERS).L,	A1
		LSL.W	#3,	D0
		ADDA.W	D0,	A1
		MOVEA.L	(A1)+,	A2
		MOVEA.W	(A1)+,	A3
		SUBA.W	#$100,	A3
		MOVE.W	(A1)+,	D7
		
	PL4_LOOP:
		MOVE.L	(A2)+,	(A3)+
		DBF		D7,	PL4_LOOP
		RTS