# 3% Completion

This is a disassembly of an arcade-exclusive version of Sonic the Hedgehog that runs on Mega Play hardware. 
> [!NOTE]
> Currently, this disassembly is not complete and does not compile the full ROM.

## Compiling
The compilation is intended to run on Windows devices. Run `build.bat`, and two versions will be output:
- `OUT/S1MP_COMBINED.BIN`, a combined ROM intended for use for more standard Mega Drive emulators. Do note, this version alone does not run on standard Mega Drive hardware.
- `OUT/MAME/ep15176.ic1` and `OUT/MAME/ep15176.ic2`, a split ROM intended for use with MAME. To use these, override the existing files in the `roms/mp_sonic` folder located in the root directory of where your MAME executable is.

## Playing a modified game
To run a modified version in MAME, run the game through Command Prompt using `mame mp_sonic`.
