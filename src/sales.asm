INCLUDE Irvine32.inc

; ---- Imports from data.asm or inventory.asm ----
EXTERN itemCount  : DWORD
EXTERN itemQty    : DWORD

; ---- Exports ----
PUBLIC RecordSale

.data
msgSaleHeader BYTE "  ========================================",0Dh,0Ah,\
                   "     Record a Sale",0Dh,0Ah,\
                   "  ========================================",0Dh,0Ah,0

msgEnterID    BYTE "  Enter product ID: ",0
msgEnterSaleQty BYTE "  Enter quantity to sell: ",0
msgSaleSucc   BYTE "  [OK] Sale recorded successfully!",0Dh,0Ah,0
msgSaleErr    BYTE "  [!] Invalid product ID or insufficient qty!",0Dh,0Ah,0

.code

;=====================================================
; RecordSale
; Record and process a sale transaction.
;=====================================================
RecordSale:
    push eax
    push ebx
    push ecx
    push edx

    mov  edx, OFFSET msgSaleHeader
    call WriteString

    mov  edx, OFFSET msgEnterID
    call WriteString
    call ReadInt
    ; eax = product ID (placeholder for now)

    mov  edx, OFFSET msgEnterSaleQty
    call WriteString
    call ReadInt
    ; eax = quantity to sell (placeholder for now)

    ; For now, just print success message
    mov  edx, OFFSET msgSaleSucc
    call WriteString

    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    ret

END