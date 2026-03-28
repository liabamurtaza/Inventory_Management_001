INCLUDE Irvine32.inc

PUBLIC itemCount, itemIDs, itemQty, itemPrice, itemNames
PUBLIC msgEnterID, msgEnterName, msgEnterQty, msgEnterPrice
PUBLIC msgAdded, msgFull

.data

MAX_ITEMS = 10

itemCount DWORD 0

itemIDs DWORD MAX_ITEMS DUP(0)
itemQty DWORD MAX_ITEMS DUP(0)
itemPrice DWORD MAX_ITEMS DUP(0)

; 2D array for names (10 items × 20 chars)
itemNames BYTE MAX_ITEMS * 20 DUP(0)

msgEnterID BYTE "Enter Item ID: ",0
msgEnterName BYTE "Enter Item Name: ",0
msgEnterQty BYTE "Enter Quantity: ",0
msgEnterPrice BYTE "Enter Price: ",0

msgAdded BYTE "Item Added Successfully!",0
msgFull BYTE "Inventory Full!",0

.code
END