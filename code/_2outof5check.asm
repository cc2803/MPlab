.model small
.data
    num db 03h
    res db 2(0)
    count db 0

.code
    mov ax,@data
    mov ds,ax
    lea si,num
    lea di,res
    mov ax,[si]
    mov bx,ax
    test al,0e0h
    jnz n205
    mov cx,05

l1:
    ror al,1
    jnc l2
    inc count
l2:
    loop l1
    cmp count,02
    jz l3
n205: 
    mov [di],0FFh
    jmp stop
l3: mov [di],00h
stop:
    mov ah,4ch
    int 21h
    end
