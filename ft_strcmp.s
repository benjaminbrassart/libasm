global ft_strcmp

;
; int ft_strcmp(char const* s1, char const* s2)
;
; s1 = rdi
; s2 = rsi
; return = rax
;
ft_strcmp:
    mov al, byte [rdi]          ; tmp = *s1
    cmp al, byte [rsi]          ; tmp == *s2
    jne .end                    ; return
    cmp byte [rdi], 0           ; *s1 == '\0'
    je .end
    inc rdi                     ; ++s1
    inc rsi                     ; ++s2
    jmp ft_strcmp               ; loop again

.end:
    movzx rax, byte [rdi]
    movzx rdi, byte [rsi]
    sub rax, rdi
    ret

; movzx allows copying smaller values into bigger registers
; and fills the bigger bits with zeros
;
; https://www.felixcloutier.com/x86/movzx
; https://www.gladir.com/LEXIQUE/ASM/movzx.htm
