;.model small
;.data
;mpd dw 0C432h,765Bh
;mpr dw 3679h,0B397h
;res dw 4 dup(0)
;.code
;mov ax,@data
;mov ds,ax
;mov word ptr bx,offset mpd
;mov ax,[bx]
;mul mpr
;mov res,ax
;mov res+2,dx
;
;mov ax,[bx]
;mul mpr+2
;add res+2,ax
;adc res+4,dx
;jnc l1
;inc res+6
;
;l1:
;mov ax,[bx+2]
;mul mpr+2
;add res+2,ax
;adc res+4,dx
;jnc l2
;inc res+6
;
;l2:
;mov ax,[bx+2]
;mul mpr+2
;add res+4,ax
;adc res+6,dx
;mov ah,4ch
;int 21h
;end
;  


.model small
.stack 100h
.data
mpr dw 0C432h,765Bh
mpd dw 3679h,0B397h
res dw 4 dup(0)
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Load the address of mpd into bx
    mov bx, offset mpd
    
    ; Multiply the lower words of mpd and mpr
    mov ax, [bx]          ; ax = lower word of mpd
    mul word ptr mpr      ; dx:ax = ax * mpr
    mov word ptr res, ax  ; Store lower word of result in res
    mov word ptr res+2, dx; Store upper word of result in res+2

    ; Multiply the lower word of mpd with the upper word of mpr
    mov ax, [bx]          ; ax = lower word of mpd
    mul word ptr mpr+2    ; dx:ax = ax * mpr+2
    add word ptr res+2, ax; Add to res+2
    adc word ptr res+4, dx; Add with carry to res+4

    ; Multiply the upper word of mpd with the lower word of mpr
    mov ax, [bx+2]        ; ax = upper word of mpd
    mul word ptr mpr      ; dx:ax = ax * mpr
    add word ptr res+2, ax; Add to res+2
    adc word ptr res+4, dx; Add with carry to res+4

    ; Multiply the upper words of mpd and mpr
    mov ax, [bx+2]        ; ax = upper word of mpd
    mul word ptr mpr+2    ; dx:ax = ax * mpr+2
    add word ptr res+4, ax; Add to res+4
    adc word ptr res+6, dx; Add with carry to res+6

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp
end main
