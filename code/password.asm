.model small
.data
    cr equ 13
    lf equ 10
    pwd db 'hello'
    prompt db 'enter pwd:','$'
    entry db 0FFh,?,40 dup(?)
    msg db cr,lf,'THATS RIGHT!!!','$'
    nomsg db cr,lf,'NAH THIS AINT IT!!!','$'
    
.code
    mov ax,@data
    mov ds,ax
    mov es,ax
    mov cx,0eh
    
    lea dx,prompt      ;display the prompt
    mov ah,09h
    int 21h  
    
    lea dx,entry       ;get user input 
    mov ah,0ah
    int 21h
    
    lea si,pwd
    lea di,entry
    add di,02
    mov cx,5h
    
    repe cmpsb          ;pwd check
    je suc
    lea dx,nomsg        ;wrong password case
    mov ah,9
    int 21h
    
    jmp over
    
    suc:
        lea dx,msg      ;correct password case
        mov ah,9
        int 21h
        
    over:
        mov ah,4ch      ;program end
        int 21h
        end