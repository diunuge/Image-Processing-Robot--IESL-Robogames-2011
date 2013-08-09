
_moveLeft:

;led_knite_rider.c,1 :: 		void moveLeft(){
;led_knite_rider.c,2 :: 		while(PORTB.B7 !=1){
L_moveLeft0:
	BTFSC      PORTB+0, 7
	GOTO       L_moveLeft1
;led_knite_rider.c,3 :: 		PORTB = PORTB*2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;led_knite_rider.c,4 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_moveLeft2:
	DECFSZ     R13+0, 1
	GOTO       L_moveLeft2
	DECFSZ     R12+0, 1
	GOTO       L_moveLeft2
	DECFSZ     R11+0, 1
	GOTO       L_moveLeft2
	NOP
	NOP
;led_knite_rider.c,5 :: 		}
	GOTO       L_moveLeft0
L_moveLeft1:
;led_knite_rider.c,7 :: 		}
	RETURN
; end of _moveLeft

_moveRight:

;led_knite_rider.c,8 :: 		void moveRight(){
;led_knite_rider.c,9 :: 		while(PORTB.B0 !=1){
L_moveRight3:
	BTFSC      PORTB+0, 0
	GOTO       L_moveRight4
;led_knite_rider.c,10 :: 		PORTB = PORTB/2;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;led_knite_rider.c,11 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_moveRight5:
	DECFSZ     R13+0, 1
	GOTO       L_moveRight5
	DECFSZ     R12+0, 1
	GOTO       L_moveRight5
	DECFSZ     R11+0, 1
	GOTO       L_moveRight5
	NOP
	NOP
;led_knite_rider.c,12 :: 		}
	GOTO       L_moveRight3
L_moveRight4:
;led_knite_rider.c,13 :: 		}
	RETURN
; end of _moveRight

_main:

;led_knite_rider.c,14 :: 		void main() {
;led_knite_rider.c,15 :: 		TRISB = 0;
	CLRF       TRISB+0
;led_knite_rider.c,16 :: 		PORTB = 255;
	MOVLW      255
	MOVWF      PORTB+0
;led_knite_rider.c,17 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;led_knite_rider.c,18 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;led_knite_rider.c,19 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
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
;led_knite_rider.c,20 :: 		while(1){
L_main8:
;led_knite_rider.c,21 :: 		moveLeft();
	CALL       _moveLeft+0
;led_knite_rider.c,22 :: 		moveRight();
	CALL       _moveRight+0
;led_knite_rider.c,23 :: 		}
	GOTO       L_main8
;led_knite_rider.c,24 :: 		}
	GOTO       $+0
; end of _main
