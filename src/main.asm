INCLUDE Irvine32.inc

EXTERN showMenu:PROC

.code
main PROC

mainLoop:
    call showMenu
    jmp mainLoop

    exit
main ENDP

END main