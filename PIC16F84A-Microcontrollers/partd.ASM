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
;    Filename:        partd.asm                                         *
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
ctr           EQU     0x0F
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
    movlw 0x0A
    movwf ctr ; makes the counter value equal to 10
    
    movf PORTB,w
    andlw 0x0F ; this will retain the least significant four bits (bits 3-0) 
               ; and it will remove the value in the bits 7-4
	       
    
loop1:
    addwf my_result,f
    decfsz ctr,f
    goto loop1
    
    ; first set the ctr to 4 for the subtraction loop
    movlw 0x04
    movwf ctr
    
    swapf PORTB,w ; get the decrement amount from PORTB
    andlw 0x0F
     
    ; Complete for the subtraction loop
loop2:
    subwf my_result,f
    decfsz ctr,f
    goto loop2    
    
    
    ; Complete the comparison with -2 part
    ; remember this is xor with 1 code from part b
    movlw 1
    xorwf my_result,1

fin: 
    goto fin

        END                       ; directive 'end of program'

