.model small

.data
    str1 db '8765'
    str2 db '1234'
    size equ str2-str1-1
    sum db size+2 dup(0)
    diff db size+2 dup(0)

.code
    mov ax,@data
    mov ds,ax
    mov si,offset str1+size
    mov di,offset str2+size
    
    push si
    push di
    mov cx,size+1
    mov bx,offset sum
    mov bp,offset diff
    xor ah,ah
    
back1: 
    mov al,[si]
    adc al,[di]
    aaa
    mov [bx],al
    dec si
    dec di
    inc bx
    loop back1
    
    ;mov ah,00
    ;rcl ah,1
    mov [bx],ah
    pop di
    pop si
    mov cx,size+1
    xor ah,ah
    
back2:
    mov al,[si]
    sbb al,[di]
    aas
    mov [bp],al
    dec si
    dec di
    inc bp
    loop back2
    
    mov ah,4ch
    int 21h
    end      
   

