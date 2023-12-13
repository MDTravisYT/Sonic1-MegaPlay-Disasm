;	After compiling, append data to 0x2003 in the "ep15175-01.ic3" ROM.
;	DO NOT change the ROM size!!

ARROW	=	$7F
NEWLINE	=	$FE
TAB		=	$FC
ENDTXT	=	$FF

	DC.B	TAB,1," TAKE CONTROL",NEWLINE
	DC.B	NEWLINE
	DC.B	" RIGHT  MOVE SONIC",NEWLINE
	DC.B	"  or    HOLD IN EITHER DIRECTION",NEWLINE
	DC.B	" LEFT   TO SPEED UP",NEWLINE
	DC.B	NEWLINE
	DC.B	NEWLINE
	DC.B	" DOWN   WHEN SONIC'S MOVING.",NEWLINE
	DC.B	TAB,9," ",ARROW,"THE SUPER SONIC SPIN",NEWLINE
	DC.B	TAB,10," ATTACK.",NEWLINE
	DC.B	NEWLINE
	DC.B	TAB,8," WHEN SONIC'S STILL.",NEWLINE
	DC.B	TAB,9," ",ARROW,"SQUAT DOWN.",NEWLINE
	DC.B	NEWLINE
	DC.B	NEWLINE
	DC.B	" BUTTON JUMP WHILE PERFORMING",NEWLINE
	DC.B	TAB,8," THE SUPER SONIC SPIN",NEWLINE
	DC.B	TAB,8," ATTACK.",ENDTXT
	
;	Above is the standard descrition you see with Sonic the Hedgehog.