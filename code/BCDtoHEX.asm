;BCD to HEX convertor

.model small
.data
    bcdval db 85h,97h; bcdval=6745
    hexres dw 0
    factors db 0ah,64h,0e8h,3h
    nb_sep db 10h
    
.code
    mov ax,@data
    mov ds,ax
    lea si,bcdval
    lea di,hexres
    call BCD_HEX
    mov ah,4ch
    int 21h
    
BCD_HEX proc near
    mov ax,word ptr [si]
    or ah,00 ;to check excess bits in input to avoid extra steps
    
    jz byte_conv
    
    mov bl,al
    mov al,ah
    mov ah,0
    div nb_sep ; seperates bits in al (1st half of the bcd number)
    mov ch,ah
    mov ah,0
    mul word ptr factors+2
    mov word ptr hexres,ax
    mov al,ch
    mul factors+1
    add hexres,ax
    mov al,bl
    mov ah,0
    
    byte_conv:
        div nb_sep
        mov dl,ah
        mov ah,0
        mul factors
        add ax,dx
        add hexres,ax
        ret
    
    BCD_HEX ENDP
end

  

       