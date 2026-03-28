;=====================================================
; inventory.asm
; Add Item Module for COAL Project
;=====================================================
INCLUDE Irvine32.inc

; IMPORT shared data
EXTERN itemCount:DWORD
EXTERN itemIDs:DWORD
EXTERN itemQty:DWORD
EXTERN itemPrice:DWORD
EXTERN itemNames:BYTE

EXTERN msgEnterID:BYTE
EXTERN msgEnterName:BYTE
EXTERN msgEnterQty:BYTE
EXTERN msgEnterPrice:BYTE
EXTERN msgAdded:BYTE
EXTERN msgFull:BYTE

.code

PUBLIC AddItem

AddItem PROC

    ; Check if inventory is full
    mov eax, itemCount
    cmp eax, 10
    jl ADD_CONTINUE

    mov edx, OFFSET msgFull
    call WriteString
    call Crlf
    ret

ADD_CONTINUE:
    mov esi, itemCount   ; current index

    ; ----- INPUT ID -----
    mov edx, OFFSET msgEnterID
    call WriteString
    call ReadInt
    mov itemIDs[esi*4], eax

    ; ----- INPUT NAME -----
    mov edx, OFFSET msgEnterName
    call WriteString

    ; Calculate buffer offset for 20-char name
    mov eax, esi
    mov ecx, 20
    mul ecx
    mov edx, OFFSET itemNames
    add edx, eax
    mov ecx, 20           ; buffer size
    call ReadString

    ; ----- INPUT QUANTITY -----
    mov edx, OFFSET msgEnterQty
    call WriteString
    call ReadInt
    mov itemQty[esi*4], eax

    ; ----- INPUT PRICE -----
    mov edx, OFFSET msgEnterPrice
    call WriteString
    call ReadInt
    mov itemPrice[esi*4], eax

    ; Increment item count
    inc itemCount

    ; Success message
    mov edx, OFFSET msgAdded
    call WriteString
    call Crlf

    ret

AddItem ENDP

END