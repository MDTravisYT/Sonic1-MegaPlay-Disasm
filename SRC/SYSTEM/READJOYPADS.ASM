READJOYPADS:
		LEA	(V_JPADHOLD1).W,	A0
		LEA	($A10003).L,	A1
		BSR.S	READJOYPADS_READ
		ADDQ.W	#2,	A1