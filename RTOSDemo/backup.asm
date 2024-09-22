		.include data_model.h
		.cdecls C,NOLIST, "msp430.h"   ; Processor specific definitions

;============================================================================
; backupReg1
;============================================================================
        .global  backupReg1            ; Declare symbol to be exported
        .global  backup_register_1

backupReg1:   .asmfunc

        dint
        nop

		mov_x r1, backup_register_1 + 4*1
		mov_x r2, backup_register_1 + 4*2
		mov_x r3, backup_register_1 + 4*3
		mov_x r4, backup_register_1 + 4*4
		mov_x r5, backup_register_1 + 4*5
		mov_x r6, backup_register_1 + 4*6
		mov_x r7, backup_register_1 + 4*7
		mov_x r8, backup_register_1 + 4*8
		mov_x r9, backup_register_1 + 4*9
		mov_x r10, backup_register_1 + 4*10
		mov_x r11, backup_register_1 + 4*11
		mov_x r12, backup_register_1 + 4*12
		mov_x r13, backup_register_1 + 4*13
		mov_x r14, backup_register_1 + 4*14
		mov_x r15, backup_register_1 + 4*15

        ret_x


        .endasmfunc


;============================================================================
; backupReg2
;============================================================================
        .global  backupReg2            ; Declare symbol to be exported
        .global  backup_register_2

backupReg2:   .asmfunc

        dint
        nop

		mov_x r1, backup_register_2 + 4*1
		mov_x r2, backup_register_2 + 4*2
		mov_x r3, backup_register_2 + 4*3
		mov_x r4, backup_register_2 + 4*4
		mov_x r5, backup_register_2 + 4*5
		mov_x r6, backup_register_2 + 4*6
		mov_x r7, backup_register_2 + 4*7
		mov_x r8, backup_register_2 + 4*8
		mov_x r9, backup_register_2 + 4*9
		mov_x r10, backup_register_2 + 4*10
		mov_x r11, backup_register_2 + 4*11
		mov_x r12, backup_register_2 + 4*12
		mov_x r13, backup_register_2 + 4*13
		mov_x r14, backup_register_2 + 4*14
		mov_x r15, backup_register_2 + 4*15

        ret_x

        .endasmfunc



;============================================================================
; restoreReg1
;============================================================================
        .global  restoreReg1            ; Declare symbol to be exported

restoreReg1:   .asmfunc

        dint
        nop

		mov_x backup_register_1 + 4*1, r1
		mov_x backup_register_1 + 4*2, r2
		mov_x backup_register_1 + 4*3, r3
		mov_x backup_register_1 + 4*4, r4
		mov_x backup_register_1 + 4*5, r5
		mov_x backup_register_1 + 4*6, r6
		mov_x backup_register_1 + 4*7, r7
		mov_x backup_register_1 + 4*8, r8
		mov_x backup_register_1 + 4*9, r9
		mov_x backup_register_1 + 4*10, r10
		mov_x backup_register_1 + 4*11, r11
		mov_x backup_register_1 + 4*12, r12
		mov_x backup_register_1 + 4*13, r13
		mov_x backup_register_1 + 4*14, r14
		mov_x backup_register_1 + 4*15, r15

        ret_x


        .endasmfunc

;============================================================================
; restoreReg2
;============================================================================
        .global  restoreReg2            ; Declare symbol to be exported

restoreReg2:   .asmfunc

        dint
        nop

		mov_x backup_register_2 + 4*1, r1
		mov_x backup_register_2 + 4*2, r2
		mov_x backup_register_2 + 4*3, r3
		mov_x backup_register_2 + 4*4, r4
		mov_x backup_register_2 + 4*5, r5
		mov_x backup_register_2 + 4*6, r6
		mov_x backup_register_2 + 4*7, r7
		mov_x backup_register_2 + 4*8, r8
		mov_x backup_register_2 + 4*9, r9
		mov_x backup_register_2 + 4*10, r10
		mov_x backup_register_2 + 4*11, r11
		mov_x backup_register_2 + 4*12, r12
		mov_x backup_register_2 + 4*13, r13
		mov_x backup_register_2 + 4*14, r14
		mov_x backup_register_2 + 4*15, r15

        ret_x


        .endasmfunc

;============================================================================
; enterSleep
;============================================================================
        .global  enterSleep            ; Declare symbol to be exported

enterSleep:   .asmfunc

        BIC #GIE, SR
        MOV.B #PMMPW_H, &PMMCTL0_H
        BIS.B #PMMREGOFF, &PMMCTL0_L
        BIC.B #SVSHE, &PMMCTL0_L
        MOV.B #000h, &PMMCTL0_H
        BIS #CPUOFF+OSCOFF+SCG0+SCG1, SR

        .endasmfunc

        .end
