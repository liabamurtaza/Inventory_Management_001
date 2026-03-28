@echo off
echo.
echo ============================================
echo   Building Inventory Management System
echo ============================================
echo.

REM ---- Adjust this path if your Irvine install differs ----
SET IRVINE=C:\Irvine
SET ML="%IRVINE%\ml.exe"
SET LINK="%IRVINE%\link.exe"
SET INCS=/I "%IRVINE%"
SET LIBS="%IRVINE%\Irvine32.lib" "%IRVINE%\kernel32.lib" "%IRVINE%\user32.lib"

IF NOT EXIST obj mkdir obj

echo [1/7] data.asm
%ML% /c /coff /Fo obj\data.obj %INCS% src\data.asm
IF ERRORLEVEL 1 GOTO ERR

echo [2/7] inventory.asm
%ML% /c /coff /Fo obj\inventory.obj %INCS% src\inventory.asm
IF ERRORLEVEL 1 GOTO ERR

echo [3/7] sales.asm
%ML% /c /coff /Fo obj\sales.obj %INCS% src\sales.asm
IF ERRORLEVEL 1 GOTO ERR

echo [4/7] menu.asm
%ML% /c /coff /Fo obj\menu.obj %INCS% src\menu.asm
IF ERRORLEVEL 1 GOTO ERR

echo [5/7] file.asm
%ML% /c /coff /Fo obj\file.obj %INCS% src\file.asm
IF ERRORLEVEL 1 GOTO ERR

echo [6/7] utils.asm
%ML% /c /coff /Fo obj\utils.obj %INCS% src\utils.asm
IF ERRORLEVEL 1 GOTO ERR

echo [7/7] main.asm
%ML% /c /coff /Fo obj\main.obj %INCS% src\main.asm
IF ERRORLEVEL 1 GOTO ERR

echo.
echo [LINK] Linking...
%LINK% /SUBSYSTEM:CONSOLE /OUT:main.exe ^
    obj\main.obj ^
    obj\menu.obj ^
    obj\inventory.obj ^
    obj\sales.obj ^
    obj\data.obj ^
    obj\file.obj ^
    obj\utils.obj ^
    %LIBS%
IF ERRORLEVEL 1 GOTO ERR

echo.
echo ============================================
echo   BUILD SUCCESSFUL  -^>  main.exe
echo ============================================
GOTO END

:ERR
echo.
echo [FAILED] See errors above.
EXIT /B 1

:END
