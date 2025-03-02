;Word transfer with overlap
;
;.model small
;.data
; dst dw 2 dup(0)
; src dw 1122H,3344H,5566H, 7788H, 99AAH
; 
; 
;.code
;    mov ax,@data
;    mov ds,ax
;    lea si,src
;    lea di,dst
;    mov cx,05
;
;l1: mov ax,[si]
;    mov [di],ax
;    add si,2
;    add di,2
;    dec cx
;    jnz l1
;
;    mov ah,4ch
;    int 21h
;end

;Byte transfer with overlap, destination ending at 7th byte of source

;.model small
;.data
; dst db 3 dup(0)
; src db 11H,22H,33H,44H,55H,66H,77H,88H,99H,0AAH
; 
; 
;.code
;    mov ax,@data
;    mov ds,ax
;    lea si,src
;    lea di,dst
;    mov cx,10
;
;l1: mov al,[si]
;    mov [di],al
;    add si,1
;    add di,1
;    dec cx
;    jnz l1
;
;    mov ah,4ch
;    int 21h
;end   
;


;Byte transfer with overlap, destination starting at 7th byte of source

.model small
.data
 src db 11H,22H,33H,44H,55H,66H,77H,88H,99H,0AAH
 dst db 6 dup(0)
 
.code
    mov ax,@data
    mov ds,ax
    lea si,src+9
    lea di,src+15
    mov cx,10

l1: mov al,[si]
    mov [di],al
    sub si,1
    sub di,1
    dec cx
    jnz l1

    mov ah,4ch
    int 21h
end   
