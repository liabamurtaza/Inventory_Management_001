@echo off

echo Assembling...

"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\data.asm
"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\main.asm
"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\menu.asm
"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\inventory.asm
"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\product.asm
"C:\Masm615\BIN\ml.exe" /c /coff /I "C:\Masm615\INCLUDE" src\sales.asm

echo Linking...

"C:\Masm615\BIN\LINK.EXE" /SUBSYSTEM:CONSOLE data.obj main.obj menu.obj inventory.obj product.obj sales.obj Irvine32.lib kernel32.lib user32.lib /LIBPATH:"C:\Masm615\LIB" /OUT:main.exe
echo.
echo Build Done!
pause
