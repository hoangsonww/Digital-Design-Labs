;**********************************************************************
;                                                                     *
;   This file is a basic code template for assembly code generation   *
;   on the PIC16F84A. This file contains the basic code               *
;   building blocks to build upon.                                    *
;                                                                     *
;   Refer to the MPASM User's Guide for additional information on     *
;   features of the assembler (Document DS33014).                     *
;                                                                     *
;   Refer to the respective PIC data sheet for additional             *
;   information on the instruction set.                               *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Filename:        xxx.asm                                         *
;    Date:                                                            *
;    File Version:                                                    *
;                                                                     *
;    Author:                                                          *
;    Company:                                                         *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files required: P16F84A.INC                                      *
;                                                                     *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Notes:                                                           *
;                                                                     *
;                                                                     *
;                                                                     *
;                                                                     *
;**********************************************************************


    list      p=16F84A             ; list directive to define processor
    #include <p16F84a.inc>         ; processor specific variable definitions

    __CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving 
status_temp   EQU     0x0D        ; variable used for context saving
my_result     EQU     0x0E
;**********************************************************************
RESET_VECTOR      CODE    0x0000  ; processor reset vector
        goto    start             ; go to beginning of program

ISR               CODE    0x0004  ; interrupt vector location

Interrupt:

        movwf  w_temp             ; save off current W register contents
        movf   STATUS,w           ; move status register into W register
        movwf  status_temp        ; save off contents of STATUS register

;  Place ISR Here

        movf   status_temp,w      ; retrieve copy of STATUS register
        movwf  STATUS             ; restore pre-isr STATUS register contents
        swapf  w_temp,f
        swapf  w_temp,w           ; restore pre-isr W register contents
        retfie                    ; return from interrupt

MAIN_PROGRAM    CODE

; David Nguyen    
    
start:

; remaining code goes here
    clrf my_result
    ; Add 1 to my_result ten times
    incf my_result,f ; make sure you increment my_result nine more times
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    incf my_result,f
    
    movlw 3 ; this line writes 3 to w-reg
    subwf my_result,f ; this line will subtract 3 from my_result
    ; repeat the subtraction line three more times
    subwf my_result,f
    subwf my_result,f
    subwf my_result,f
    
    movlw 1
    xorwf my_result,1
    
    
fin:
    goto fin
  

  
        END                       ; directive 'end of program'

