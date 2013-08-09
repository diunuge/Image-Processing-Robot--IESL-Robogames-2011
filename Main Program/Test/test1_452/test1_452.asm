
_M1_foward:

;motion.h,50 :: 		void M1_foward(){
;motion.h,51 :: 		M1_F = 1;
	BSF         PORTD+0, 0 
;motion.h,52 :: 		M1_R = 0;
	BCF         PORTD+0, 1 
;motion.h,53 :: 		}
	RETURN      0
; end of _M1_foward

_M1_reverse:

;motion.h,55 :: 		void M1_reverse(){
;motion.h,56 :: 		M1_F = 0;
	BCF         PORTD+0, 0 
;motion.h,57 :: 		M1_R = 1;
	BSF         PORTD+0, 1 
;motion.h,58 :: 		}
	RETURN      0
; end of _M1_reverse

_M1_stop:

;motion.h,60 :: 		void M1_stop(){
;motion.h,61 :: 		M1_F = 0;
	BCF         PORTD+0, 0 
;motion.h,62 :: 		M1_R = 0;
	BCF         PORTD+0, 1 
;motion.h,63 :: 		}
	RETURN      0
; end of _M1_stop

_M2_foward:

;motion.h,65 :: 		void M2_foward(){
;motion.h,66 :: 		M2_F = 1;
	BSF         PORTC+0, 0 
;motion.h,67 :: 		M2_R = 0;
	BCF         PORTC+0, 3 
;motion.h,68 :: 		}
	RETURN      0
; end of _M2_foward

_M2_reverse:

;motion.h,70 :: 		void M2_reverse(){
;motion.h,71 :: 		M2_F = 0;
	BCF         PORTC+0, 0 
;motion.h,72 :: 		M2_R = 1;
	BSF         PORTC+0, 3 
;motion.h,73 :: 		}
	RETURN      0
; end of _M2_reverse

_M2_stop:

;motion.h,75 :: 		void M2_stop(){
;motion.h,76 :: 		M2_F = 0;
	BCF         PORTC+0, 0 
;motion.h,77 :: 		M2_R = 0;
	BCF         PORTC+0, 3 
;motion.h,78 :: 		}
	RETURN      0
; end of _M2_stop

_M3_foward:

;motion.h,80 :: 		void M3_foward(){
;motion.h,81 :: 		M3_F = 1;
	BSF         PORTC+0, 4 
;motion.h,82 :: 		M3_R = 0;
	BCF         PORTC+0, 5 
;motion.h,83 :: 		}
	RETURN      0
; end of _M3_foward

_M3_reverse:

;motion.h,85 :: 		void M3_reverse(){
;motion.h,86 :: 		M3_F = 0;
	BCF         PORTC+0, 4 
;motion.h,87 :: 		M3_R = 1;
	BSF         PORTC+0, 5 
;motion.h,88 :: 		}
	RETURN      0
; end of _M3_reverse

_M3_stop:

;motion.h,90 :: 		void M3_stop(){
;motion.h,91 :: 		M3_F = 0;
	BCF         PORTC+0, 4 
;motion.h,92 :: 		M3_R = 0;
	BCF         PORTC+0, 5 
;motion.h,93 :: 		}
	RETURN      0
; end of _M3_stop

_M4_foward:

;motion.h,95 :: 		void M4_foward(){
;motion.h,96 :: 		M4_F = 1;
	BSF         PORTD+0, 3 
;motion.h,97 :: 		M4_R = 0;
	BCF         PORTD+0, 2 
;motion.h,98 :: 		}
	RETURN      0
; end of _M4_foward

_M4_reverse:

;motion.h,100 :: 		void M4_reverse(){
;motion.h,101 :: 		M4_F = 0;
	BCF         PORTD+0, 3 
;motion.h,102 :: 		M4_R = 1;
	BSF         PORTD+0, 2 
;motion.h,103 :: 		}
	RETURN      0
; end of _M4_reverse

_M4_stop:

;motion.h,105 :: 		void M4_stop(){
;motion.h,106 :: 		M4_F = 0;
	BCF         PORTD+0, 3 
;motion.h,107 :: 		M4_R = 0;
	BCF         PORTD+0, 2 
;motion.h,108 :: 		}
	RETURN      0
