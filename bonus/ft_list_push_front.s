global ft_list_push_front

;
; void* malloc(size_t size)
;
; size = rdi
; return = rax
;
extern malloc

;
; void ft_list_push_front(t_list **begin, void *data)
;
; begin = rdi
; data = rsi
;
ft_list_push_front:
    push rdi
    jmp .create_node

.create_node:
    mov rdi, 16
    call malloc WRT ..plt       ; malloc(16)

    ; node = rax
    cmp rax, 0                  ; malloc() == NULL
    je .end

    mov [rax + 0], rsi          ; node->data = data
    pop rdi
    mov rsi, [rdi]
    mov [rax + 8], rsi          ; node->next = *begin
    mov [rdi], rax              ; *begin = node

.end:
    ret
