@echo off

IF EXIST S1MP.BIN move /Y S1MP.BIN S1MP.BIN.LAST >NUL
asm68k /k /p /o ae-,c+ S1MP.ASM, S1MP.BIN >S1MP.LOG, , S1MP.LST