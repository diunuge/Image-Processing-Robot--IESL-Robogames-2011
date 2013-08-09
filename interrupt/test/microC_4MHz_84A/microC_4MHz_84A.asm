
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;microC_4MHz_84A.c,8 :: 		void interrupt()
;microC_4MHz_84A.c,10 :: 		if (INTCON.T0IF) // Check for Timer 0 interrupt
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;microC_4MHz_84A.c,12 :: 		LoopCounter++;
	INCF       _LoopCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _LoopCounter+1, 1
;microC_4MHz_84A.c,13 :: 		if(LoopCounter > 15) //Check for 15 cycles
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _LoopCounter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVF       _LoopCounter+0, 0
	SUBLW      15
L__interrupt19:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt1
;microC_4MHz_84A.c,15 :: 		Digit1 = Digit1 +1; // Increase Digit 1
	INCF       _Digit1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Digit1+1, 1
;microC_4MHz_84A.c,16 :: 		if(Digit1>9) // if it is 9 then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Digit1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt20
	MOVF       _Digit1+0, 0
	SUBLW      9
L__interrupt20:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt2
;microC_4MHz_84A.c,18 :: 		Digit1=0; // reset to 0 and
	CLRF       _Digit1+0
	CLRF       _Digit1+1
;microC_4MHz_84A.c,19 :: 		Digit2++; // increase Digit 2
	INCF       _Digit2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Digit2+1, 1
;microC_4MHz_84A.c,20 :: 		if(Digit2>9)// If Digit 2 is 9
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _Digit2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt21
	MOVF       _Digit2+0, 0
	SUBLW      9
L__interrupt21:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt3
;microC_4MHz_84A.c,21 :: 		Digit2=0;// then reset it to 0
	CLRF       _Digit2+0
	CLRF       _Digit2+1
L_interrupt3:
;microC_4MHz_84A.c,22 :: 		}
L_interrupt2:
;microC_4MHz_84A.c,23 :: 		LoopCounter =0; // Reset Loop Counter
	CLRF       _LoopCounter+0
	CLRF       _LoopCounter+1
;microC_4MHz_84A.c,24 :: 		}
L_interrupt1:
;microC_4MHz_84A.c,25 :: 		INTCON.T0IF = 0; // Clear Timer 0 overflow flag
	BCF        INTCON+0, 2
;microC_4MHz_84A.c,26 :: 		}
L_interrupt0:
;microC_4MHz_84A.c,27 :: 		}
L__interrupt18:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;microC_4MHz_84A.c,30 :: 		void main()
;microC_4MHz_84A.c,32 :: 		TRISA = 0b00011001; //RA0 input
	MOVLW      25
	MOVWF      TRISA+0
;microC_4MHz_84A.c,33 :: 		TRISB = 0; //PORTB output
	CLRF       TRISB+0
;microC_4MHz_84A.c,34 :: 		OPTION_REG = 0b10000111; //Configure Timer 0
	MOVLW      135
	MOVWF      OPTION_REG+0
;microC_4MHz_84A.c,35 :: 		INTCON = 0b10100000; //Enable interrupts
	MOVLW      160
	MOVWF      INTCON+0
;microC_4MHz_84A.c,36 :: 		Digit1 = 0; //Start from 0
	CLRF       _Digit1+0
	CLRF       _Digit1+1
;microC_4MHz_84A.c,37 :: 		Digit2 = 0; //Start from 0
	CLRF       _Digit2+0
	CLRF       _Digit2+1
;microC_4MHz_84A.c,38 :: 		LoopCounter = 0; //Start from 0
	CLRF       _LoopCounter+0
	CLRF       _LoopCounter+1
;microC_4MHz_84A.c,40 :: 		while (1) // loop forever
L_main4:
;microC_4MHz_84A.c,42 :: 		LoopCounter = 0; //Start from 0
	CLRF       _LoopCounter+0
	CLRF       _LoopCounter+1
;microC_4MHz_84A.c,43 :: 		ssdecode(Digit1); //Display digit 1
	MOVF       _Digit1+0, 0
	MOVWF      FARG_ssdecode_i+0
	MOVF       _Digit1+1, 0
	MOVWF      FARG_ssdecode_i+1
	CALL       _ssdecode+0
;microC_4MHz_84A.c,44 :: 		PORTA.B1 = 1; //Enable Digit1
	BSF        PORTA+0, 1
;microC_4MHz_84A.c,46 :: 		PORTA.B1 = 0; //Disable Digit1
	BCF        PORTA+0, 1
;microC_4MHz_84A.c,47 :: 		ssdecode(Digit2); //Display digit 2
	MOVF       _Digit2+0, 0
	MOVWF      FARG_ssdecode_i+0
	MOVF       _Digit2+1, 0
	MOVWF      FARG_ssdecode_i+1
	CALL       _ssdecode+0
;microC_4MHz_84A.c,48 :: 		PORTA.B2 = 1; //Enable Digit2
	BSF        PORTA+0, 2
;microC_4MHz_84A.c,50 :: 		PORTA.B2 = 0; //Disable Digit2
	BCF        PORTA+0, 2
;microC_4MHz_84A.c,51 :: 		LoopCounter++;//Cycle counter
	INCF       _LoopCounter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _LoopCounter+1, 1
;microC_4MHz_84A.c,52 :: 		}
	GOTO       L_main4
;microC_4MHz_84A.c,53 :: 		}
	GOTO       $+0
; end of _main

_ssdecode:

;microC_4MHz_84A.c,56 :: 		void ssdecode(int i)
;microC_4MHz_84A.c,58 :: 		switch (i)
	GOTO       L_ssdecode6
;microC_4MHz_84A.c,60 :: 		case 0: PORTB = 0b00111111; break;
L_ssdecode8:
	MOVLW      63
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,61 :: 		case 1: PORTB = 0b00000110; break;
L_ssdecode9:
	MOVLW      6
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,62 :: 		case 2: PORTB = 0b01011011; break;
L_ssdecode10:
	MOVLW      91
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,63 :: 		case 3: PORTB = 0b01001111; break;
L_ssdecode11:
	MOVLW      79
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,64 :: 		case 4: PORTB = 0b01100110; break;
L_ssdecode12:
	MOVLW      102
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,65 :: 		case 5: PORTB = 0b01101101; break;
L_ssdecode13:
	MOVLW      109
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,66 :: 		case 6: PORTB = 0b01111101; break;
L_ssdecode14:
	MOVLW      125
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,67 :: 		case 7: PORTB = 0b00000111; break;
L_ssdecode15:
	MOVLW      7
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,68 :: 		case 8: PORTB = 0b01111111; break;
L_ssdecode16:
	MOVLW      127
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,69 :: 		case 9: PORTB = 0b01101111; break;
L_ssdecode17:
	MOVLW      111
	MOVWF      PORTB+0
	GOTO       L_ssdecode7
;microC_4MHz_84A.c,70 :: 		}
L_ssdecode6:
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode22
	MOVLW      0
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode22:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode8
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode23
	MOVLW      1
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode23:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode9
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode24
	MOVLW      2
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode24:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode10
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode25
	MOVLW      3
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode25:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode11
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode26
	MOVLW      4
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode26:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode12
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode27
	MOVLW      5
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode27:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode13
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode28
	MOVLW      6
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode28:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode14
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode29
	MOVLW      7
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode29:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode15
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode30
	MOVLW      8
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode30:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode16
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode31
	MOVLW      9
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode31:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode17
L_ssdecode7:
;microC_4MHz_84A.c,71 :: 		}
	RETURN
; end of _ssdecode
