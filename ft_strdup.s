global ft_strdup

;
; void* malloc(size_t size)
;
; size = rdi
; return = rax
;
extern malloc

;
; size_t ft_strlen(char const* str)
;
; str = rdi
; return = rax
;
extern ft_strlen

;
; char* ft_strcpy(char* dst, char const* src)
;
; dst = rdi
; src = rsi
; return = rax
;
extern ft_strcpy

;
; char* ft_strdup(char const* str)
;
; str = rdi
; return = rax
;
ft_strdup:
    push rdi                    ; save `str` to the stack

    call ft_strlen
    mov rdi, rax                ; size = ft_strlen(str)
    add rdi, 1                     ; ++size (for the '\0')

    ; WRT ..plt -> https://stackoverflow.com/a/41322328
    call malloc WRT ..plt       ; buf = malloc(size)
    cmp rax, 0                  ; buf == NULL
    je .end                     ; return NULL

    mov rdi, rax                ; use `buf` as first parameter
                                ; for ft_strcpy

    pop rsi                     ; get back `str` from the stack
                                ; and use it as second parameter
                                ; for ft_strcpy

    call ft_strcpy              ; ft_strcpy(buf, str)
    jmp .end                    ; return buf

.end:
    ret
