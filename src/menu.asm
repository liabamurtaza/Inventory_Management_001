;=====================================================
; menu.asm
; Main menu — 6 options
;=====================================================
INCLUDE Irvine32.inc

EXTERN AddItem    : NEAR
EXTERN ViewItems  : NEAR
EXTERN RecordSale : NEAR
EXTERN UpdateItem : NEAR
EXTERN DeleteItem : NEAR

PUBLIC showMenu

.data
menuTitle   BYTE 0Dh,0Ah,\
                 "  ========================================",0Dh,0Ah,\
                 "     Inventory Management System          ",0Dh,0Ah,\
                 "  ========================================",0Dh,0Ah,0

menuOptions BYTE "  1. Add Product",0Dh,0Ah,\
                 "  2. View Products",0Dh,0Ah,\
                 "  3. Record a Sale",0Dh,0Ah,\
                 "  4. Update Product",0Dh,0Ah,\
                 "  5. Delete Product",0Dh,0Ah,\
                 "  6. Exit",0Dh,0Ah,\
                 "  Your choice: ",0

invalidMsg  BYTE 0Dh,0Ah,"  [!] Invalid choice. Enter 1-6.",0Dh,0Ah,0

.code

;-----------------------------------------------------
; showMenu
; Returns eax=1 to signal exit, eax=0 to keep looping.
;-----------------------------------------------------
showMenu PROC

    push ebx
    push ecx
    push edx

    mov  edx, OFFSET menuTitle
    call WriteString

    mov  edx, OFFSET menuOptions
    call WriteString

    call ReadInt

    cmp  eax, 1
    je   SM_Add
    cmp  eax, 2
    je   SM_View
    cmp  eax, 3
    je   SM_Sale
    cmp  eax, 4
    je   SM_Update
    cmp  eax, 5
    je   SM_Delete
    cmp  eax, 6
    je   SM_Exit

    mov  edx, OFFSET invalidMsg
    call WriteString
    xor  eax, eax
    jmp  SM_Done

SM_Add:
    call AddItem
    xor  eax, eax
    jmp  SM_Done

SM_View:
    call ViewItems
    xor  eax, eax
    jmp  SM_Done

SM_Sale:
    call RecordSale
    xor  eax, eax
    jmp  SM_Done

SM_Update:
    call UpdateItem
    xor  eax, eax
    jmp  SM_Done

SM_Delete:
    call DeleteItem
    xor  eax, eax
    jmp  SM_Done

SM_Exit:
    mov  eax, 1

SM_Done:
    pop  edx
    pop  ecx
    pop  ebx
    ret

showMenu ENDP

END
