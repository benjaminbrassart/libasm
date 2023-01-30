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

    push rsi
    jmp .check_base_chars

;
; TODO
;
; this is ugly as fuck, maybe try to
; implement a jump table like this
;
; https://www.reddit.com/r/learnprogramming/comments/hgm5g8/x8664_switch_jump_table_assembly_implementation/
;
.check_base_chars:
    cmp byte [rsi], 0x2b        ; 0x2b -> '+'
    je .error
    cmp byte [rsi], 0x2d        ; 0x2d -> '-'
    je .error
    cmp byte [rsi], 0x09        ; 0x09 -> '\t'
    je .error
    cmp byte [rsi], 0x0a        ; 0x0a -> '\n'
    je .error
    cmp byte [rsi], 0x0b        ; 0x0b -> '\v'
    je .error
    cmp byte [rsi], 0x0c        ; 0x0c -> '\f'
    je .error
    cmp byte [rsi], 0x0d        ; 0x0d -> '\r'
    je .error
    cmp byte [rsi], 0x20        ; 0x20 -> ' '
    je .error

    cmp byte [rsi], 0x00
    je .check_dup_chars

    inc rsi
    jmp .check_base_chars

.check_dup_chars:

.error:
    mov rax, 0
    ret
