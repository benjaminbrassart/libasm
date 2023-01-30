global ft_strlen

;
; size_t ft_strlen(char const* str)
;
; str = rdi
; return = rax
;
ft_strlen:
    mov rax, 0                  ; n = 0
    jmp .loop

.loop:
    cmp byte [rdi + rax], 0     ; str[n] == 0
    je .end                     ; true => return
    inc rax                     ; ++n
    jmp .loop                   ; do another iteration

.end:
    ret                         ; return value
