INCLUDE Irvine32.inc

.data

MAX_PRODUCTS = 50
NAME_SIZE = 20

productNames BYTE MAX_PRODUCTS DUP(NAME_SIZE DUP(0))
productPrices DWORD MAX_PRODUCTS DUP(0)
productQty DWORD MAX_PRODUCTS DUP(0)

productCount DWORD 0

msgEnterName BYTE "Enter product name: ",0
msgEnterPrice BYTE "Enter price: ",0
msgEnterQty BYTE "Enter quantity: ",0

msgAdded BYTE "Product added successfully!",0dh,0ah,0
msgNoProducts BYTE "No products available!",0dh,0ah,0

.code
PUBLIC addProduct, displayProducts

addProduct PROC
    ret
addProduct ENDP

displayProducts PROC
    ret
displayProducts ENDP

END