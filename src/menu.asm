INCLUDE Irvine32.inc

; Declare prototype (CRITICAL FIX)
showMenu PROTO
AddItem PROTO

.data
menuTitle BYTE "===== Inventory Management System =====",0dh,0ah,0
menuOptions BYTE \
"1. Add Product",0dh,0ah,\
"2. View Products",0dh,0ah,\
"3. Sales",0dh,0ah,\
"4. Exit",0dh,0ah,\
"Enter your choice: ",0

invalidMsg BYTE "Invalid choice!",0dh,0ah,0

.code
PUBLIC showMenu

showMenu PROC

    mov edx, OFFSET menuTitle
    call WriteString

    mov edx, OFFSET menuOptions
    call WriteString

    call ReadInt

    cmp eax, 1
    je option1

    cmp eax, 2
    je option2

    cmp eax, 3
    je option3

    cmp eax, 4
    je exitProgram

    mov edx, OFFSET invalidMsg
    call WriteString
    ret

option1:
    call AddItem
    ret

option2:
    ret

option3:
    ret

exitProgram:
    exit

showMenu ENDP

END