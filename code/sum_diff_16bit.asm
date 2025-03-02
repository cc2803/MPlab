.model small
.data
    n1 dw 8234h
    n2 dw 069A4h
    sum dw 2 dup(0)
    diff dw 2 dup(0)

.code
    mov ax,@data
    mov ds,ax
    mov ax,n1
    mov bx,n2
    mov dx,0h
    add ax,bx
    jnc l1
    inc dx

l1: 
    mov sum,ax
    mov sum+2,dx
    xor dx,dx
    mov ax,n1
    mov bx,n2
    sub ax,bx
    jnc l2
    mov dx,0ffh
l2:
    mov diff,ax
    mov diff+2,dx

mov ah,4ch
int 21h
end 