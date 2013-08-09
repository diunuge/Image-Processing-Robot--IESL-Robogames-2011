
_main:

;port.c,1 :: 		void main() {
;port.c,2 :: 		TRISA = 0;
	CLRF        TRISA+0 
;port.c,3 :: 		TRISB = 0;
	CLRF        TRISB+0 
;port.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;port.c,5 :: 		TRISD = 0;
	CLRF        TRISD+0 
;port.c,6 :: 		TRISE = 0;
	CLRF        TRISE+0 
;port.c,8 :: 		PORTA = 255;
	MOVLW       255
	MOVWF       PORTA+0 
;port.c,9 :: 		PORTB = 255;
	MOVLW       255
	MOVWF       PORTB+0 
;port.c,10 :: 		PORTC = 255;
	MOVLW       255
	MOVWF       PORTC+0 
;port.c,11 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;port.c,12 :: 		PORTE = 255;
	MOVLW       255
	MOVWF       PORTE+0 
;port.c,15 :: 		while(1){
L_main0:
;port.c,17 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 0
	BRA         L_main2
	DECFSZ      R12, 1, 0
	BRA         L_main2
	DECFSZ      R11, 1, 0
	BRA         L_main2
	NOP
;port.c,19 :: 		PORTA = 255;
	MOVLW       255
	MOVWF       PORTA+0 
;port.c,20 :: 		PORTB = 255;
	MOVLW       255
	MOVWF       PORTB+0 
;port.c,21 :: 		PORTC = 255;
	MOVLW       255
	MOVWF       PORTC+0 
;port.c,22 :: 		PORTD = 255;
	MOVLW       255
	MOVWF       PORTD+0 
;port.c,23 :: 		PORTE = 255;
	MOVLW       255
	MOVWF       PORTE+0 
;port.c,25 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 0
	BRA         L_main3
	DECFSZ      R12, 1, 0
	BRA         L_main3
	DECFSZ      R11, 1, 0
	BRA         L_main3
	NOP
;port.c,27 :: 		PORTA = 0;
	CLRF        PORTA+0 
;port.c,28 :: 		PORTB = 0;
	CLRF        PORTB+0 
;port.c,29 :: 		PORTC = 0;
	CLRF        PORTC+0 
;port.c,30 :: 		PORTD = 0;
	CLRF        PORTD+0 
;port.c,31 :: 		PORTE = 0;
	CLRF        PORTE+0 
;port.c,32 :: 		}
	GOTO        L_main0
;port.c,33 :: 		}
	GOTO        $+0
; end of _main
