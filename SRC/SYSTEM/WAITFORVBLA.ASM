WAITFORVBLA:
		MOVE	#$2300,	SR
		
	WFVB_WAIT:
		TST.B	(V_VBLA_ROUTINE).W
		BNE.S	WFVB_WAIT
		RTS