@echo off

IF EXIST S1MP.bin move /Y S1MP.bin S1MP.prev.bin >NUL
asm68k /k /p /o ae-,c+ S1MP.asm, S1MP.bin >errors.txt, , S1MP.lst