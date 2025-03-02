.model small
.data
    x dw 6
    y dw 3
    z dw 2 dup(0)
.code

    mov ax,@data
    mov ds,ax
    mov ax,x
    mov bx,ax
    mov dx,0

l1:
    push ax
    push dx
    div y
    cmp dx,0
    pop dx
    pop ax
    je result
    add ax,bx
    adc dx,0
    jmp l1

result:
    mov z,ax
    mov z+2,dx  
    
mov ah,4ch
int 21h
end