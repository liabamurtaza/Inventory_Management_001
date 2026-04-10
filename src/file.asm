;=====================================================
; file.asm
; SaveData / LoadData using Win32 API directly
;=====================================================
INCLUDE Irvine32.inc

EXTERN itemCount  : DWORD
EXTERN itemIDs    : DWORD
EXTERN itemQty    : DWORD
EXTERN itemPrice  : DWORD
EXTERN itemNames  : BYTE

EXTERN msgSaveOK    : BYTE
EXTERN msgSaveErr   : BYTE
EXTERN msgLoadOK    : BYTE
EXTERN msgLoadErr   : BYTE
EXTERN inventoryFile: BYTE

PUBLIC SaveData, LoadData

MAX_ITEMS = 10
NAME_LEN  = 20

; Win32 constants
GENERIC_READ       = 80000000h
GENERIC_WRITE      = 40000000h
CREATE_ALWAYS      = 2
OPEN_EXISTING      = 3
FILE_ATTRIBUTE_NORMAL = 80h
INVALID_HANDLE     = 0FFFFFFFFh

.data
bytesWritten DWORD 0
bytesRead    DWORD 0

.code

;=====================================================
; SaveData
;=====================================================
SaveData:
    push eax
    push ebx
    push ecx
    push edx

    ; Create/overwrite inventory.dat
    INVOKE CreateFileA, \
        ADDR inventoryFile, \
        GENERIC_WRITE, \
        0, 0, \
        CREATE_ALWAYS, \
        FILE_ATTRIBUTE_NORMAL, \
        0
    cmp  eax, INVALID_HANDLE
    je   SD_Error
    mov  ebx, eax           ; ebx = file handle

    ; Write itemCount
    INVOKE WriteFile, ebx, ADDR itemCount, 4, ADDR bytesWritten, 0

    ; Write itemIDs
    INVOKE WriteFile, ebx, ADDR itemIDs, MAX_ITEMS*4, ADDR bytesWritten, 0

    ; Write itemQty
    INVOKE WriteFile, ebx, ADDR itemQty, MAX_ITEMS*4, ADDR bytesWritten, 0

    ; Write itemPrice
    INVOKE WriteFile, ebx, ADDR itemPrice, MAX_ITEMS*4, ADDR bytesWritten, 0

    ; Write itemNames
    INVOKE WriteFile, ebx, ADDR itemNames, MAX_ITEMS*NAME_LEN, ADDR bytesWritten, 0

    INVOKE CloseHandle, ebx

    mov  edx, OFFSET msgSaveOK
    call WriteString
    jmp  SD_Done

SD_Error:
    mov  edx, OFFSET msgSaveErr
    call WriteString

SD_Done:
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    ret

;=====================================================
; LoadData
;=====================================================
LoadData:
    push eax
    push ebx
    push ecx
    push edx

    ; Open existing inventory.dat
    INVOKE CreateFileA, \
        ADDR inventoryFile, \
        GENERIC_READ, \
        0, 0, \
        OPEN_EXISTING, \
        FILE_ATTRIBUTE_NORMAL, \
        0
    cmp  eax, INVALID_HANDLE
    je   LD_Error
    mov  ebx, eax           ; ebx = file handle

    ; Read itemCount
    INVOKE ReadFile, ebx, ADDR itemCount, 4, ADDR bytesRead, 0

    ; Read itemIDs
    INVOKE ReadFile, ebx, ADDR itemIDs, MAX_ITEMS*4, ADDR bytesRead, 0

    ; Read itemQty
    INVOKE ReadFile, ebx, ADDR itemQty, MAX_ITEMS*4, ADDR bytesRead, 0

    ; Read itemPrice
    INVOKE ReadFile, ebx, ADDR itemPrice, MAX_ITEMS*4, ADDR bytesRead, 0

    ; Read itemNames
    INVOKE ReadFile, ebx, ADDR itemNames, MAX_ITEMS*NAME_LEN, ADDR bytesRead, 0

    INVOKE CloseHandle, ebx

    mov  edx, OFFSET msgLoadOK
    call WriteString
    jmp  LD_Done

LD_Error:
    mov  edx, OFFSET msgLoadErr
    call WriteString

LD_Done:
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    ret

END