
_main:

;16F877A_single_servo.c,1 :: 		void main() {
;16F877A_single_servo.c,2 :: 		int count=0;
	CLRF        main_count_L0+0 
	CLRF        main_count_L0+1 
;16F877A_single_servo.c,3 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;16F877A_single_servo.c,4 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;16F877A_single_servo.c,6 :: 		while(1)
L_main0:
;16F877A_single_servo.c,9 :: 		for(count=0;count<100;count++)
	CLRF        main_count_L0+0 
	CLRF        main_count_L0+1 
L_main2:
	MOVLW       128
	XORWF       main_count_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       100
	SUBWF       main_count_L0+0, 0 
L__main19:
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;16F877A_single_servo.c,11 :: 		PORTB = 0b00000011;
	MOVLW       3
	MOVWF       PORTB+0 
;16F877A_single_servo.c,12 :: 		delay_ms(2);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 0
	BRA         L_main5
	DECFSZ      R12, 1, 0
	BRA         L_main5
	NOP
	NOP
;16F877A_single_servo.c,13 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;16F877A_single_servo.c,14 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 0
	BRA         L_main6
	DECFSZ      R12, 1, 0
	BRA         L_main6
;16F877A_single_servo.c,9 :: 		for(count=0;count<100;count++)
	INFSNZ      main_count_L0+0, 1 
	INCF        main_count_L0+1, 1 
;16F877A_single_servo.c,15 :: 		}
	GOTO        L_main2
L_main3:
;16F877A_single_servo.c,17 :: 		for(count=0;count<100;count++)
	CLRF        main_count_L0+0 
	CLRF        main_count_L0+1 
L_main7:
	MOVLW       128
	XORWF       main_count_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       100
	SUBWF       main_count_L0+0, 0 
L__main20:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;16F877A_single_servo.c,19 :: 		PORTB = 0b00000011;
	MOVLW       3
	MOVWF       PORTB+0 
;16F877A_single_servo.c,20 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 0
	BRA         L_main10
	DECFSZ      R12, 1, 0
	BRA         L_main10
;16F877A_single_servo.c,21 :: 		delay_us(500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 0
	BRA         L_main11
	DECFSZ      R12, 1, 0
	BRA         L_main11
	NOP
	NOP
;16F877A_single_servo.c,22 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;16F877A_single_servo.c,23 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 0
	BRA         L_main12
	DECFSZ      R12, 1, 0
	BRA         L_main12
;16F877A_single_servo.c,24 :: 		delay_us(400);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 0
	BRA         L_main13
	DECFSZ      R12, 1, 0
	BRA         L_main13
	NOP
	NOP
;16F877A_single_servo.c,17 :: 		for(count=0;count<100;count++)
	INFSNZ      main_count_L0+0, 1 
	INCF        main_count_L0+1, 1 
;16F877A_single_servo.c,25 :: 		}
	GOTO        L_main7
L_main8:
;16F877A_single_servo.c,26 :: 		for(count=0;count<100;count++)
	CLRF        main_count_L0+0 
	CLRF        main_count_L0+1 
L_main14:
	MOVLW       128
	XORWF       main_count_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       100
	SUBWF       main_count_L0+0, 0 
L__main21:
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
;16F877A_single_servo.c,28 :: 		PORTB = 0b00000011;
	MOVLW       3
	MOVWF       PORTB+0 
;16F877A_single_servo.c,29 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 0
	BRA         L_main17
	DECFSZ      R12, 1, 0
	BRA         L_main17
;16F877A_single_servo.c,30 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;16F877A_single_servo.c,31 :: 		delay_ms(19);
	MOVLW       124
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 0
	BRA         L_main18
	DECFSZ      R12, 1, 0
	BRA         L_main18
;16F877A_single_servo.c,26 :: 		for(count=0;count<100;count++)
	INFSNZ      main_count_L0+0, 1 
	INCF        main_count_L0+1, 1 
;16F877A_single_servo.c,32 :: 		}
	GOTO        L_main14
L_main15:
;16F877A_single_servo.c,33 :: 		;}
	GOTO        L_main0
;16F877A_single_servo.c,34 :: 		}
	GOTO        $+0
; end of _main