; end of _M4_stop

_foward_Y_set:

;motion.h,110 :: 		void foward_Y_set(){
;motion.h,111 :: 		M1_foward();
	CALL        _M1_foward+0, 0
;motion.h,112 :: 		M3_foward();
	CALL        _M3_foward+0, 0
;motion.h,113 :: 		}
	RETURN      0
; end of _foward_Y_set

_foward_X_set:

;motion.h,115 :: 		void foward_X_set(){
;motion.h,116 :: 		M2_foward();
	CALL        _M2_foward+0, 0
;motion.h,117 :: 		M4_foward();
	CALL        _M4_foward+0, 0
;motion.h,118 :: 		}
	RETURN      0
; end of _foward_X_set

_reverse_Y_set:

;motion.h,120 :: 		void reverse_Y_set(){
;motion.h,121 :: 		M1_reverse();
	CALL        _M1_reverse+0, 0
;motion.h,122 :: 		M3_reverse();
	CALL        _M3_reverse+0, 0
;motion.h,123 :: 		}
	RETURN      0
; end of _reverse_Y_set

_reverse_X_set:

;motion.h,125 :: 		void reverse_X_set(){
;motion.h,126 :: 		M2_reverse();
	CALL        _M2_reverse+0, 0
;motion.h,127 :: 		M4_reverse();
	CALL        _M4_reverse+0, 0
;motion.h,128 :: 		}
	RETURN      0
; end of _reverse_X_set

_foward_Y:

;motion.h,130 :: 		void foward_Y(int pwmY){
;motion.h,131 :: 		foward_Y_set();
	CALL        _foward_Y_set+0, 0
;motion.h,132 :: 		PWM2_Set_Duty(pwmY);
	MOVF        FARG_foward_Y_pwmY+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,133 :: 		}
	RETURN      0
; end of _foward_Y

_foward_X:

;motion.h,135 :: 		void foward_X(int pwmX){
;motion.h,136 :: 		foward_X_set();
	CALL        _foward_X_set+0, 0
;motion.h,137 :: 		PWM1_Set_Duty(pwmX);
	MOVF        FARG_foward_X_pwmX+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,138 :: 		}
	RETURN      0
; end of _foward_X

_reverse_Y:

;motion.h,140 :: 		void reverse_Y(int pwmY){
;motion.h,141 :: 		reverse_Y_set();
	CALL        _reverse_Y_set+0, 0
;motion.h,142 :: 		PWM2_Set_Duty(pwmY);
	MOVF        FARG_reverse_Y_pwmY+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,143 :: 		}
	RETURN      0
; end of _reverse_Y

_reverse_X:

;motion.h,145 :: 		void reverse_X(int pwmX){
;motion.h,146 :: 		reverse_X_set();
	CALL        _reverse_X_set+0, 0
;motion.h,147 :: 		PWM1_Set_Duty(pwmX);
	MOVF        FARG_reverse_X_pwmX+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,148 :: 		}
	RETURN      0
; end of _reverse_X

_stop:

;motion.h,150 :: 		void stop(){
;motion.h,151 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,152 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,153 :: 		}
	RETURN      0
; end of _stop

_rotate_clockwise:

;motion.h,155 :: 		void rotate_clockwise(int PWM){
;motion.h,156 :: 		M1_reverse();
	CALL        _M1_reverse+0, 0
;motion.h,157 :: 		M2_foward();
	CALL        _M2_foward+0, 0
;motion.h,158 :: 		M3_foward();
	CALL        _M3_foward+0, 0
;motion.h,159 :: 		M4_reverse();
	CALL        _M4_reverse+0, 0
;motion.h,160 :: 		PWM1_Set_Duty(PWM);
	MOVF        FARG_rotate_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,161 :: 		PWM2_Set_Duty(PWM);
	MOVF        FARG_rotate_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,162 :: 		}
	RETURN      0
; end of _rotate_clockwise

_rotate_anti_clockwise:

