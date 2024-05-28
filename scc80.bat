@echo off
if '%1'=='' goto usage
if '%1'=='-h' goto usage
if NOT EXIST bin\scc8080.exe goto nobldt
if NOT EXIST bin\tasm.exe goto nobldt
if NOT EXIST bin\tlink.exe goto nobldt
if NOT EXIST bin\exe2bin.exe goto nobldt
bin\scc8080 -a %1.c
if ERRORLEVEL 1 goto scce
bin\tasm /ibin /ml %1.s
if ERRORLEVEL 1 goto asme
bin\tlink /c/n/x bin\s0 %1,%1,,bin\scc8080 bin\scc80spc
if ERRORLEVEL 1 goto lnke
if EXIST %1.bin del %1.bin
bin\exe2bin %1.exe %1.bin
if ERRORLEVEL 1 goto bine
if NOT EXIST %1.bin goto bine
del %1.obj
del %1.exe
echo.
echo Done. Compile %1 is successful
echo.
goto exit
:scce
echo.
echo Error when compile %1
echo.
goto exit
:asme
echo.
echo Error when assemble %1
echo.
goto exit
:lnke
echo.
echo Error when link %1
echo.
goto exit
:bine
echo.
echo Error when creating %1.bin
echo.
goto exit
:nobldt
echo ERROR: Build tools not found or incomplete
echo Check presence for scc8080, tasm, tlink and exe2bin
goto exit
:usage
echo Build Small-C source file
echo Usage: %0 source
echo File name must not have extension
:exit