
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
;motion.h,132 :: 		PWM1_Set_Duty(pwmY);
	MOVF        FARG_foward_Y_pwmY+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,133 :: 		}
	RETURN      0
; end of _foward_Y

_foward_X:

;motion.h,135 :: 		void foward_X(int pwmX){
;motion.h,136 :: 		foward_X_set();
	CALL        _foward_X_set+0, 0
;motion.h,137 :: 		PWM2_Set_Duty(pwmX);
	MOVF        FARG_foward_X_pwmX+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,138 :: 		}
	RETURN      0
; end of _foward_X

_reverse_Y:

;motion.h,140 :: 		void reverse_Y(int pwmY){
;motion.h,141 :: 		reverse_Y_set();
	CALL        _reverse_Y_set+0, 0
;motion.h,142 :: 		PWM1_Set_Duty(pwmY);
	MOVF        FARG_reverse_Y_pwmY+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,143 :: 		}
	RETURN      0
; end of _reverse_Y

_reverse_X:

;motion.h,145 :: 		void reverse_X(int pwmX){
;motion.h,146 :: 		reverse_X_set();
	CALL        _reverse_X_set+0, 0
;motion.h,147 :: 		PWM2_Set_Duty(pwmX);
	MOVF        FARG_reverse_X_pwmX+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
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
;motion.h,177 :: 		}
	RETURN      0
; end of _go_0

_go_45:

;motion.h,179 :: 		void go_45(){
;motion.h,180 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,181 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,182 :: 		}
	RETURN      0
; end of _go_45

_go_90:

;motion.h,184 :: 		void go_90(){
;motion.h,185 :: 		foward_X(0);
	CLRF        FARG_foward_X_pwmX+0 
	CLRF        FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,186 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,187 :: 		}
	RETURN      0
; end of _go_90

_go_135:

;motion.h,189 :: 		void go_135(){
;motion.h,190 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,191 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,192 :: 		}
	RETURN      0
; end of _go_135

_go_180:

;motion.h,194 :: 		void go_180(){
;motion.h,195 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,196 :: 		foward_Y(0);
	CLRF        FARG_foward_Y_pwmY+0 
	CLRF        FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,197 :: 		}
	RETURN      0
; end of _go_180

_go_225:

;motion.h,199 :: 		void go_225(){
;motion.h,200 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,201 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,202 :: 		}
	RETURN      0
; end of _go_225

_go_270:

;motion.h,204 :: 		void go_270(){
;motion.h,205 :: 		reverse_X(0);
	CLRF        FARG_reverse_X_pwmX+0 
	CLRF        FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,206 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,207 :: 		PORTB = 64;
	MOVLW       64
	MOVWF       PORTB+0 
;motion.h,208 :: 		}
	RETURN      0
; end of _go_270

_go_315:

;motion.h,210 :: 		void go_315(){
;motion.h,211 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,212 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,213 :: 		}
	RETURN      0
; end of _go_315

_initialize_bluetooth:

;bluetooth.h,10 :: 		void initialize_bluetooth(){
;bluetooth.h,11 :: 		error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
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
;bluetooth.h,12 :: 		}
	RETURN      0
; end of _initialize_bluetooth

_short_test_bluetooth:

;bluetooth.h,14 :: 		void short_test_bluetooth(){
;bluetooth.h,15 :: 		Soft_UART_Write('A');
	MOVLW       65
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;bluetooth.h,16 :: 		}
	RETURN      0
; end of _short_test_bluetooth

_test_bluetooth:

;bluetooth.h,18 :: 		void test_bluetooth(){
;bluetooth.h,19 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	MOVLW       122
	MOVWF       _i+0 
L_test_bluetooth0:
	MOVLW       65
	SUBWF       _i+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_test_bluetooth1
;bluetooth.h,20 :: 		Soft_UART_Write(i);
	MOVF        _i+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;bluetooth.h,21 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_test_bluetooth3:
	DECFSZ      R13, 1, 0
	BRA         L_test_bluetooth3
	DECFSZ      R12, 1, 0
	BRA         L_test_bluetooth3
	DECFSZ      R11, 1, 0
	BRA         L_test_bluetooth3
	NOP
	NOP
;bluetooth.h,19 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	DECF        _i+0, 1 
;bluetooth.h,22 :: 		}
	GOTO        L_test_bluetooth0
