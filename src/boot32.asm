bits 16
org 0x1000

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
		
		
