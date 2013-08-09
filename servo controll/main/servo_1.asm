
_servo_turn_clockwise:

;servo.h,17 :: 		void servo_turn_clockwise(){
;servo.h,18 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;servo.h,19 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_servo_turn_clockwise0:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_clockwise0
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_clockwise0
;servo.h,20 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;servo.h,21 :: 		delay_ms(19);
	MOVLW       124
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_servo_turn_clockwise1:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_clockwise1
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_clockwise1
;servo.h,22 :: 		}
	RETURN      0
; end of _servo_turn_clockwise

_servo_turn_anti_clockwise:

;servo.h,24 :: 		void servo_turn_anti_clockwise(){
;servo.h,25 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;servo.h,26 :: 		delay_ms(2);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_servo_turn_anti_clockwise2:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_anti_clockwise2
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_anti_clockwise2
	NOP
	NOP
;servo.h,27 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;servo.h,28 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_servo_turn_anti_clockwise3:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_anti_clockwise3
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_anti_clockwise3
;servo.h,29 :: 		}
	RETURN      0
; end of _servo_turn_anti_clockwise

_servo_turn_to_middle:

;servo.h,31 :: 		void servo_turn_to_middle(){
;servo.h,32 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;servo.h,33 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_servo_turn_to_middle4:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle4
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle4
;servo.h,34 :: 		delay_us(500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_servo_turn_to_middle5:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle5
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle5
	NOP
	NOP
;servo.h,35 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;servo.h,36 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_servo_turn_to_middle6:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle6
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle6
;servo.h,37 :: 		delay_us(500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_servo_turn_to_middle7:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle7
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle7
	NOP
	NOP
;servo.h,38 :: 		}
	RETURN      0
; end of _servo_turn_to_middle

_set_throw_position:

;servo.h,40 :: 		int set_throw_position(){
;servo.h,41 :: 		while(servo_reading < MAX_RESISTOR_VAL){
L_set_throw_position8:
	MOVLW       2
	SUBWF       _servo_reading+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_throw_position16
	MOVLW       188
	SUBWF       _servo_reading+0, 0 
L__set_throw_position16:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_throw_position9
;servo.h,42 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;servo.h,43 :: 		servo_turn_clockwise();
	CALL        _servo_turn_clockwise+0, 0
;servo.h,44 :: 		}
	GOTO        L_set_throw_position8
L_set_throw_position9:
;servo.h,45 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;servo.h,46 :: 		}
	RETURN      0
; end of _set_throw_position

_set_get_position:

;servo.h,48 :: 		int set_get_position(){
;servo.h,49 :: 		while(servo_reading > MIN_RESISTOR_VAL){
L_set_get_position10:
	MOVF        _servo_reading+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__set_get_position17
	MOVF        _servo_reading+0, 0 
	SUBLW       44
L__set_get_position17:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_get_position11
;servo.h,50 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;servo.h,51 :: 		servo_turn_anti_clockwise();
	CALL        _servo_turn_anti_clockwise+0, 0
;servo.h,52 :: 		}
	GOTO        L_set_get_position10
L_set_get_position11:
;servo.h,53 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;servo.h,54 :: 		}
	RETURN      0
; end of _set_get_position

_get_servo_reading:

;servo.h,56 :: 		int get_servo_reading(){
;servo.h,57 :: 		return ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;servo.h,58 :: 		}
	RETURN      0
; end of _get_servo_reading

_main:

;servo_1.c,12 :: 		void main() {
;servo_1.c,14 :: 		int a = 0;
	CLRF        main_a_L0+0 
	CLRF        main_a_L0+1 
;servo_1.c,15 :: 		initialize();
	CALL        _initialize+0, 0
;servo_1.c,16 :: 		while(1)
L_main12:
;servo_1.c,18 :: 		servo_reading = ADC_Read(RES_PIN);   // Get 10-bit results of AD conversion
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;servo_1.c,19 :: 		PORTD = servo_reading;
	MOVF        R0, 0 
	MOVWF       PORTD+0 
;servo_1.c,20 :: 		PORTE = servo_reading/256;
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       PORTE+0 
;servo_1.c,22 :: 		if(servo_reading >=700)
	MOVLW       2
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       188
	SUBWF       R0, 0 
L__main18:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
;servo_1.c,23 :: 		servo_turn_anti_clockwise();
	CALL        _servo_turn_anti_clockwise+0, 0
	GOTO        L_main15
L_main14:
;servo_1.c,25 :: 		servo_turn_clockwise();
	CALL        _servo_turn_clockwise+0, 0
L_main15:
;servo_1.c,28 :: 		}
	GOTO        L_main12
;servo_1.c,29 :: 		}
	GOTO        $+0
; end of _main

_initialize:

;servo_1.c,31 :: 		void initialize(){
;servo_1.c,33 :: 		ADCON1 = 0b01000000;
	MOVLW       64
	MOVWF       ADCON1+0 
;servo_1.c,34 :: 		TRISA = 255;
	MOVLW       255
	MOVWF       TRISA+0 
;servo_1.c,35 :: 		PORTA = 0;
	CLRF        PORTA+0 
;servo_1.c,36 :: 		PORTB = 0;
	CLRF        PORTB+0 
;servo_1.c,37 :: 		TRISB = 0;
	CLRF        TRISB+0 
;servo_1.c,38 :: 		TRISD = 0;
	CLRF        TRISD+0 
;servo_1.c,39 :: 		TRISE = 0;
	CLRF        TRISE+0 
;servo_1.c,40 :: 		}
	RETURN      0
; end of _initialize