L_test_bluetooth1:
;bluetooth.h,23 :: 		}
	RETURN      0
; end of _test_bluetooth

_recieve_command:

;bluetooth.h,25 :: 		char recieve_command(){
;bluetooth.h,26 :: 		return byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
	MOVLW       _error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;bluetooth.h,27 :: 		}
	RETURN      0
; end of _recieve_command

_send_command:

;bluetooth.h,29 :: 		void  send_command(char command){
;bluetooth.h,30 :: 		Soft_UART_Write(command);
	MOVF        FARG_send_command_command+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;bluetooth.h,31 :: 		}
	RETURN      0
; end of _send_command

_servo_turn_clockwise:

;hand.h,25 :: 		void servo_turn_clockwise(){
;hand.h,26 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;hand.h,27 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_servo_turn_clockwise4:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_clockwise4
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_clockwise4
;hand.h,28 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;hand.h,29 :: 		delay_ms(19);
	MOVLW       124
	MOVWF       R12, 0
	MOVLW       95
	MOVWF       R13, 0
L_servo_turn_clockwise5:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_clockwise5
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_clockwise5
;hand.h,30 :: 		}
	RETURN      0
; end of _servo_turn_clockwise

_servo_turn_anti_clockwise:

;hand.h,32 :: 		void servo_turn_anti_clockwise(){
;hand.h,33 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;hand.h,34 :: 		delay_ms(2);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_servo_turn_anti_clockwise6:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_anti_clockwise6
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_anti_clockwise6
	NOP
	NOP
;hand.h,35 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;hand.h,36 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_servo_turn_anti_clockwise7:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_anti_clockwise7
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_anti_clockwise7
;hand.h,37 :: 		}
	RETURN      0
; end of _servo_turn_anti_clockwise

_servo_turn_to_middle:

;hand.h,39 :: 		void servo_turn_to_middle(){
;hand.h,40 :: 		servo_pin = 1;
	BSF         PORTB+0, 0 
;hand.h,41 :: 		delay_ms(1);
	MOVLW       7
	MOVWF       R12, 0
	MOVLW       125
	MOVWF       R13, 0
L_servo_turn_to_middle8:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle8
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle8
;hand.h,42 :: 		delay_us(500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_servo_turn_to_middle9:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle9
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle9
	NOP
	NOP
;hand.h,43 :: 		servo_pin = 0;
	BCF         PORTB+0, 0 
;hand.h,44 :: 		delay_ms(18);
	MOVLW       117
	MOVWF       R12, 0
	MOVLW       225
	MOVWF       R13, 0
L_servo_turn_to_middle10:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle10
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle10
;hand.h,45 :: 		delay_us(500);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       61
	MOVWF       R13, 0
L_servo_turn_to_middle11:
	DECFSZ      R13, 1, 0
	BRA         L_servo_turn_to_middle11
	DECFSZ      R12, 1, 0
	BRA         L_servo_turn_to_middle11
	NOP
	NOP
;hand.h,46 :: 		}
	RETURN      0
; end of _servo_turn_to_middle

_set_throw_position:

;hand.h,48 :: 		int set_throw_position(){
;hand.h,49 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;hand.h,50 :: 		while(servo_reading < MAX_RESISTOR_VAL){
L_set_throw_position12:
	MOVLW       2
	SUBWF       _servo_reading+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_throw_position47
	MOVLW       188
	SUBWF       _servo_reading+0, 0 
L__set_throw_position47:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_throw_position13
;hand.h,51 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;hand.h,52 :: 		servo_turn_clockwise();
	CALL        _servo_turn_clockwise+0, 0
;hand.h,53 :: 		}
	GOTO        L_set_throw_position12
L_set_throw_position13:
;hand.h,54 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;hand.h,55 :: 		}
	RETURN      0
; end of _set_throw_position

_set_get_position:

;hand.h,57 :: 		int set_get_position(){
;hand.h,58 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;hand.h,59 :: 		while(servo_reading > MIN_RESISTOR_VAL){
L_set_get_position14:
	MOVF        _servo_reading+1, 0 
	SUBLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__set_get_position48
	MOVF        _servo_reading+0, 0 
	SUBLW       44
L__set_get_position48:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_get_position15
;hand.h,60 :: 		servo_reading = get_servo_reading();
	CALL        _get_servo_reading+0, 0
	MOVF        R0, 0 
	MOVWF       _servo_reading+0 
	MOVF        R1, 0 
	MOVWF       _servo_reading+1 
;hand.h,61 :: 		servo_turn_anti_clockwise();
	CALL        _servo_turn_anti_clockwise+0, 0
;hand.h,62 :: 		}
	GOTO        L_set_get_position14
L_set_get_position15:
;hand.h,63 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;hand.h,64 :: 		}
	RETURN      0
; end of _set_get_position

_get_servo_reading:

;hand.h,66 :: 		int get_servo_reading(){
;hand.h,67 :: 		return ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;hand.h,68 :: 		}
	RETURN      0
; end of _get_servo_reading

_catch_ball:

;hand.h,70 :: 		void catch_ball(){
;hand.h,71 :: 		set_get_position();
	CALL        _set_get_position+0, 0
;hand.h,72 :: 		while(!SENCE_PIN);
L_catch_ball16:
	BTFSC       PORTB+0, 2 
	GOTO        L_catch_ball17
	GOTO        L_catch_ball16
L_catch_ball17:
;hand.h,74 :: 		set_throw_position();
	CALL        _set_throw_position+0, 0
;hand.h,75 :: 		}
	RETURN      0
; end of _catch_ball

_shoot:

;hand.h,77 :: 		void shoot(){
;hand.h,78 :: 		SHOOT_PIN = 1;
	BSF         PORTB+0, 1 
;hand.h,79 :: 		delay_ms(SHOOT_TIME);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_shoot18:
	DECFSZ      R13, 1, 0
	BRA         L_shoot18
	DECFSZ      R12, 1, 0
	BRA         L_shoot18
	DECFSZ      R11, 1, 0
	BRA         L_shoot18
	NOP
	NOP
;hand.h,80 :: 		SHOOT_PIN = 0;
	BCF         PORTB+0, 1 
;hand.h,81 :: 		}
	RETURN      0
; end of _shoot

_main:

;last_1.c,10 :: 		void main() {
;last_1.c,12 :: 		initialize();
	CALL        _initialize+0, 0
;last_1.c,13 :: 		initialize_bluetooth();
	CALL        _initialize_bluetooth+0, 0
;last_1.c,14 :: 		short_test_bluetooth();
	CALL        _short_test_bluetooth+0, 0
;last_1.c,15 :: 		while(1){
L_main19:
;last_1.c,17 :: 		if(SENCE_PIN == 1){
	BTFSS       PORTB+0, 2 
	GOTO        L_main21
;last_1.c,18 :: 		set_throw_position();
	CALL        _set_throw_position+0, 0
;last_1.c,19 :: 		send_command('h');
	MOVLW       104
	MOVWF       FARG_send_command_command+0 
	CALL        _send_command+0, 0
;last_1.c,20 :: 		}
L_main21:
;last_1.c,21 :: 		command = recieve_command();
	CALL        _recieve_command+0, 0
	MOVF        R0, 0 
	MOVWF       _command+0 
;last_1.c,23 :: 		switch(command){
	GOTO        L_main22
;last_1.c,24 :: 		case 'A' :
L_main24:
;last_1.c,25 :: 		go_0();
	CALL        _go_0+0, 0
;last_1.c,26 :: 		break;
	GOTO        L_main23
;last_1.c,28 :: 		case 'B' :
L_main25:
;last_1.c,29 :: 		go_90();
	CALL        _go_90+0, 0
;last_1.c,30 :: 		break;
	GOTO        L_main23
;last_1.c,32 :: 		case 'C' :
L_main26:
;last_1.c,33 :: 		go_180();
	CALL        _go_180+0, 0
;last_1.c,34 :: 		break;
	GOTO        L_main23
;last_1.c,36 :: 		case 'D' :
L_main27:
;last_1.c,37 :: 		go_270();
	CALL        _go_270+0, 0
;last_1.c,38 :: 		break;
	GOTO        L_main23
;last_1.c,40 :: 		case 'E' :
L_main28:
;last_1.c,41 :: 		go_45();
	CALL        _go_45+0, 0
;last_1.c,42 :: 		break;
	GOTO        L_main23
;last_1.c,44 :: 		case 'F' :
L_main29:
;last_1.c,45 :: 		go_135();
	CALL        _go_135+0, 0
;last_1.c,46 :: 		break;
	GOTO        L_main23
;last_1.c,47 :: 		case 'G' :
L_main30:
;last_1.c,48 :: 		go_225();
	CALL        _go_225+0, 0
;last_1.c,49 :: 		break;
	GOTO        L_main23
;last_1.c,51 :: 		case 'H' :
L_main31:
;last_1.c,52 :: 		go_315();
	CALL        _go_315+0, 0
;last_1.c,53 :: 		break;
	GOTO        L_main23
;last_1.c,55 :: 		case 'S' :
L_main32:
;last_1.c,56 :: 		stop();
	CALL        _stop+0, 0
;last_1.c,57 :: 		break;
	GOTO        L_main23
;last_1.c,59 :: 		case 'J' :
L_main33:
;last_1.c,60 :: 		rotate_clockwise(255);
	MOVLW       255
	MOVWF       FARG_rotate_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_clockwise_PWM+1 
	CALL        _rotate_clockwise+0, 0
;last_1.c,61 :: 		break;
	GOTO        L_main23
;last_1.c,63 :: 		case 'K' :
L_main34:
;last_1.c,64 :: 		rotate_anti_clockwise(255);
	MOVLW       255
	MOVWF       FARG_rotate_anti_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_anti_clockwise_PWM+1 
	CALL        _rotate_anti_clockwise+0, 0
;last_1.c,65 :: 		break;
	GOTO        L_main23
;last_1.c,67 :: 		case 'L' :
L_main35:
;last_1.c,68 :: 		rotate_clockwise(180);
	MOVLW       180
	MOVWF       FARG_rotate_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_clockwise_PWM+1 
	CALL        _rotate_clockwise+0, 0
;last_1.c,69 :: 		break;
	GOTO        L_main23
;last_1.c,71 :: 		case 'M' :
L_main36:
;last_1.c,72 :: 		rotate_anti_clockwise(180);
	MOVLW       180
	MOVWF       FARG_rotate_anti_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_anti_clockwise_PWM+1 
	CALL        _rotate_anti_clockwise+0, 0
;last_1.c,73 :: 		break;
	GOTO        L_main23
;last_1.c,76 :: 		case 'O' :
L_main37:
;last_1.c,77 :: 		set_get_position();
	CALL        _set_get_position+0, 0
;last_1.c,79 :: 		case 'P' :
L_main38:
;last_1.c,80 :: 		set_throw_position();
	CALL        _set_throw_position+0, 0
;last_1.c,82 :: 		case 'c' :     //catch ball
L_main39:
;last_1.c,83 :: 		catch_ball();
	CALL        _catch_ball+0, 0
;last_1.c,84 :: 		break;
	GOTO        L_main23
;last_1.c,86 :: 		case 's' :     //shoot ball
L_main40:
;last_1.c,87 :: 		shoot();
	CALL        _shoot+0, 0
;last_1.c,88 :: 		break;
	GOTO        L_main23
;last_1.c,90 :: 		case 't' :
L_main41:
;last_1.c,91 :: 		servo_turn_clockwise();
	CALL        _servo_turn_clockwise+0, 0
;last_1.c,92 :: 		break;
	GOTO        L_main23
;last_1.c,94 :: 		case 'u' :
L_main42:
;last_1.c,95 :: 		servo_turn_anti_clockwise();
	CALL        _servo_turn_anti_clockwise+0, 0
;last_1.c,96 :: 		break;
	GOTO        L_main23
;last_1.c,98 :: 		case 'v' :
L_main43:
;last_1.c,99 :: 		servo_turn_to_middle();
	CALL        _servo_turn_to_middle+0, 0
;last_1.c,100 :: 		break;
	GOTO        L_main23
;last_1.c,102 :: 		case 'Z' :     //game over
L_main44:
;last_1.c,103 :: 		stop();
	CALL        _stop+0, 0
;last_1.c,104 :: 		break;
	GOTO        L_main23
;last_1.c,106 :: 		case 'W' :     //won
L_main45:
;last_1.c,107 :: 		dance();
	CALL        _dance+0, 0
;last_1.c,108 :: 		break;
	GOTO        L_main23
;last_1.c,110 :: 		default  :
L_main46:
;last_1.c,111 :: 		break;
	GOTO        L_main23
;last_1.c,112 :: 		}
L_main22:
	MOVF        _command+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _command+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
	MOVF        _command+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
	MOVF        _command+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
	MOVF        _command+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	MOVF        _command+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_main29
	MOVF        _command+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVF        _command+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
	MOVF        _command+0, 0 
	XORLW       83
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
	MOVF        _command+0, 0 
	XORLW       74
	BTFSC       STATUS+0, 2 
	GOTO        L_main33
	MOVF        _command+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_main34
	MOVF        _command+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
	MOVF        _command+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	MOVF        _command+0, 0 
	XORLW       79
	BTFSC       STATUS+0, 2 
	GOTO        L_main37
	MOVF        _command+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
	MOVF        _command+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
	MOVF        _command+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
	MOVF        _command+0, 0 
	XORLW       116
	BTFSC       STATUS+0, 2 
	GOTO        L_main41
	MOVF        _command+0, 0 
	XORLW       117
	BTFSC       STATUS+0, 2 
	GOTO        L_main42
	MOVF        _command+0, 0 
	XORLW       118
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVF        _command+0, 0 
	XORLW       90
	BTFSC       STATUS+0, 2 
	GOTO        L_main44
	MOVF        _command+0, 0 
	XORLW       87
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	GOTO        L_main46
L_main23:
;last_1.c,113 :: 		}
	GOTO        L_main19
;last_1.c,114 :: 		}
	GOTO        $+0
; end of _main

_initialize:

;last_1.c,116 :: 		void initialize(){
;last_1.c,118 :: 		ADCON0 = 0b01000000;
	MOVLW       64
	MOVWF       ADCON0+0 
;last_1.c,120 :: 		TRISA = 255;
	MOVLW       255
	MOVWF       TRISA+0 
;last_1.c,121 :: 		PORTA = 0;
	CLRF        PORTA+0 
;last_1.c,122 :: 		TRISB = 0b00000100;                 //pin B0 for shoot pin
	MOVLW       4
	MOVWF       TRISB+0 
;last_1.c,123 :: 		PORTB = 0;                          //pin B2 for ball detect pin
	CLRF        PORTB+0 
;last_1.c,124 :: 		TRISC = 0;
	CLRF        TRISC+0 
;last_1.c,125 :: 		PORTC = 0;
	CLRF        PORTC+0 
;last_1.c,126 :: 		TRISD = 0;
	CLRF        TRISD+0 
;last_1.c,127 :: 		PORTD = 0;
	CLRF        PORTD+0 
;last_1.c,130 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;last_1.c,131 :: 		PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;last_1.c,132 :: 		PWM1_Start();                       // start PWM1
	CALL        _PWM1_Start+0, 0
;last_1.c,133 :: 		PWM2_Start();                       // start PWM2
	CALL        _PWM2_Start+0, 0
;last_1.c,135 :: 		}
	RETURN      0
; end of _initialize

_dance:

;last_1.c,137 :: 		void dance(){
;last_1.c,139 :: 		}
	RETURN      0
; end of _dance
