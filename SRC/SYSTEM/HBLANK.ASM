HBLANK:
		MOVE	#$2700,	SR
		TST.W	(F_HBLA_PAL).W
		BEQ.S	HB_NOCHG
		MOVE.W	#0,	(F_HBLA_PAL).W
		MOVEM.L	A0-A1,	-(SP)
		LEA		($C00000).L,	A1
		LEA		(V_PAL_WATER).W,	A0
		MOVE.L	#$C0000000,	4(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.L	(A0)+,	(A1)
		MOVE.W	#$8ADF,	4(A1)
		MOVEM.L	(SP)+,	A0-A1
		TST.B	(F_DOUPDATESINHBLANK).W
		BNE.S	LOC_13DE
		
	HB_NOCHG:
		RTE
		
	LOC_13DE:
		CLR.B	(F_DOUPDATESINHBLANK).W
		MOVEM.L	D0-D7/A0-A6,	-(SP)
		BSR.W	DEMO_TIME
		JSR		UPDATEMUSIC
		MOVEM.L	(SP)+,	D0-D7/A0-A6
		RTE