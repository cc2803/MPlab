.model small
.data
    x dw 500
    y dw 75
    z dw 2 dup(0)
.code

    mov ax,@data
    mov ds,ax
    mov ax,x
    mov bx,y
    cmp ax,bx
    jae l1
l2: xchg ax,bx

l1:
    mov dx,0
    div bx
    cmp dx,0
    mov ax,dx
    jnz l2
    mov z,bx

mov ah,4ch
int 21h
end