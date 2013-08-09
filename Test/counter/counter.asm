
_main:

;counter.c,3 :: 		void main()
;counter.c,5 :: 		TRISA = 0b00000001; //PORTA input
	MOVLW      1
	MOVWF      TRISA+0
;counter.c,6 :: 		TRISB = 0; //PORTB output
	CLRF       TRISB+0
;counter.c,7 :: 		number = 0; //Start from 0
	CLRF       _number+0
	CLRF       _number+1
;counter.c,8 :: 		while (1)
L_main0:
;counter.c,10 :: 		if(PORTA.F0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_main2
;counter.c,11 :: 		number = number +1;
	INCF       _number+0, 1
	BTFSC      STATUS+0, 2
	INCF       _number+1, 1
L_main2:
;counter.c,12 :: 		if(PORTA.F0 == 0)
	BTFSC      PORTA+0, 0
	GOTO       L_main3
;counter.c,13 :: 		PORTB.B7=1;
	BSF        PORTB+0, 7
L_main3:
;counter.c,14 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;counter.c,15 :: 		if(PORTA.F0 != 0)
	BTFSS      PORTA+0, 0
	GOTO       L_main5
;counter.c,16 :: 		PORTB.B7=0;
	BCF        PORTB+0, 7
L_main5:
;counter.c,17 :: 		if(number>9) number=0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _number+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _number+0, 0
	SUBLW      9
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
	CLRF       _number+0
	CLRF       _number+1
L_main6:
;counter.c,18 :: 		ssdecode(number);
	MOVF       _number+0, 0
	MOVWF      FARG_ssdecode_i+0
	MOVF       _number+1, 0
	MOVWF      FARG_ssdecode_i+1
	CALL       _ssdecode+0
;counter.c,19 :: 		Delay_ms(100);
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
;counter.c,20 :: 		}
	GOTO       L_main0
;counter.c,21 :: 		}
	GOTO       $+0
; end of _main

_ssdecode:

;counter.c,22 :: 		void ssdecode(int i)
;counter.c,24 :: 		switch (i)
	GOTO       L_ssdecode8
;counter.c,26 :: 		case 0: PORTB = 0b00111111; break;
L_ssdecode10:
	MOVLW      63
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,27 :: 		case 1: PORTB = 0b00000110; break;
L_ssdecode11:
	MOVLW      6
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,28 :: 		case 2: PORTB = 0b01011011; break;
L_ssdecode12:
	MOVLW      91
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,29 :: 		case 3: PORTB = 0b01001111; break;
L_ssdecode13:
	MOVLW      79
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,30 :: 		case 4: PORTB = 0b01100110; break;
L_ssdecode14:
	MOVLW      102
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,31 :: 		case 5: PORTB = 0b01101101; break;
L_ssdecode15:
	MOVLW      109
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,32 :: 		case 6: PORTB = 0b01111101; break;
L_ssdecode16:
	MOVLW      125
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,33 :: 		case 7: PORTB = 0b00000111; break;
L_ssdecode17:
	MOVLW      7
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,34 :: 		case 8: PORTB = 0b01111111; break;
L_ssdecode18:
	MOVLW      127
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,35 :: 		case 9: PORTB = 0b01101111; break;
L_ssdecode19:
	MOVLW      111
	MOVWF      PORTB+0
	GOTO       L_ssdecode9
;counter.c,36 :: 		}
L_ssdecode8:
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode21
	MOVLW      0
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode21:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode10
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode22
	MOVLW      1
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode22:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode11
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode23
	MOVLW      2
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode23:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode12
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode24
	MOVLW      3
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode24:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode13
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode25
	MOVLW      4
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode25:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode14
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode26
	MOVLW      5
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode26:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode15
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode27
	MOVLW      6
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode27:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode16
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode28
	MOVLW      7
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode28:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode17
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode29
	MOVLW      8
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode29:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode18
	MOVLW      0
	XORWF      FARG_ssdecode_i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ssdecode30
	MOVLW      9
	XORWF      FARG_ssdecode_i+0, 0
L__ssdecode30:
	BTFSC      STATUS+0, 2
	GOTO       L_ssdecode19
L_ssdecode9:
;counter.c,37 :: 		}
	RETURN
; end of _ssdecode
