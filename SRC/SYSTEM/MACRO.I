ALIGN	MACRO
		DCB.B (\1-(*%\1))%\1,0
		ENDM
		
SBZCYC	MACRO	D,	C,	P,	R
		DC.B	D,	C
		DC.W	P,	R
		ENDM
		
PAL		MACRO	P,	R,	C
		DC.L	P
		DC.W	R,	C
		ENDM