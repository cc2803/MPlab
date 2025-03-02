.model small
.stack 100h
.data
    original db 'madam', 0  ; Input string
    reversed db 6 dup(?)    ; Buffer for reversed string
    palindrome_msg db 'The string is a palindrome.$'
    not_palindrome_msg db 'The string is not a palindrome.$'

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Initialize source and destination pointers
    lea si, original
    lea di, reversed

    ; Find the length of the string
    mov cx, 0               ; Counter for string length
find_len:
    cmp byte ptr [si+cx], 0 ; Check for null terminator
    je reverse_string       ; If null terminator, end of string
    inc cx
    jmp find_len

reverse_string:
    dec cx                  ; Adjust counter to point to the last character
    mov bx, cx              ; Save the length of the string in bx
    mov si, original        ; Reset source pointer

reverse_loop:
    mov al, [si+cx]         ; Load character from end of original string
    mov [di], al            ; Store character in reversed string
    inc di                  ; Move to the next character in reversed string
    dec cx                  ; Move to the previous character in original string
    jns reverse_loop        ; Continue until cx becomes negative
    mov byte ptr [di], 0    ; Null terminate the reversed string

    ; Reset pointers for comparison
    lea si, original
    lea di, reversed

    ; Compare original and reversed strings
    mov cx, bx              ; Load string length into cx
compare_loop:
    mov al, [si]            ; Load character from original string
    mov ah, [di]            ; Load character from reversed string
    cmp al, ah              ; Compare characters
    jne not_palindrome      ; If not equal, it is not a palindrome
    inc si
    inc di
    loop compare_loop       ; Repeat for all characters

    ; If loop completes, it is a palindrome
    lea dx, palindrome_msg
    jmp display_message

not_palindrome:
    lea dx, not_palindrome_msg

display_message:
    mov ah, 09h             ; DOS function to display string
    int 21h

    ; Terminate program
    mov ah, 4Ch             ; DOS function to exit program
    int 21h
main endp
end main