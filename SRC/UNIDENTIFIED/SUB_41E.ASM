SUB_41E:
		MOVEQ	#0,D0
		MOVE.B	($A10007).L,D7
		ANDI.W	#$38,D7
		CMPI.B	#$20,D7
		BNE.W	LOC_4D2
		MOVEQ	#7,D5
		MOVE.W	#$2000,D2

LOC_438:
		LSL.W	#2,D0

LOC_43A:
		SUBQ.W	#1,D2
		BEQ.W	LOC_4D2
		MOVE.B	($A10007).L,D7
		ANDI.W	#$38,D7
		CMPI.B	#$20,D7
		BNE.S	LOC_43A
		MOVE.B	#5,D7
		MOVE.W	D7,D4
		ANDI.W	#3,D4
		MOVE.B	D4,($A10007).L
		NOP
		NOP
		MOVE.B	D7,($A10007).L
		MOVE.W	#$2000,D2

LOC_46E:
		SUBQ.W	#1,D2
		BEQ.W	LOC_4D2
		MOVE.B	($A10007).L,D7
		ANDI.W	#$38,D7
		BTST	#5,D7
		BNE.S	LOC_46E
		LSR.W	#3,D7
		OR.B	D7,D0
		MOVE.B	#6,D6
		MOVE.W	D6,D4
		ANDI.W	#3,D4
		MOVE.B	D4,($A10007).L
		NOP
		NOP
		MOVE.B	D6,($A10007).L
		MOVE.W	#$2000,D2
		DBF		D5,LOC_438

LOC_4AA:
		SUBQ.W	#1,D2
		BEQ.W	LOC_4D2
		MOVE.B	($A10007).L,D7
		ANDI.W	#$38,D7
		CMPI.B	#$38,D7
		BNE.S	LOC_4AA
		MOVE.B	#0,D6
		ANDI.W	#7,D6
		MOVE.B	D6,($A10007).L
		MOVEQ	#0,D7
		RTS
		
;	===========================================================
	
LOC_4D2:
		MOVE.B	#0,D6
		ANDI.W	#7,D6
		MOVE.B	D6,($A10007).L
		MOVEQ	#0,D0
		MOVEQ	#$FFFFFFFF,D7
		ORI		#1,CCR
		RTS
