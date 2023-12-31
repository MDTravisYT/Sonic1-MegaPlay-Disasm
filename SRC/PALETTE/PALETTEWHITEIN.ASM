PALETTEWHITEIN:
		MOVE.W	#$3F,	(V_PFADE_START).W
		MOVEQ	#0,	D0
		LEA	(V_PAL_DRY).W,	A0
		MOVE.B	(V_PFADE_START).W,	D0
		ADDA.W	D0,	A0
		MOVE.W	#$EEE,	D1
		MOVE.B	(V_PFADE_START+1).W,	D0
		
	PWI_FILL:
		MOVE.W	D1,	(A0)+
		DBF		D0,	PWI_FILL
		MOVE.W	#$15,	D4
		
	PWI_LOOP:
		MOVE.B	#$12,	(V_VBLA_ROUTINE).W
		BSR.W	WAITFORVBLA
		BSR.S	WHITEIN_FROMWHITE
		BSR.W	RUNPLC
		DBF		D4,	PWI_LOOP
		RTS
		
WHITEIN_FROMWHITE:
		MOVEQ	#0,	D0
		LEA		(V_PAL_DRY).W,	A0
		LEA		(V_PAL_DRY_DUP).W,	A1
		MOVE.B	(V_PFADE_START).W,	D0
		ADDA.W	D0,	A0
		ADDA.W	D0,	A1
		MOVE.B	(V_PFADE_START+1).W,	D0
		
	WIFW_DECOLOR:
		BSR.S	WHITEIN_DECOLOR
		DBF		D0,	WIFW_DECOLOR
		CMPI.B	#1,	(V_ZONE).W
		BNE.S	WIFW_EXIT
		MOVEQ	#0,	D0
		LEA		(V_PAL_WATER).W,	A0
		LEA		(V_PAL_WATER_DUP).W,	A1
		MOVE.B	(V_PFADE_START).W,	D0
		ADDA.W	D0,	A0
		ADDA.W	D0,	A1
		MOVE.B	(V_PFADE_START+1).W,	D0
		
	WIFW_DECOLOR2:
		BSR.S	WHITEIN_DECOLOR
		DBF		D0,	WIFW_DECOLOR2
		
	WIFW_EXIT:
		RTS
		
WHITEIN_DECOLOR:
	WIDC_DERED:
		MOVE.W	(A1)+,	D2
		MOVE.W	(A0),	D3
		CMP.W	D2,	D3
		BEQ.S	WIFW_NEXT
		MOVE.W	D3,	D1
		SUBI.W	#$200,	D1
		BCS.S	WIDC_DEGREEN
		CMP.W	D2,	D1
		BCS.S	WIDC_DEGREEN
		MOVE.W	D1,	(A0)+
		RTS
		
	WIDC_DEGREEN:
		MOVE.W	D3,	D1
		SUBI.W	#$20,	D1
		BCS.S	WIFW_DERED
		CMP.W	D2,	D1
		BCS.S	WIFW_DERED
		MOVE.W	D1,	(A0)+
		RTS
		
	WIFW_DERED:
		SUBQ.W	#2,	(A0)+
		RTS
		
	WIFW_NEXT:
		ADDQ.W	#2,	A0
		RTS