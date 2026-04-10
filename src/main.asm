INCLUDE Irvine32.inc

; Match prototype (CRITICAL)
showMenu PROTO
EXTERN LoadData : NEAR
EXTERN SaveData : NEAR

.data
msgGoodbye BYTE 0Dh,0Ah,\
    "  ========================================",0Dh,0Ah,\
    "     Thank you for using IMS. Goodbye!   ",0Dh,0Ah,\
    "  ========================================",0Dh,0Ah,0
    
.code
main PROC
    call LoadData
mainLoop:
    call showMenu
    cmp  eax, 1
    je   mainExit
    jmp  mainLoop

mainExit:
    call SaveData
    mov  edx, OFFSET msgGoodbye
    call WriteString
    call Crlf
    exit

main ENDP

END main