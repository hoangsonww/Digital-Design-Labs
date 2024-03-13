;**********************************************************************
;                                                                     *
;    An Assembly file for the Guessing Game in PIC16F84A.             *
;    The goal of this program is to implement a simple guessing game  *
;    with 4 LEDs, where the user inputs a combination via the PORTA   *
;    pins and the program checks the input against the active LED. If * 
;    the input is correct, the WIN LED will light up, otherwise, the  *
;    ERR LED will light up.					                          *
;						                                              *
;**********************************************************************
;                                                                     *
;    Filename:        GuessingGame.asm                                *
;    Date:            04/30/2023                                      *
;    File Version:    1.0                                             *
;                                                                     *
;    Author:          David Nguyen				                      *
;    Company:         Case Western Reserve University                 *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Files required: P16F84A.INC                                      *
;                                                                     *
;                                                                     *
;**********************************************************************
;                                                                     *
;    Note: The processor frequency must be set to 100 kHz and the     *
;    instruction frequency must be set to 25 kHz in order to          *
;    monitor the outputs and for the delay to achieve a ~1 second     *                                                                 *
;    delay!                                                           *
;                                                                     *
;**********************************************************************

    list      p=16F84A             ; Directive to define the PIC16F84A
    #include <p16F84a.inc>         ; INC file for the PIC16F84A

    ; CPU configuration
    ; (16F84 with RC osc, watchdog timer off, power-up timer on)
    __CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

; ******************** VARIABLE & STATE DEFINITIONS ********************** ;    
delay_outer_counter  EQU     0x0D    ; Variable used for outer delay loop
delay_inner_counter  EQU     0x0E    ; Variable used for inner delay loop
current_state	     EQU     0x0C    ; Variable used for current state saving 
state_S1	     EQU     B'00000001' ; State S1 (RB0 = 1)
state_S2             EQU     B'00000010' ; State S2 (RB1 = 1)
state_S3             EQU     B'00000100' ; State S3 (RB2 = 1)
state_S4	     EQU     B'00001000' ; State S4 (RB3 = 1)
state_SERR           EQU     B'00010000' ; State SERR (RB4 = 1)
state_SOK            EQU     B'00100000' ; State SOK (win, so RB5 = 1)
	    
; Some handy MACRO definitions: 
; (inspired by author: Steven L. Garverick in his "tbird.asm" file):    

If_Bit_Is_Set macro fr, bit, label
    btfss fr, bit ; if (fr.bit) then execute code following macro
    goto label ; else goto label	
        endm

If_Bit_Is_Clear macro fr, bit, label
    btfsc fr, bit ; if (! fr.bit) then execute code following macro
    goto label ; else goto label
	endm

If_Bit_Equals_Literal macro fr, lit, label
    movlw lit
    xorwf fr, W
    btfss STATUS, Z ; (fr == lit) then execute code following macro
    goto label ; else goto label
	endm

If_Bit_Not_Equals_Literal macro fr, lit, label
    movlw lit
    xorwf fr, W
    btfsc STATUS, Z ; (fr != lit) then execute code following macro
    goto label ; else goto label
	endm

Move_Literal_To_F macro lit, fr
    movlw lit
    movwf fr
	endm

Move_F_To_F macro from, to
    movf from, W
    movwf to
        endm	    	    

;***************************** RESER VECTORS ******************************;
; (This portion is inspired by Steven M. Garverick in his tbird.asm program)
	
	org 0x00	; reset at address 0
reset:	goto	start	; skip reserved program addresses	

	org	0x08 	; beginning of user code

; ************************ START OF MAIN PROGRAM ************************ ;
	
MAIN_PROGRAM    CODE

start:
    
; David Nguyen

    ; Initializing the inputs and outputs for the PIC16F84A:
    bsf    STATUS, RP0    ; Switch to Bank 1
    movlw  0x0F		  ; Sets RA0-3 as inputs
    movwf  TRISA	  ; Sets RA0-3 as inputs
    movlw  B'11000000'    ; Sets RB0-5 as outputs (no info provided for unused 
			  ; RB6-7, so set them as inputs.)
    movwf  TRISB	  ; Sets RB0-5 as outputs, RB6-7 as unused inputs
    bcf    STATUS, RP0    ; Switch back to Bank 0
    
; Initialize the state machine to state S1 (binary: 00000001):
initialize_state_machine:
    ; Initialize current_State variable to S1 (binary: 00000001)
    movlw  state_S1
    movwf  current_state

; The state machine's main, indefinite loop:
state_machine_loop:
    ; Load the current state into PORTB outputs
    movf  current_state, W
    movwf PORTB
    ; Calls the subroutine to delay for 1 second before each state change
    goto  delay_one_second

;**************************************************************************
;                               SUBROUTINES                               *
;**************************************************************************     
    
; Calls the subroutine to handle SOK and SERR states
; If at state SOK or SERR, the program will only continue when the inputs are
; CLEARED - so the player must clear the inputs before continue playing:    
handle_SOK_SERR_states:
    ; If the curent state is SOK, clear (reset) the inputs before continuing
    movlw state_SOK
    xorwf current_state, W
    btfsc STATUS, Z 
    goto  clear_the_inputs_and_lights 
    ; If the curent state is SERR, clear (reset) the inputs before continuing
    movlw state_SERR
    xorwf current_state, W
    btfsc STATUS, Z
    goto  clear_the_inputs_and_lights
    ; Otherwise, handle the cases where the current state is not SOK or SERR
    goto  handle_not_SOK_or_SERR_states
    
