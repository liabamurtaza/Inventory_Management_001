@echo off
echo.
echo ============================================
echo   Building Inventory Management System
echo ============================================
echo.
SET ML=
SET PATH=C:\Masm615;%PATH%
SET INCLUDE=C:\Masm615\INCLUDE
SET LIB=C:\Masm615\LIB
SET VSLINK=C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.41.34120\bin\Hostx86\x86\link.exe
IF NOT EXIST obj mkdir obj
echo [1/7] data.asm
ML -c -coff /Fo obj\data.obj src\data.asm
IF ERRORLEVEL 1 GOTO ERR
echo [2/7] inventory.asm
ML -c -coff /Fo obj\inventory.obj src\inventory.asm
IF ERRORLEVEL 1 GOTO ERR
echo [3/7] sales.asm
ML -c -coff /Fo obj\sales.obj src\sales.asm
IF ERRORLEVEL 1 GOTO ERR
echo [4/7] menu.asm
ML -c -coff /Fo obj\menu.obj src\menu.asm
IF ERRORLEVEL 1 GOTO ERR
echo [5/7] file.asm
ML -c -coff /Fo obj\file.obj src\file.asm
IF ERRORLEVEL 1 GOTO ERR
echo [6/7] utils.asm
ML -c -coff /Fo obj\utils.obj src\utils.asm
IF ERRORLEVEL 1 GOTO ERR
echo [7/7] main.asm
ML -c -coff /Fo obj\main.obj src\main.asm
IF ERRORLEVEL 1 GOTO ERR
echo.
echo [LINK] Linking...
if exist main.exe del main.exe
call vslink.bat
IF ERRORLEVEL 1 GOTO ERR
echo.
echo ============================================
echo   BUILD SUCCESSFUL
echo ============================================
GOTO END
:ERR
echo [FAILED] See errors above.
EXIT /B 1
:END
pause
