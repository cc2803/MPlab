;HEX to BCD convertor

.model small
.data
    hexval dw 0A864h
    bcd db 5 dup(0)
    div1 dw 2710h
    div2 dw 3e8h
    div3 dw 64h
    div4 db 0ah
    MSG db "Equivalent BCD number is:$"
    crlf db 0dh,0ah,'$'
    
.code
    mov ax,@data
    mov ds,ax
    mov ax,hexval
    xor dx,dx
    
    div div1
    mov bcd,al
    mov ax,dx
    xor dx,dx
    
    div div2
    mov bcd+1,al
    mov ax,dx
    xor dx,dx
    
    div div3
    mov bcd+2,al
    mov ax,dx
    xor dx,dx
    
    div div4
    mov bcd+3,al
    mov al,ah
    xor ah,ah
    mov bcd+4,al
 
mov ah,4ch
int 21h
end    