@echo off

echo Assembling...

ml /c /coff /I "C:\Masm615\INCLUDE" src\main.asm
ml /c /coff /I "C:\Masm615\INCLUDE" src\menu.asm
ml /c /coff /I "C:\Masm615\INCLUDE" src\product.asm

echo Linking...

@REM link main.obj menu.obj product.obj Irvine32.lib /LIBPATH:"C:\Masm615\LIB"
@REM link main.obj menu.obj product.obj Irvine32.lib /LIBPATH:"C:\Masm615\LIB" /SUBSYSTEM:CONSOLE
@REM link main.obj menu.obj product.obj Irvine32.lib kernel32.lib user32.lib /LIBPATH:"C:\Masm615\LIB" /SUBSYSTEM:CONSOLE
link /SUBSYSTEM:CONSOLE main.obj menu.obj product.obj Irvine32.lib kernel32.lib user32.lib /LIBPATH:"C:\Masm615\LIB" /OUT:main.exe
echo.
echo Build Done!
pause
