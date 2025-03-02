.model small  
.data
    x dw 1023h,8231h,0A003h,2201h
    y dw 903h,6751h,0065h,0A23h
    z dw 5 dup(0)
.code
    mov ax,@data
    mov ds,ax
    lea si,x
    lea di,y
    lea bx,z
    mov cx,08h
    clc
l1:
    mov al,[si]
    adc al,[di]
    mov [bx],al
    inc di
    inc si
    inc bx
    loop l1
    xor al,al
    rcl al,01
    mov [bx],al       
    
mov ah,4ch
int 21h
end