;motion.h,164 :: 		void rotate_anti_clockwise(int PWM){
;motion.h,165 :: 		M1_foward();
	CALL        _M1_foward+0, 0
;motion.h,166 :: 		M2_reverse();
	CALL        _M2_reverse+0, 0
;motion.h,167 :: 		M3_reverse();
	CALL        _M3_reverse+0, 0
;motion.h,168 :: 		M4_foward();
	CALL        _M4_foward+0, 0
;motion.h,169 :: 		PWM1_Set_Duty(PWM);
	MOVF        FARG_rotate_anti_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,170 :: 		PWM2_Set_Duty(PWM);
	MOVF        FARG_rotate_anti_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,171 :: 		}
	RETURN      0
; end of _rotate_anti_clockwise

_go_0:

;motion.h,174 :: 		void go_0(){
;motion.h,175 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,176 :: 		foward_Y(0);
	CLRF        FARG_foward_Y_pwmY+0 
	CLRF        FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,177 :: 		PORTB = 1;
	MOVLW       1
	MOVWF       PORTB+0 
;motion.h,178 :: 		}
	RETURN      0
; end of _go_0

_go_45:

;motion.h,180 :: 		void go_45(){
;motion.h,181 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,182 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,183 :: 		PORTB = 2;
	MOVLW       2
	MOVWF       PORTB+0 
;motion.h,184 :: 		}
	RETURN      0
; end of _go_45

_go_90:

;motion.h,186 :: 		void go_90(){
;motion.h,187 :: 		foward_X(0);
	CLRF        FARG_foward_X_pwmX+0 
	CLRF        FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,188 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,189 :: 		PORTB = 4;
	MOVLW       4
	MOVWF       PORTB+0 
;motion.h,190 :: 		}
	RETURN      0
; end of _go_90

_go_135:

;motion.h,192 :: 		void go_135(){
;motion.h,193 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,194 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,195 :: 		PORTB = 8;
	MOVLW       8
	MOVWF       PORTB+0 
;motion.h,196 :: 		}
	RETURN      0
; end of _go_135

_go_180:

;motion.h,198 :: 		void go_180(){
;motion.h,199 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,200 :: 		foward_Y(0);
	CLRF        FARG_foward_Y_pwmY+0 
	CLRF        FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,201 :: 		PORTB = 16;
	MOVLW       16
	MOVWF       PORTB+0 
;motion.h,202 :: 		}
	RETURN      0
; end of _go_180

_go_225:

;motion.h,204 :: 		void go_225(){
;motion.h,205 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,206 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,207 :: 		PORTB = 32;
	MOVLW       32
	MOVWF       PORTB+0 
;motion.h,208 :: 		}
	RETURN      0
; end of _go_225

_go_270:

;motion.h,210 :: 		void go_270(){
;motion.h,211 :: 		reverse_X(0);
	CLRF        FARG_reverse_X_pwmX+0 
	CLRF        FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,212 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,213 :: 		PORTB = 64;
	MOVLW       64
	MOVWF       PORTB+0 
;motion.h,214 :: 		}
	RETURN      0
; end of _go_270

_go_315:

;motion.h,216 :: 		void go_315(){
;motion.h,217 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,218 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,219 :: 		PORTB = 128;
	MOVLW       128
	MOVWF       PORTB+0 
;motion.h,220 :: 		}
	RETURN      0
; end of _go_315

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
	GOTO        L__set_throw_position38
	MOVLW       188
	SUBWF       _servo_reading+0, 0 
L__set_throw_position38:
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
	GOTO        L__set_get_position39
	MOVF        _servo_reading+0, 0 
	SUBLW       44
L__set_get_position39:
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

_initialize_bluetooth:

;bluetooth.h,9 :: 		void initialize_bluetooth(){
;bluetooth.h,10 :: 		error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
	MOVLW       PORTC+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       7
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       6
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
	MOVF        R0, 0 
	MOVWF       _error+0 
;bluetooth.h,11 :: 		}
	RETURN      0
; end of _initialize_bluetooth

_test_bluetooth:

;bluetooth.h,13 :: 		void test_bluetooth(){
;bluetooth.h,14 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	MOVLW       122
	MOVWF       _i+0 
L_test_bluetooth12:
	MOVLW       65
	SUBWF       _i+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_test_bluetooth13
;bluetooth.h,15 :: 		Soft_UART_Write(i);
	MOVF        _i+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;bluetooth.h,16 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_test_bluetooth15:
	DECFSZ      R13, 1, 0
	BRA         L_test_bluetooth15
	DECFSZ      R12, 1, 0
	BRA         L_test_bluetooth15
	DECFSZ      R11, 1, 0
	BRA         L_test_bluetooth15
	NOP
	NOP
;bluetooth.h,14 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	DECF        _i+0, 1 
;bluetooth.h,17 :: 		}
	GOTO        L_test_bluetooth12
