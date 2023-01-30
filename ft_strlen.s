global ft_strlen

ft_strlen:
    mov rax, 0                  ; n = 0
    jmp _loop

_loop:
    cmp byte [rdi + rax], 0     ; str[n] == 0
    je _end                     ; true => return
    inc rax                     ; ++n
    jmp _loop                   ; do another iteration

_end:
    ret                         ; return value
