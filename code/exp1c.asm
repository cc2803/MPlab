.model small
.data            
src dw 1111h,2222h,3333h,4444h,5555h
dst dw 6666h,7777h,8888h,9999h,0AAAAh
 
.code
    mov ax,@data
    mov ds,ax
    lea si,src
    lea di,dst
    mov cx,05

l1: mov ax,[si] 
    xchg ax,[di]
    mov [si],ax
    ;mov [di],ax
    ;mov [si],bx 
    add si,2
    add di,2
    loop l1

    mov ah,4ch
    int 21h
end