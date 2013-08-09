
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Int_microC_20MHz_877_external.c,5 :: 		void interrupt()
;Int_microC_20MHz_877_external.c,9 :: 		PORTA = 1;
	MOVLW      1
	MOVWF      PORTA+0
;Int_microC_20MHz_877_external.c,10 :: 		Digit1 = Digit1 +1; // Increase Digit 1
	INCF       _Digit1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Digit1+1, 1
;Int_microC_20MHz_877_external.c,11 :: 		INTCON.INTF = 0; // Clear RB0 interrupt flag
	BCF        INTCON+0, 1
;Int_microC_20MHz_877_external.c,13 :: 		if(INTCON.B0){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt1
;Int_microC_20MHz_877_external.c,14 :: 		PORTA = 2;
	MOVLW      2
	MOVWF      PORTA+0
;Int_microC_20MHz_877_external.c,15 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_interrupt2
	NOP
	NOP
;Int_microC_20MHz_877_external.c,16 :: 		PORTA = 0;
	CLRF       PORTA+0
;Int_microC_20MHz_877_external.c,17 :: 		delay_ms (100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	DECFSZ     R11+0, 1
	GOTO       L_interrupt3
	NOP
	NOP
;Int_microC_20MHz_877_external.c,18 :: 		PORTA =4;
	MOVLW      4
	MOVWF      PORTA+0
;Int_microC_20MHz_877_external.c,19 :: 		Digit1 = Digit1 -1;
	MOVLW      1
	SUBWF      _Digit1+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Digit1+1, 1
;Int_microC_20MHz_877_external.c,20 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;Int_microC_20MHz_877_external.c,21 :: 		}
L_interrupt1:
;Int_microC_20MHz_877_external.c,22 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt4:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt4
	DECFSZ     R12+0, 1
	GOTO       L_interrupt4
	DECFSZ     R11+0, 1
	GOTO       L_interrupt4
	NOP
	NOP
;Int_microC_20MHz_877_external.c,23 :: 		PORTA = 0;
	CLRF       PORTA+0
;Int_microC_20MHz_877_external.c,24 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Int_microC_20MHz_877_external.c,25 :: 		INTCON.B0 = 0;
	BCF        INTCON+0, 0
;Int_microC_20MHz_877_external.c,26 :: 		}
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Int_microC_20MHz_877_external.c,29 :: 		void main()
;Int_microC_20MHz_877_external.c,31 :: 		ADCON1 = 0b111;
	MOVLW      7
	MOVWF      ADCON1+0
;Int_microC_20MHz_877_external.c,32 :: 		ADCON0 = 0b0;
	CLRF       ADCON0+0
;Int_microC_20MHz_877_external.c,33 :: 		TRISA = 0;
	CLRF       TRISA+0
;Int_microC_20MHz_877_external.c,34 :: 		PORTA = 0;
	CLRF       PORTA+0
;Int_microC_20MHz_877_external.c,36 :: 		TRISB = 0b11110001; //RB0 input
	MOVLW      241
	MOVWF      TRISB+0
;Int_microC_20MHz_877_external.c,37 :: 		PORTB = 0;
	CLRF       PORTB+0
;Int_microC_20MHz_877_external.c,38 :: 		TRISD = 0;
	CLRF       TRISD+0
;Int_microC_20MHz_877_external.c,39 :: 		PORTD = 0;
	CLRF       PORTD+0
;Int_microC_20MHz_877_external.c,41 :: 		INTCON = 0b10011000; //Enable RB0 interrupts
	MOVLW      152
	MOVWF      INTCON+0
;Int_microC_20MHz_877_external.c,42 :: 		Digit1 = 0; //Start from 0
	CLRF       _Digit1+0
	CLRF       _Digit1+1
;Int_microC_20MHz_877_external.c,43 :: 		while (1) // loop forever
L_main5:
;Int_microC_20MHz_877_external.c,45 :: 		PORTD = Digit1; //Display digit 1
	MOVF       _Digit1+0, 0
	MOVWF      PORTD+0
;Int_microC_20MHz_877_external.c,46 :: 		Delay_ms(100); //Small delay
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Int_microC_20MHz_877_external.c,47 :: 		}
	GOTO       L_main5
;Int_microC_20MHz_877_external.c,48 :: 		}
	GOTO       $+0
; end of _main
