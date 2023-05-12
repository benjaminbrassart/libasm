global ft_atoi_base

;
; size_t ft_strlen(char const* str)
;
; str = rdi
; return = rax
;
extern ft_strlen

;
; int ft_atoi_base(char* str, char* base)
;
; str = rdi
; base = rsi
; return = rax
;
ft_atoi_base:
    jmp .check_base_len

.check_base_len:
    call ft_strlen
    cmp rax, 2
    jl .error

    ; save base for later
    push rsi
    jmp .check_base_chars

.check_base_chars:
    ; if *base == '\0', base characters are ok. now check duplicated characters
    cmp byte [rsi], 0x00
    je .check_dup_chars

    ; *base <= ' ' -> error
    cmp byte [rsi], 0x20
    jle .error
    ; *base == 0x7f (DEL) -> error
    cmp byte [rsi], 0x7f
    je .error

    ; check next character in base
    inc rsi
    jmp .check_base_chars

.check_dup_chars:
    ; restore base
    pop rsi
    jmp .check_dup_chars_loop

.check_dup_chars_loop:
    ; if *base == '\0', goto atoi_base
    cmp byte [rsi], 0
    je .atoi_base

    mov rcx, rsi
    inc rcx
    jmp .check_dup_chars_loop_inner

.check_dup_chars_inc_base:
    inc rsi
    jmp .check_dup_chars_loop

.check_dup_chars_loop_inner:
    cmp byte [rcx], 0
    je .check_dup_chars_inc_base
    mov al, [rcx]
    cmp byte [rsi], al
    je .error
    inc rcx
    jmp .check_dup_chars_loop_inner

.atoi_base:
    mov rax, 1 ; TODO
    ret

.error:
    mov rax, 0
    ret
