;=====================================================
; data.asm
; Shared global data — Inventory Management System
;=====================================================
INCLUDE Irvine32.inc

; ---- Core arrays ----
PUBLIC itemCount, itemIDs, itemQty, itemPrice, itemNames

; ---- AddItem strings ----
PUBLIC msgEnterID, msgEnterName, msgEnterQty, msgEnterPrice
PUBLIC msgAdded, msgFull, msgDupID, msgBadInput

; ---- ViewItems strings ----
PUBLIC msgViewHeader, msgViewSep, msgViewEmpty
PUBLIC msgViewRow1, msgViewRow2

; ---- UpdateItem strings ----
PUBLIC msgUpdHeader, msgUpdEnterID, msgUpdNotFound
PUBLIC msgUpdNewName, msgUpdNewQty, msgUpdNewPrice, msgUpdOK

; ---- DeleteItem strings ----
PUBLIC msgDelHeader, msgDelEnterID, msgDelNotFound
PUBLIC msgDelConfirm, msgDelOK, msgDelCancel

; ---- Sales strings ----
PUBLIC msgSaleHeader, msgSaleEnterID, msgSaleEnterQty
PUBLIC msgSaleNotFound, msgSaleNoStock, msgSaleOK, msgSaleTotal

; ---- File strings ----
PUBLIC msgSaveOK, msgSaveErr, msgLoadOK, msgLoadErr, inventoryFile

.data

MAX_ITEMS = 10
NAME_LEN  = 20

itemCount DWORD 0

itemIDs   DWORD MAX_ITEMS DUP(0)
itemQty   DWORD MAX_ITEMS DUP(0)
itemPrice DWORD MAX_ITEMS DUP(0)

; 2D name buffer: 10 items x 20 chars each
itemNames BYTE MAX_ITEMS * NAME_LEN DUP(0)

; ---- AddItem ----
msgEnterID    BYTE 0Dh,0Ah,"  Enter Item ID    : ",0
msgEnterName  BYTE "  Enter Item Name  : ",0
msgEnterQty   BYTE "  Enter Quantity   : ",0
msgEnterPrice BYTE "  Enter Price (Rs) : ",0
msgAdded      BYTE 0Dh,0Ah,"  [OK] Item added successfully!",0Dh,0Ah,0
msgFull       BYTE 0Dh,0Ah,"  [!] Inventory full (max 10 items).",0Dh,0Ah,0
msgDupID      BYTE 0Dh,0Ah,"  [!] That ID already exists. Use Update to edit.",0Dh,0Ah,0
msgBadInput   BYTE 0Dh,0Ah,"  [!] ID must be greater than 0.",0Dh,0Ah,0

; ---- ViewItems ----
; Columns:  ID=6  Name=20  Qty=8  Price=8
msgViewHeader BYTE 0Dh,0Ah,\
    "  +--------+----------------------+----------+----------+",0Dh,0Ah,\
    "  |  ID    |  Name                |  Qty     |  Price   |",0Dh,0Ah,\
    "  +--------+----------------------+----------+----------+",0Dh,0Ah,0
msgViewSep    BYTE \
    "  +--------+----------------------+----------+----------+",0Dh,0Ah,0
msgViewEmpty  BYTE 0Dh,0Ah,"  [!] No items in inventory.",0Dh,0Ah,0
msgViewRow1   BYTE "  | ",0
msgViewRow2   BYTE " | ",0

; ---- UpdateItem ----
msgUpdHeader   BYTE 0Dh,0Ah,"===== Update Product =====",0Dh,0Ah,0
msgUpdEnterID  BYTE "  Enter Item ID to update : ",0
msgUpdNotFound BYTE 0Dh,0Ah,"  [!] Item ID not found.",0Dh,0Ah,0
msgUpdNewName  BYTE "  New Name  : ",0
msgUpdNewQty   BYTE "  New Qty   : ",0
msgUpdNewPrice BYTE "  New Price : ",0
msgUpdOK       BYTE 0Dh,0Ah,"  [OK] Item updated successfully!",0Dh,0Ah,0

; ---- DeleteItem ----
msgDelHeader   BYTE 0Dh,0Ah,"===== Delete Product =====",0Dh,0Ah,0
msgDelEnterID  BYTE "  Enter Item ID to delete : ",0
msgDelNotFound BYTE 0Dh,0Ah,"  [!] Item ID not found.",0Dh,0Ah,0
msgDelConfirm  BYTE "  Confirm delete? (1=Yes / 0=No) : ",0
msgDelOK       BYTE 0Dh,0Ah,"  [OK] Item deleted.",0Dh,0Ah,0
msgDelCancel   BYTE 0Dh,0Ah,"  Cancelled.",0Dh,0Ah,0

; ---- Sales ----
msgSaleHeader   BYTE 0Dh,0Ah,"===== Record a Sale =====",0Dh,0Ah,0
msgSaleEnterID  BYTE "  Enter Item ID to sell : ",0
msgSaleEnterQty BYTE "  Quantity to sell      : ",0
msgSaleNotFound BYTE 0Dh,0Ah,"  [!] Item ID not found.",0Dh,0Ah,0
msgSaleNoStock  BYTE 0Dh,0Ah,"  [!] Not enough stock.",0Dh,0Ah,0
msgSaleOK       BYTE 0Dh,0Ah,"  [OK] Sale recorded. Stock updated.",0Dh,0Ah,0
msgSaleTotal    BYTE "  Total Sale Value (Rs): ",0

; ---- File handling ----
inventoryFile  BYTE "inventory.dat",0
msgSaveOK      BYTE 0Dh,0Ah,"  [OK] Data saved to inventory.dat",0Dh,0Ah,0
msgSaveErr     BYTE 0Dh,0Ah,"  [!] Error saving data.",0Dh,0Ah,0
msgLoadOK      BYTE 0Dh,0Ah,"  [OK] Inventory loaded from file.",0Dh,0Ah,0
msgLoadErr     BYTE 0Dh,0Ah,"  [!] No saved data found. Starting fresh.",0Dh,0Ah,0

.code
END
