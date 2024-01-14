LEVSELCONTROLS:
		MOVE.B	(V_JPADHOLD1+1).W,	D1
		ANDI.B	#3,	D1
		BNE.S	LEVSEL_UPDOWN
		SUBQ.W	#1,	(V_LEVSELDELAY).W
		BPL.S	LEVSEL_SNDTEST
		
	LEVSEL_UPDOWN:
		MOVE.W	#$B,	(V_LEVSELDELAY).W
		MOVE.B	(V_JPADHOLD1).W,	D1
		ANDI.B	#3,	D1
		BEQ.S	LEVSEL_SNDTEST
		MOVE.W	(V_LEVSELITEM).W,	D0
		BTST	#0,	D1
		BEQ.S	LEVSEL_DOWN
		SUBQ.W	#1,	D0
		BCC.S	LEVSEL_DOWN
		MOVEQ	#$14,	D0
		
	LEVSEL_DOWN:
		BTST	#1,	D1
		BEQ.S	LEVSEL_REFRESH
		ADDQ.W	#1,	D0
		CMPI.W	#$15,	D0
		BCS.S	LEVSEL_REFRESH
		MOVEQ	#0,	D0
		
	LEVSEL_REFRESH:
		MOVE.W	D0,	(V_LEVSELITEM).W
		BSR.W	LEVSELTEXTLOAD
		RTS
		
LEVSEL_SNDTEST:
		CMPI.W	#$14,	(V_LEVSELITEM).W
		BNE.S	LEVSEL_NOMOVE
		MOVE.B	(V_JPADHOLD1+1).W,	D1
		ANDI.B	#$C,	D1
		BEQ.S	LEVSEL_NOMOVE
		MOVE.W	(V_LEVSELSOUND).W,	D0
		BTST	#2,	D1
		BEQ.S	LEVSEL_RIGHT
		SUBQ.W	#1,	D0
		BCC.S	LEVSEL_RIGHT
		MOVEQ	#$4F,	D0
		
	LEVSEL_RIGHT:
		BTST	#$3,	D1
		BEQ.S	LEVSEL_REFRESH2
		ADDQ.W	#1,	D0
		CMPI.W	#$50,	D0
		BCS.S	LEVSEL_REFRESH2
		MOVEQ	#0,	D0
		
	LEVSEL_REFRESH2:
		MOVE.W	D0,	(V_LEVSELSOUND).W
		BSR.W	LEVSELTEXTLOAD
		
	LEVSEL_NOMOVE:
		RTS
		
LEVSELTEXTLOAD:
		LEA		(LEVELMENUTEXT).L,	A1
		LEA		(VDP_DATA_PORT).L,	A6
		MOVE.L	#$62100003,	D4
		MOVE.W	#$E680,	D3
		MOVEQ	#$14,	D1
		
	LEVSEL_DRAWALL:
		MOVE.L	D4,	4(A6)
		BSR.W	LEVSEL_CHGLINE
		ADDI.L	#$800000,	D4
		DBF		D1,	LEVSEL_DRAWALL
		MOVEQ	#0,	D0
		MOVE.W	(V_LEVSELITEM).W,	D0
		MOVE.W	D0,	D1
		MOVE.L	#$62100003,	D4
		LSL.W	#7,	D0
		SWAP	D0
		ADD.L	D0,	D4
		LEA		(LEVELMENUTEXT).L,	A1
		LSL.W	#3,	D1
		MOVE.W	D1,	D0
		ADD.W	D1,	D1
		ADD.W	D0,	D1
		ADDA.W	D1,	A1
		MOVE.W	#$C680,	D3
		MOVE.L	D4,	4(A6)
		BSR.W	LEVSEL_CHGLINE
		MOVE.W	#$E680,	D3
		CMPI.W	#$14,	(V_LEVSELITEM).W
		BNE.S	LEVSEL_DRAWSND
		MOVE.W	#$C680,	D3
		
	LEVSEL_DRAWSND:
		MOVE.L	#$6C300003,	($C00004).L
		MOVE.W	(V_LEVSELSOUND).W,	D0
		ADDI.W	#$80,	D0
		MOVE.B	D0,	D2
		LSR.B	#4,	D0
		BSR.W	LEVSEL_CHGSND
		MOVE.B	D2,	D0
		BSR.W	LEVSEL_CHGSND
		RTS
		
LEVSEL_CHGSND:
		ANDI.W	#$F,	D0
		CMPI.B	#$A,	D0
		BCS.S	LEVSEL_NUMB
		ADDI.B	#7,	D0
		
	LEVSEL_NUMB:
		ADD.W	D3,	D0
		MOVE.W	D0,	(A6)
		RTS
		
LEVSEL_CHGLINE:
		MOVEQ	#$17,	D2
		
	LEVSEL_LINELOOP:
		MOVEQ	#0,	D0
		MOVE.B	(A1)+,	D0
		BPL.S	LEVSEL_CHAROK
		MOVE.W	#0,	(A6)
		DBF		D2,	LEVSEL_LINELOOP
		RTS
		
	LEVSEL_CHAROK:
		ADD.W	D3,	D0
		MOVE.W	D0,	(A6)
		DBF		D2,	LEVSEL_LINELOOP
		RTS
		
LEVELMENUTEXT:

;	LETTER DEFINITIONS
_Y	=	$0F
_Z	=	$10
_A	=	$11
_B	=	$12
_C	=	$13
_D	=	$14
_E	=	$15
_F	=	$16
_G	=	$17
_H	=	$18
_I	=	$19
_L	=	$1C
_M	=	$1D
_N	=	$1E
_O	=	$1F
_P	=	$20
_R	=	$22
_S	=	$23
_T	=	$24
_U	=	$25
__	=	$FF

		DC.B	_G,_R,_E,_E,_N,__,_H,_I,_L,_L,__,_Z,_O,_N,_E,__,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_M,_A,_R,_B,_L,_E,__,_Z,_O,_N,_E,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_S,_P,_R,_I,_N,_G,__,_Y,_A,_R,_D,__,_Z,_O,_N,_E,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_L,_A,_B,_Y,_R,_I,_N,_T,_H,__,_Z,_O,_N,_E,__,__,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_S,_T,_A,_R,__,_L,_I,_G,_H,_T,__,_Z,_O,_N,_E,__,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_S,_C,_R,_A,_P,__,_B,_R,_A,_I,_N,__,_Z,_O,_N,_E,__,_S,_T,_A,_G,_E,__, 1
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 2
		DC.B	__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,_S,_T,_A,_G,_E,__, 3
		DC.B	_F,_I,_N,_A,_L,__,_Z,_O,_N,_E,__,__,__,__,__,__,__,__,__,__,__,__,__,__
		DC.B	_S,_P,_E,_C,_I,_A,_L,__,_S,_T,_A,_G,_E,__,__,__,__,__,__,__,__,__,__,__
		DC.B	_S,_O,_U,_N,_D,__,_S,_E,_L,_E,_C,_T,__,__,__,__,__,__,__,__,__,__,__,__