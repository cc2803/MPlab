.model small
.data
x dw 3
res dw 2 dup(0)
.code
    mov ax,@data
    mov ds,ax
    mov ax,x
    call Fact 
    
    mov ah,4ch
    int 21h

Fact proc near
    cmp ax,01
    ja cont
    mov res,01
     ret
    cont:
        push ax
        dec ax
        call fact
        pop ax
        mul res
        mov res,ax
        mov res+2,dx
        ret
Fact endp
end  

