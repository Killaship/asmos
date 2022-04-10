org 0x7C00   ; add 0x7C00 to label addresses
bits 16      ; tell the assembler we want 16 bit code


mov ax, 0  ; set up segments
mov ds, ax
mov es, ax
mov ss, ax     ; setup stack
mov sp, 0x7C00 ; stack grows downwards from 0x7C00
   
boot: 
	; Load stage 2 to memory.
    mov ah, 0x02
    mov al, 0xFF ; amount of sectors to load
    ; This may not be necessary as many BIOS setup is as an initial state.
    mov dl, 0x00
    mov ch, 0
    mov dh, 0
    mov cl, 2
    mov bx, 0x513 ; where the OS is location'ed
    int 0x13
	
	jmp 0x513
times 510-($-$$) db 0
dw 0AA55h ; some BIOSes require this signature



shutdown:
        ; APM shutdown
        mov ax, 0x5300
        xor bx, bx
        int 0x15
        jc shutdown_fail

        mov ax, 0x5303
        xor bx, bx
        int 0x15
        jc shutdown_fail

        mov ax, 0x5308
        mov bx, 0x0001
        mov cx, 0x0001
        int 0x15
        jc shutdown_fail

        mov ax, 0x5307
        mov bx, 0x0001
        mov cx, 0x0003
        int 0x15

        shutdown_fail:
        cli
        hlt
        jmp shutdown_fail
