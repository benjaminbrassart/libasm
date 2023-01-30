global ft_strcpy

;
; char* ft_strcpy(char* dst, char const* src)
;
; dst = rdi
; src = rsi
; return = rax
;
ft_strcpy:
    push rdi            ; save `dst` to the stack so we can return it later
    jmp _loop

_loop:
    mov rax, [rsi]      ; tmp = *src
    mov [rdi], rax      ; *dst = tmp

    cmp byte [rsi], 0   ; *src == 0
    je _end

    inc rdi             ; ++dst
    inc rsi             ; ++src

    jmp _loop

_end:
    pop rax             ; get `dst` back from the stack and put it in the return value
    ret