; The subroutine to clear the inputs when they are not needed
clear_the_inputs_and_lights:
    movf  PORTA, W   
    andlw 0x0F
    xorlw 0x00
    btfsc STATUS, Z
    ; Go back to intial state of the machine
    goto  initialize_state_machine
    ; Also attempts to clear the inputs as well as the lights
    goto  clear_the_inputs_and_lights  
    
 ; If the current state is not SOK or SERR then rotate the lights normally     
handle_not_SOK_or_SERR_states:
    ; Move the current inputs to the working register
    movf  PORTA, W
    ; Mask the upper 4 bits to check for the rest of PORTA bits (RA0-3)
    andlw B'00001111'
    ; Check if there is any inputs
    xorlw B'00000000' 
    ; If bit is clear, then go to the next state (S1, S2, S3, or S4)
    btfsc STATUS, Z 
    goto  compute_next_state 
    ; Otherwise, if there is at least one input, check every single state
    ; from S1 to S3
    ; First, check G1 guesses:
    movlw state_S1
    xorwf current_state, W
    btfsc STATUS, Z
    goto  handle_G1_guesses
    ; Then, check G2 guesses:
    movlw state_S2
    xorwf current_state, W
    btfsc STATUS, Z
    goto  handle_G2_guesses
    ; Then, check G3 guesses:
    movlw state_S3
    xorwf current_state, W
    btfsc STATUS, Z
    goto  handle_G3_guesses
    ; If input is not from G1 to G3, it must be G4:
    goto  handle_G4_guesses   

; Handle the case where G1 (RA0) is pressed    
handle_G1_guesses:
    movf  PORTA, W
    andlw 0x0F
    xorlw state_S1
    btfsc STATUS, Z 
    ; If G1 is pressed and the current state is S1, the guess is correct
    goto  handle_correct_guesses 
    ; If G1 is pressed but the current state is not S1, the guess is incorrect
    goto  handle_incorrect_guesses

; Handle the case where G2 (RA1) is pressed     
handle_G2_guesses:
    movf  PORTA, W
    andlw 0x0F
    xorlw state_S2
    btfsc STATUS, Z 
    ; If G2 is pressed and the current state is S2, the guess is correct
    goto  handle_correct_guesses 
    ; If G2 is pressed but the current state is not S2, the guess is incorrect
    goto  handle_incorrect_guesses

; Handle the case where G3 (RA2) is pressed     
handle_G3_guesses:
    movf  PORTA, W
    andlw 0x0F
    xorlw state_S3
    btfsc STATUS, Z 
    ; If G3 is pressed and the current state is S3, the guess is correct
    goto  handle_correct_guesses 
    ; If G3 is pressed but the current state is not S3, the guess is incorrect
    goto  handle_incorrect_guesses

; Handle the case where G4 (RA3) is pressed     
handle_G4_guesses:
    movf  PORTA, W
    andlw 0x0F
    xorlw state_S4
    btfsc STATUS, Z 
    ; If G4 is pressed and the current state is S4, the guess is correct
    goto  handle_correct_guesses 
    ; If G4 is pressed but the current state is not S4, the guess is incorrect
    goto  handle_incorrect_guesses

; Handle the case where an incorrect guess is made    
handle_incorrect_guesses:
    ; Sets the current state to the SERR state
    movlw  state_SERR
    movwf  current_state
    goto   state_machine_loop    
    
; Handle the case where a correct guess is made    
handle_correct_guesses:
    ; Sets the current state to the SOK state
    movlw  state_SOK
    movwf  current_state
    goto   state_machine_loop

; Determine the next state of the state machine (when no inputs is selected):   
compute_next_state:
    ; If the current state is S1, move to S2
    movlw state_S1
    xorwf current_state, W
    btfsc STATUS, Z
    goto  move_to_state_S2 
    ; If the current state is S2, move to S3
    movlw state_S2
    xorwf current_state, W
    btfsc STATUS, Z
    goto  move_to_state_S3
    ; If the current state is S3, move to S4
    movlw state_S3
    xorwf current_state, W
    btfsc STATUS, Z
    goto  move_to_state_S4
    ; If the current state is S4, move to S1
    goto  move_to_state_S1

; Sets the current state to state S1    
move_to_state_S1:
    movlw state_S1
    movwf current_state
    goto  state_machine_loop
 
; Sets the current state to state S2    
move_to_state_S2:
    movlw state_S2
    movwf current_state
    goto  state_machine_loop

; Sets the current state to state S3    
move_to_state_S3:
    movlw state_S3
    movwf current_state
    goto  state_machine_loop

; Sets the current state to state S4    
move_to_state_S4:
    movlw state_S4
    movwf current_state
    goto  state_machine_loop   

; Calls delay loops for 1 second between every state
; Creating a delay of about 1 second:
; (Inspired by: Steven M. Garverick in his tbird.asm file)
delay_one_second:
    ; Initialize outer loop counter to 32
    movlw  d'32'
    movwf  delay_outer_counter    
outer_delay_loop:	
    ; Initialize inner loop counter to 256
    clrf   delay_inner_counter
inner_delay_loop: 
    ; If (--delay_inner_counter != 0) loop to inner_delay_loop
    decfsz delay_inner_counter,F  
    goto   inner_delay_loop	
    ; If (--delay_outer_counter != 0) loop to outer_delay_loop
    decfsz delay_outer_counter,F  
    goto   outer_delay_loop 
    ; Go back to the subroutine that handles SOK and SERR states
    goto   handle_SOK_SERR_states
    
    ; Directive 'end of program'
    END				  