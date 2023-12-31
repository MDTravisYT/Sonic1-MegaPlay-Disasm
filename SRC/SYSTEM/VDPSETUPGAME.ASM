VDPSETUPGAME:
		LEA		($C00004).L,	A0
		LEA		($C00000).L,	A1
		LEA		(VDPSETUPARRAY).L,	A2
		MOVEQ	#$12,	D7
		
	VDPSETUP_SETREG:
		MOVE.W	(A2)+,	(A0)
		DBF		D7,	VDPSETUP_SETREG
		MOVE.W	(VDPSETUPARRAY+2).L,	D0
		MOVE.W	D0,	(V_VDP_BUFFER1).W
		MOVE.W	#$8ADF,	(V_HBLA_HREG).W
		MOVEQ	#0,	D0
		MOVE.L	#$C0000000,	($C00004).L
		MOVE.W	#$3F,	D7
		
	VDPSETUP_CLRCRAM:
		MOVE.W	D0,	(A1)
		DBF		D7,	VDPSETUP_CLRCRAM
		CLR.L	(V_SCRPOSY_VDP).W
		CLR.L	(V_SCRPOSX_VDP).W
		MOVE.L	D1,	-(SP)
		LEA		($C00004).L,	A5
		MOVE.W	#$8F01,	(A5)
		MOVE.L	#$94FF93FF,	(A5)
		MOVE.W	#$9780,	(A5)
		MOVE.L	#$40000080,	(A5)
		MOVE.W	#0,	($C00000).L
		
	VDPSETUP_WAITFORDMA:
		MOVE.W	(A5),	D1
		BTST	#1,	D1
		BNE.S	VDPSETUP_WAITFORDMA
		MOVE.W	#$8F02,	(A5)
		MOVE.L	(SP)+,	D1
		RTS
		
VDPSETUPARRAY:
		DC.W	$8004
		DC.W	$8134
		DC.W	$8230
		DC.W	$8328
		DC.W	$8407
		DC.W	$857C
		DC.W	$8600
		DC.W	$8700
		DC.W	$8800
		DC.W	$8900
		DC.W	$8A00
		DC.W	$8B00
		DC.W	$8C81
		DC.W	$8D3F
		DC.W	$8E00
		DC.W	$8F02
		DC.W	$9001
		DC.W	$9100
		DC.W	$9200