L_test_bluetooth13:
;bluetooth.h,18 :: 		}
	RETURN      0
; end of _test_bluetooth

_recieve_command:

;bluetooth.h,20 :: 		char recieve_command(){
;bluetooth.h,21 :: 		return byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;bluetooth.h,22 :: 		}
	RETURN      0
; end of _recieve_command

_send_command:

;bluetooth.h,24 :: 		void  send_command(char command){
;bluetooth.h,25 :: 		Soft_UART_Write(command);
	MOVF        FARG_send_command_command+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;bluetooth.h,26 :: 		}
	RETURN      0
; end of _send_command

_main:

;test1_452.c,9 :: 		void main() {
;test1_452.c,10 :: 		Initialize();
	CALL        _Initialize+0, 0
;test1_452.c,11 :: 		initialize_bluetooth();
	CALL        _initialize_bluetooth+0, 0
;test1_452.c,12 :: 		test_bluetooth();
	CALL        _test_bluetooth+0, 0
;test1_452.c,13 :: 		while(1){
L_main16:
;test1_452.c,14 :: 		command = recieve_command();
	CALL        _recieve_command+0, 0
	MOVF        R0, 0 
	MOVWF       _command+0 
;test1_452.c,16 :: 		switch(command){
	GOTO        L_main18
;test1_452.c,17 :: 		case 'A' :
L_main20:
;test1_452.c,18 :: 		go_0();
	CALL        _go_0+0, 0
;test1_452.c,19 :: 		break;
	GOTO        L_main19
;test1_452.c,21 :: 		case 'B' :
L_main21:
;test1_452.c,22 :: 		go_90();
	CALL        _go_90+0, 0
;test1_452.c,23 :: 		break;
	GOTO        L_main19
;test1_452.c,25 :: 		case 'C' :
L_main22:
;test1_452.c,26 :: 		go_180();
	CALL        _go_180+0, 0
;test1_452.c,27 :: 		break;
	GOTO        L_main19
;test1_452.c,29 :: 		case 'D' :
L_main23:
;test1_452.c,30 :: 		go_270();
	CALL        _go_270+0, 0
;test1_452.c,31 :: 		break;
	GOTO        L_main19
;test1_452.c,33 :: 		case 'E' :
L_main24:
;test1_452.c,34 :: 		go_45();
	CALL        _go_45+0, 0
;test1_452.c,35 :: 		break;
	GOTO        L_main19
;test1_452.c,37 :: 		case 'F' :
L_main25:
;test1_452.c,38 :: 		go_135();
	CALL        _go_135+0, 0
;test1_452.c,39 :: 		break;
	GOTO        L_main19
;test1_452.c,40 :: 		case 'G' :
L_main26:
;test1_452.c,41 :: 		go_225();
	CALL        _go_225+0, 0
;test1_452.c,42 :: 		break;
	GOTO        L_main19
;test1_452.c,44 :: 		case 'H' :
L_main27:
;test1_452.c,45 :: 		go_315();
	CALL        _go_315+0, 0
;test1_452.c,46 :: 		break;
	GOTO        L_main19
;test1_452.c,48 :: 		case 'S' :
L_main28:
;test1_452.c,49 :: 		stop();
	CALL        _stop+0, 0
;test1_452.c,50 :: 		break;
	GOTO        L_main19
;test1_452.c,52 :: 		case 'J' :
L_main29:
;test1_452.c,53 :: 		rotate_clockwise(255);
	MOVLW       255
	MOVWF       FARG_rotate_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_clockwise_PWM+1 
	CALL        _rotate_clockwise+0, 0
;test1_452.c,54 :: 		break;
	GOTO        L_main19
;test1_452.c,56 :: 		case 'K' :
L_main30:
;test1_452.c,57 :: 		rotate_anti_clockwise(255);
	MOVLW       255
	MOVWF       FARG_rotate_anti_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_anti_clockwise_PWM+1 
	CALL        _rotate_anti_clockwise+0, 0
;test1_452.c,58 :: 		break;
	GOTO        L_main19
;test1_452.c,60 :: 		case 'L' :
L_main31:
;test1_452.c,61 :: 		rotate_clockwise(180);
	MOVLW       180
	MOVWF       FARG_rotate_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_clockwise_PWM+1 
	CALL        _rotate_clockwise+0, 0
;test1_452.c,62 :: 		break;
	GOTO        L_main19
;test1_452.c,64 :: 		case 'M' :
L_main32:
;test1_452.c,65 :: 		rotate_anti_clockwise(180);
	MOVLW       180
	MOVWF       FARG_rotate_anti_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_anti_clockwise_PWM+1 
	CALL        _rotate_anti_clockwise+0, 0
;test1_452.c,66 :: 		break;
	GOTO        L_main19
;test1_452.c,69 :: 		case 'c' :     //catch ball
L_main33:
;test1_452.c,71 :: 		break;
	GOTO        L_main19
;test1_452.c,73 :: 		case 's' :     //shoot ball
L_main34:
;test1_452.c,75 :: 		break;
	GOTO        L_main19
;test1_452.c,77 :: 		case 'Z' :     //game over
L_main35:
;test1_452.c,78 :: 		stop();
	CALL        _stop+0, 0
;test1_452.c,79 :: 		break;
	GOTO        L_main19
;test1_452.c,81 :: 		case 'W' :     //won
L_main36:
;test1_452.c,82 :: 		dance();
	CALL        _dance+0, 0
;test1_452.c,83 :: 		break;
	GOTO        L_main19
;test1_452.c,85 :: 		default  :
L_main37:
;test1_452.c,86 :: 		break;
	GOTO        L_main19
;test1_452.c,87 :: 		}
L_main18:
	MOVF        _command+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _command+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _command+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
	MOVF        _command+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
	MOVF        _command+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _command+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
	MOVF        _command+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
	MOVF        _command+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
	MOVF        _command+0, 0 
	XORLW       83
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	MOVF        _command+0, 0 
	XORLW       74
	BTFSC       STATUS+0, 2 
	GOTO        L_main29
	MOVF        _command+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVF        _command+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
	MOVF        _command+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
	MOVF        _command+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main33
	MOVF        _command+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_main34
	MOVF        _command+0, 0 
	XORLW       90
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
	MOVF        _command+0, 0 
	XORLW       87
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	GOTO        L_main37
L_main19:
;test1_452.c,88 :: 		}
	GOTO        L_main16
;test1_452.c,89 :: 		}
	GOTO        $+0
