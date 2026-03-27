INCLUDE Irvine32.inc

; Match prototype (CRITICAL)
showMenu PROTO

.code
main PROC

mainLoop:
    call showMenu
    call Crlf
    jmp mainLoop

main ENDP

END main