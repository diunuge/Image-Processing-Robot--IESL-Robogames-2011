
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

_main:

;motion_test_1_452_20Mhz.c,7 :: 		void main() {
;motion_test_1_452_20Mhz.c,9 :: 		Initialize_motion();
	CALL        _Initialize_motion+0, 0
;motion_test_1_452_20Mhz.c,10 :: 		initialize_bluetooth();
	CALL        _initialize_bluetooth+0, 0
;motion_test_1_452_20Mhz.c,11 :: 		test_bluetooth();
	CALL        _test_bluetooth+0, 0
;motion_test_1_452_20Mhz.c,13 :: 		while(1) {
L_main4:
;motion_test_1_452_20Mhz.c,14 :: 		byte_read = recieve_command();
	CALL        _recieve_command+0, 0
	MOVF        R0, 0 
	MOVWF       _byte_read+0 
;motion_test_1_452_20Mhz.c,15 :: 		switch(byte_read){
	GOTO        L_main6
;motion_test_1_452_20Mhz.c,16 :: 		case 'a':go_0();     break;
L_main8:
	CALL        _go_0+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,17 :: 		case 'b':go_45();    break;
L_main9:
	CALL        _go_45+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,18 :: 		case 'c':go_90();    break;
L_main10:
	CALL        _go_90+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,19 :: 		case 'd':go_135();   break;
L_main11:
	CALL        _go_135+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,20 :: 		case 'e':go_180();   break;
L_main12:
	CALL        _go_180+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,21 :: 		case 'f':go_225();   break;
L_main13:
	CALL        _go_225+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,22 :: 		case 'g':go_270();   break;
L_main14:
	CALL        _go_270+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,23 :: 		case 'h':go_315();   break;
L_main15:
	CALL        _go_315+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,24 :: 		case 's':stop();     break;
L_main16:
	CALL        _stop+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,25 :: 		case 'j':rotate_clockwise(255);        break;
L_main17:
	MOVLW       255
	MOVWF       FARG_rotate_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_clockwise_PWM+1 
	CALL        _rotate_clockwise+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,26 :: 		case 'k':rotate_anti_clockwise(255);   break;
L_main18:
	MOVLW       255
	MOVWF       FARG_rotate_anti_clockwise_PWM+0 
	MOVLW       0
	MOVWF       FARG_rotate_anti_clockwise_PWM+1 
	CALL        _rotate_anti_clockwise+0, 0
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,28 :: 		default :
L_main19:
;motion_test_1_452_20Mhz.c,30 :: 		byte_read = 'z';
	MOVLW       122
	MOVWF       _byte_read+0 
;motion_test_1_452_20Mhz.c,31 :: 		send_command(byte_read);
	MOVLW       122
	MOVWF       FARG_send_command_command+0 
	CALL        _send_command+0, 0
;motion_test_1_452_20Mhz.c,32 :: 		break;
	GOTO        L_main7
;motion_test_1_452_20Mhz.c,34 :: 		}
L_main6:
	MOVF        _byte_read+0, 0 
	XORLW       97
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _byte_read+0, 0 
	XORLW       98
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        _byte_read+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _byte_read+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _byte_read+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _byte_read+0, 0 
	XORLW       102
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _byte_read+0, 0 
	XORLW       103
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _byte_read+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
	MOVF        _byte_read+0, 0 
	XORLW       115
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _byte_read+0, 0 
	XORLW       106
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
	MOVF        _byte_read+0, 0 
	XORLW       107
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	GOTO        L_main19
L_main7:
;motion_test_1_452_20Mhz.c,36 :: 		}
	GOTO        L_main4
;motion_test_1_452_20Mhz.c,39 :: 		}
	GOTO        $+0
; end of _main

_Initialize_motion:

;motion_test_1_452_20Mhz.c,41 :: 		void Initialize_motion(){
;motion_test_1_452_20Mhz.c,43 :: 		TRISC = 0;
	CLRF        TRISC+0 
;motion_test_1_452_20Mhz.c,44 :: 		PORTC = 0;
	CLRF        PORTC+0 
;motion_test_1_452_20Mhz.c,45 :: 		TRISD = 0;
	CLRF        TRISD+0 
;motion_test_1_452_20Mhz.c,46 :: 		PORTD = 0;
	CLRF        PORTD+0 
;motion_test_1_452_20Mhz.c,47 :: 		TRISB = 0;
	CLRF        TRISB+0 
;motion_test_1_452_20Mhz.c,48 :: 		PORTB = 0;
	CLRF        PORTB+0 
;motion_test_1_452_20Mhz.c,50 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;motion_test_1_452_20Mhz.c,51 :: 		PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;motion_test_1_452_20Mhz.c,52 :: 		PWM1_Start();                       // start PWM1
	CALL        _PWM1_Start+0, 0
;motion_test_1_452_20Mhz.c,53 :: 		PWM2_Start();                       // start PWM2
	CALL        _PWM2_Start+0, 0
;motion_test_1_452_20Mhz.c,55 :: 		}
	RETURN      0
; end of _Initialize_motion
