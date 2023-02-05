global ft_list_size

;
; int ft_list_size(t_list *begin)
;
; begin = rdi
; return = rax
;
ft_list_size:
    mov rax, 0                  ; initialize return value to 0

    cmp rdi, 0                  ; begin == NULL
    je .end

    inc rax                     ; increment return value

    mov rdi, [rdi + 8]          ; begin = begin->next
    jmp ft_list_size

.end:
    ret
