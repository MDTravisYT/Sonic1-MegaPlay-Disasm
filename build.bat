IF NOT EXIST OUT MKDIR OUT
cd OUT
IF NOT EXIST MAME MKDIR MAME
cd ..
asm68k /k /p /o ae-,c+ SRC/MAIN.ASM, OUT/S1MP_COMBINED.BIN >OUT/S1MP_COMBINED.LOG, OUT/S1MP_COMBINED.SYM, OUT/S1MP_COMBINED.LST
romwak /b OUT/S1MP_COMBINED.BIN OUT/MAME/ep15177.ic2 OUT/MAME/ep15176.ic1