; end of _main

_Initialize:

;test1_452.c,91 :: 		void Initialize(){
;test1_452.c,93 :: 		ADCON0 = 0b01000000;
	MOVLW       64
	MOVWF       ADCON0+0 
;test1_452.c,95 :: 		TRISA = 255;
	MOVLW       255
	MOVWF       TRISA+0 
;test1_452.c,96 :: 		PORTA = 0;
	CLRF        PORTA+0 
;test1_452.c,97 :: 		TRISB = 0;
	CLRF        TRISB+0 
;test1_452.c,98 :: 		PORTB = 0;
	CLRF        PORTB+0 
;test1_452.c,99 :: 		TRISC = 0;
	CLRF        TRISC+0 
;test1_452.c,100 :: 		PORTC = 0;
	CLRF        PORTC+0 
;test1_452.c,101 :: 		TRISD = 0;
	CLRF        TRISD+0 
;test1_452.c,102 :: 		PORTD = 0;
	CLRF        PORTD+0 
;test1_452.c,105 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;test1_452.c,106 :: 		PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;test1_452.c,107 :: 		PWM1_Start();                       // start PWM1
	CALL        _PWM1_Start+0, 0
;test1_452.c,108 :: 		PWM2_Start();                       // start PWM2
	CALL        _PWM2_Start+0, 0
;test1_452.c,110 :: 		}
	RETURN      0
; end of _Initialize

_dance:

;test1_452.c,112 :: 		void dance(){
;test1_452.c,114 :: 		}
	RETURN      0
; end of _dance
