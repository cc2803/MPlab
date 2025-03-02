.model small
.data
    num db 03Ah
    n_0s db 08h
    n_1s db 00h 


.code
    mov ax,@data
    mov ds,ax
    lea si,num
    mov ax,[si]
    mov cx,08h
l1:
    rcl al,1
    jnc l2
    inc n_1s
    dec n_0s

l2: 
    loop l1
    
mov ah,4ch
int 21h
end 

