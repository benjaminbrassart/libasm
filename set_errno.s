global set_errno

extern __errno_location

;
; void set_errno(int errnum)
;
; errnum = rdi
;
set_errno:
    call __errno_location WRT ..plt
    mov [rax], rdi
    ret
