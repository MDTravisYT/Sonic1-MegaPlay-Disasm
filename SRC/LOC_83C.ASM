LOC_83C:
		BRA.W	LOC_668
		BRA.W	LOCRET_672
		BRA.W	LOC_6A4
		BRA.W	LOC_6BC
		BRA.W	LOC_896
		BRA.W	LOC_74C
		BRA.W	LOC_7C2
		BRA.W	LOC_7C6
		BRA.W	LOC_89A
		BRA.W	LOC_886
		BRA.W	LOC_88E
		BRA.W	LOC_8A2
		
;	===========================================================
		
UNK_86C:
		DC.L	$BFFF8
		DC.L	$FFF9FF80
		DC.L	$FF88FF85
		DC.L	$FF8DFF8E
		DC.L	$FF90FF01
		DC.L	$FF02FF03
		DC.W	$FF0A
		
;	===========================================================
		
LOC_886:
		MOVE.B	#$20,	(V_GAMEMODE).W
		RTS

;	===========================================================
		
LOC_88E:
		MOVE.B	#$4,	(V_GAMEMODE).W
		RTS
		
;	===========================================================
		
LOC_896:
		BSR.W	SUB_71E
		
LOC_89A:
		MOVE.B	#0,		(V_GAMEMODE).W
		RTS
		
;	===========================================================
		
LOC_8A2:
		MOVE.W	#$FFFF,	(V_TITLE_DCOUNT).W
		RTS
		
;	===========================================================
		BRA.W	ERRORTRAP
		RTS