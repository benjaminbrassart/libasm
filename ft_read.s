global ft_read

extern set_errno

;
; int ft_read(int fd, void* buffer, size_t len)
;
; fd = rdi
; buffer = rsi
; len = rdx
; return = rax
;
ft_read:
    push rdi                    ; save rdi

    mov rdi, 0                  ; set_errno(0)
    call set_errno

    mov rax, 0                  ; sys_read

    pop rdi
    mov rsi, rsi                ; useless, just to be clear on what
    mov rdx, rdx                ; registers we are using

    syscall                     ; call sys_read with given parameters

    cmp rax, 0                  ; res < 0
    jl .error                   ; set errno to -rax

    ret

.error:
    mov rdi, rax
    neg rdi                     ; rax = -rax
    call set_errno              ; set_errno(rax)
    mov rax, -1                 ; return value = -1

    ret

; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
