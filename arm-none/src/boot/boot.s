.section ".text.boot"

.global _start

_start:
    mov sp, #0x8000

    ldr r0, =__bss_start
    ldr r1, =__bss_end
    mov r2, #0
clear_bss:
    cmp r0, r1
    beq run_main
    str r2, [r0], #4
    b clear_bss

run_main:
    bl main

halt:
    // Infinite loop if main returns
    b halt
