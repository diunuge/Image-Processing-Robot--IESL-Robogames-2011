
_Initialize_motion:

;motion.h,53 :: 		void Initialize_motion(){
;motion.h,55 :: 		TRISC = 0;
	CLRF        TRISC+0 
;motion.h,56 :: 		PORTC = 0;
	CLRF        PORTC+0 
;motion.h,57 :: 		TRISD = 0;
	CLRF        TRISD+0 
;motion.h,58 :: 		PORTD = 0;
	CLRF        PORTD+0 
;motion.h,59 :: 		TRISB = 0;
	CLRF        TRISB+0 
;motion.h,60 :: 		PORTB = 0;
	CLRF        PORTB+0 
;motion.h,62 :: 		PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;motion.h,63 :: 		PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;motion.h,64 :: 		PWM1_Start();                       // start PWM1
	CALL        _PWM1_Start+0, 0
;motion.h,65 :: 		PWM2_Start();                       // start PWM2
	CALL        _PWM2_Start+0, 0
;motion.h,67 :: 		}
	RETURN      0
; end of _Initialize_motion

_M1_foward:

;motion.h,69 :: 		void M1_foward(){
;motion.h,70 :: 		M1_F = 1;
	BSF         PORTD+0, 0 
;motion.h,71 :: 		M1_R = 0;
	BCF         PORTD+0, 1 
;motion.h,72 :: 		}
	RETURN      0
; end of _M1_foward

_M1_reverse:

;motion.h,74 :: 		void M1_reverse(){
;motion.h,75 :: 		M1_F = 0;
	BCF         PORTD+0, 0 
;motion.h,76 :: 		M1_R = 1;
	BSF         PORTD+0, 1 
;motion.h,77 :: 		}
	RETURN      0
; end of _M1_reverse

_M1_stop:

;motion.h,79 :: 		void M1_stop(){
;motion.h,80 :: 		M1_F = 0;
	BCF         PORTD+0, 0 
;motion.h,81 :: 		M1_R = 0;
	BCF         PORTD+0, 1 
;motion.h,82 :: 		}
	RETURN      0
; end of _M1_stop

_M2_foward:

;motion.h,84 :: 		void M2_foward(){
;motion.h,85 :: 		M2_F = 1;
	BSF         PORTC+0, 0 
;motion.h,86 :: 		M2_R = 0;
	BCF         PORTC+0, 3 
;motion.h,87 :: 		}
	RETURN      0
; end of _M2_foward

_M2_reverse:

;motion.h,89 :: 		void M2_reverse(){
;motion.h,90 :: 		M2_F = 0;
	BCF         PORTC+0, 0 
;motion.h,91 :: 		M2_R = 1;
	BSF         PORTC+0, 3 
;motion.h,92 :: 		}
	RETURN      0
; end of _M2_reverse

_M2_stop:

;motion.h,94 :: 		void M2_stop(){
;motion.h,95 :: 		M2_F = 0;
	BCF         PORTC+0, 0 
;motion.h,96 :: 		M2_R = 0;
	BCF         PORTC+0, 3 
;motion.h,97 :: 		}
	RETURN      0
; end of _M2_stop

_M3_foward:

;motion.h,99 :: 		void M3_foward(){
;motion.h,100 :: 		M3_F = 1;
	BSF         PORTC+0, 4 
;motion.h,101 :: 		M3_R = 0;
	BCF         PORTC+0, 5 
;motion.h,102 :: 		}
	RETURN      0
; end of _M3_foward

_M3_reverse:

;motion.h,104 :: 		void M3_reverse(){
;motion.h,105 :: 		M3_F = 0;
	BCF         PORTC+0, 4 
;motion.h,106 :: 		M3_R = 1;
	BSF         PORTC+0, 5 
;motion.h,107 :: 		}
	RETURN      0
; end of _M3_reverse

_M3_stop:

;motion.h,109 :: 		void M3_stop(){
;motion.h,110 :: 		M3_F = 0;
	BCF         PORTC+0, 4 
;motion.h,111 :: 		M3_R = 0;
	BCF         PORTC+0, 5 
;motion.h,112 :: 		}
	RETURN      0
; end of _M3_stop

_M4_foward:

;motion.h,114 :: 		void M4_foward(){
;motion.h,115 :: 		M4_F = 1;
	BSF         PORTD+0, 3 
;motion.h,116 :: 		M4_R = 0;
	BCF         PORTD+0, 2 
;motion.h,117 :: 		}
	RETURN      0
; end of _M4_foward

_M4_reverse:

;motion.h,119 :: 		void M4_reverse(){
;motion.h,120 :: 		M4_F = 0;
	BCF         PORTD+0, 3 
;motion.h,121 :: 		M4_R = 1;
	BSF         PORTD+0, 2 
;motion.h,122 :: 		}
	RETURN      0
; end of _M4_reverse

_M4_stop:

;motion.h,124 :: 		void M4_stop(){
;motion.h,125 :: 		M4_F = 0;
	BCF         PORTD+0, 3 
;motion.h,126 :: 		M4_R = 0;
	BCF         PORTD+0, 2 
;motion.h,127 :: 		}
	RETURN      0
; end of _M4_stop

_foward_Y_set:

;motion.h,129 :: 		void foward_Y_set(){
;motion.h,130 :: 		M1_foward();
	CALL        _M1_foward+0, 0
;motion.h,131 :: 		M3_foward();
	CALL        _M3_foward+0, 0
;motion.h,132 :: 		}
	RETURN      0
; end of _foward_Y_set

_foward_X_set:

;motion.h,134 :: 		void foward_X_set(){
;motion.h,135 :: 		M2_foward();
	CALL        _M2_foward+0, 0
;motion.h,136 :: 		M4_foward();
	CALL        _M4_foward+0, 0
;motion.h,137 :: 		}
	RETURN      0
; end of _foward_X_set

_reverse_Y_set:

;motion.h,139 :: 		void reverse_Y_set(){
;motion.h,140 :: 		M1_reverse();
	CALL        _M1_reverse+0, 0
;motion.h,141 :: 		M3_reverse();
	CALL        _M3_reverse+0, 0
;motion.h,142 :: 		}
	RETURN      0
; end of _reverse_Y_set

_reverse_X_set:

;motion.h,144 :: 		void reverse_X_set(){
;motion.h,145 :: 		M2_reverse();
	CALL        _M2_reverse+0, 0
;motion.h,146 :: 		M4_reverse();
	CALL        _M4_reverse+0, 0
;motion.h,147 :: 		}
	RETURN      0
; end of _reverse_X_set

_foward_Y:

;motion.h,149 :: 		void foward_Y(int pwmY){
;motion.h,150 :: 		foward_Y_set();
	CALL        _foward_Y_set+0, 0
;motion.h,151 :: 		PWM2_Set_Duty(pwmY);
	MOVF        FARG_foward_Y_pwmY+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,152 :: 		}
	RETURN      0
; end of _foward_Y

_foward_X:

;motion.h,154 :: 		void foward_X(int pwmX){
;motion.h,155 :: 		foward_X_set();
	CALL        _foward_X_set+0, 0
;motion.h,156 :: 		PWM1_Set_Duty(pwmX);
	MOVF        FARG_foward_X_pwmX+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,157 :: 		}
	RETURN      0
; end of _foward_X

_reverse_Y:

;motion.h,159 :: 		void reverse_Y(int pwmY){
;motion.h,160 :: 		reverse_Y_set();
	CALL        _reverse_Y_set+0, 0
;motion.h,161 :: 		PWM2_Set_Duty(pwmY);
	MOVF        FARG_reverse_Y_pwmY+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,162 :: 		}
	RETURN      0
; end of _reverse_Y

_reverse_X:

;motion.h,164 :: 		void reverse_X(int pwmX){
;motion.h,165 :: 		reverse_X_set();
	CALL        _reverse_X_set+0, 0
;motion.h,166 :: 		PWM1_Set_Duty(pwmX);
	MOVF        FARG_reverse_X_pwmX+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,167 :: 		}
	RETURN      0
; end of _reverse_X

_stop:

;motion.h,169 :: 		void stop(){
;motion.h,170 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,171 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,172 :: 		}
	RETURN      0
; end of _stop

_rotate_clockwise:

;motion.h,174 :: 		void rotate_clockwise(int PWM){
;motion.h,175 :: 		M1_reverse();
	CALL        _M1_reverse+0, 0
;motion.h,176 :: 		M2_foward();
	CALL        _M2_foward+0, 0
;motion.h,177 :: 		M3_foward();
	CALL        _M3_foward+0, 0
;motion.h,178 :: 		M4_reverse();
	CALL        _M4_reverse+0, 0
;motion.h,179 :: 		PWM1_Set_Duty(PWM);
	MOVF        FARG_rotate_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,180 :: 		PWM2_Set_Duty(PWM);
	MOVF        FARG_rotate_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,181 :: 		}
	RETURN      0
; end of _rotate_clockwise

_rotate_anti_clockwise:

;motion.h,183 :: 		void rotate_anti_clockwise(int PWM){
;motion.h,184 :: 		M1_foward();
	CALL        _M1_foward+0, 0
;motion.h,185 :: 		M2_reverse();
	CALL        _M2_reverse+0, 0
;motion.h,186 :: 		M3_reverse();
	CALL        _M3_reverse+0, 0
;motion.h,187 :: 		M4_foward();
	CALL        _M4_foward+0, 0
;motion.h,188 :: 		PWM1_Set_Duty(PWM);
	MOVF        FARG_rotate_anti_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;motion.h,189 :: 		PWM2_Set_Duty(PWM);
	MOVF        FARG_rotate_anti_clockwise_PWM+0, 0 
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;motion.h,190 :: 		}
	RETURN      0
; end of _rotate_anti_clockwise

_go_0:

;motion.h,193 :: 		void go_0(){
;motion.h,194 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,195 :: 		foward_Y(0);
	CLRF        FARG_foward_Y_pwmY+0 
	CLRF        FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,196 :: 		PORTB = 1;
	MOVLW       1
	MOVWF       PORTB+0 
;motion.h,197 :: 		}
	RETURN      0
; end of _go_0

_go_45:

;motion.h,199 :: 		void go_45(){
;motion.h,200 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,201 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,202 :: 		PORTB = 2;
	MOVLW       2
	MOVWF       PORTB+0 
;motion.h,203 :: 		}
	RETURN      0
; end of _go_45

_go_90:

;motion.h,205 :: 		void go_90(){
;motion.h,206 :: 		foward_X(0);
	CLRF        FARG_foward_X_pwmX+0 
	CLRF        FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,207 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,208 :: 		PORTB = 4;
	MOVLW       4
	MOVWF       PORTB+0 
;motion.h,209 :: 		}
	RETURN      0
; end of _go_90

_go_135:

;motion.h,211 :: 		void go_135(){
;motion.h,212 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,213 :: 		foward_Y(255);
	MOVLW       255
	MOVWF       FARG_foward_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,214 :: 		PORTB = 8;
	MOVLW       8
	MOVWF       PORTB+0 
;motion.h,215 :: 		}
	RETURN      0
; end of _go_135

_go_180:

;motion.h,217 :: 		void go_180(){
;motion.h,218 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,219 :: 		foward_Y(0);
	CLRF        FARG_foward_Y_pwmY+0 
	CLRF        FARG_foward_Y_pwmY+1 
	CALL        _foward_Y+0, 0
;motion.h,220 :: 		PORTB = 16;
	MOVLW       16
	MOVWF       PORTB+0 
;motion.h,221 :: 		}
	RETURN      0
; end of _go_180

_go_225:

;motion.h,223 :: 		void go_225(){
;motion.h,224 :: 		reverse_X(255);
	MOVLW       255
	MOVWF       FARG_reverse_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,225 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,226 :: 		PORTB = 32;
	MOVLW       32
	MOVWF       PORTB+0 
;motion.h,227 :: 		}
	RETURN      0
; end of _go_225

_go_270:

;motion.h,229 :: 		void go_270(){
;motion.h,230 :: 		reverse_X(0);
	CLRF        FARG_reverse_X_pwmX+0 
	CLRF        FARG_reverse_X_pwmX+1 
	CALL        _reverse_X+0, 0
;motion.h,231 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,232 :: 		PORTB = 64;
	MOVLW       64
	MOVWF       PORTB+0 
;motion.h,233 :: 		}
	RETURN      0
; end of _go_270

_go_315:

;motion.h,235 :: 		void go_315(){
;motion.h,236 :: 		foward_X(255);
	MOVLW       255
	MOVWF       FARG_foward_X_pwmX+0 
	MOVLW       0
	MOVWF       FARG_foward_X_pwmX+1 
	CALL        _foward_X+0, 0
;motion.h,237 :: 		reverse_Y(255);
	MOVLW       255
	MOVWF       FARG_reverse_Y_pwmY+0 
	MOVLW       0
	MOVWF       FARG_reverse_Y_pwmY+1 
	CALL        _reverse_Y+0, 0
;motion.h,238 :: 		PORTB = 128;
	MOVLW       128
	MOVWF       PORTB+0 
;motion.h,239 :: 		}
	RETURN      0
; end of _go_315

_main:

;motion_test_452_20MHz.c,5 :: 		void main() {
;motion_test_452_20MHz.c,7 :: 		Initialize_motion();
	CALL        _Initialize_motion+0, 0
;motion_test_452_20MHz.c,9 :: 		go_0();
	CALL        _go_0+0, 0
;motion_test_452_20MHz.c,10 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;motion_test_452_20MHz.c,11 :: 		go_45();
	CALL        _go_45+0, 0
;motion_test_452_20MHz.c,12 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	DECFSZ      R11, 1, 1
	BRA         L_main1
	NOP
;motion_test_452_20MHz.c,13 :: 		go_90();
	CALL        _go_90+0, 0
;motion_test_452_20MHz.c,14 :: 		go_135();
	CALL        _go_135+0, 0
;motion_test_452_20MHz.c,15 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;motion_test_452_20MHz.c,16 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;motion_test_452_20MHz.c,17 :: 		go_180();
	CALL        _go_180+0, 0
;motion_test_452_20MHz.c,18 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;motion_test_452_20MHz.c,19 :: 		go_225();
	CALL        _go_225+0, 0
;motion_test_452_20MHz.c,20 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;motion_test_452_20MHz.c,21 :: 		go_270();
	CALL        _go_270+0, 0
;motion_test_452_20MHz.c,22 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;motion_test_452_20MHz.c,23 :: 		go_315();
	CALL        _go_315+0, 0
;motion_test_452_20MHz.c,24 :: 		delay_ms(1000);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;motion_test_452_20MHz.c,25 :: 		stop();
	CALL        _stop+0, 0
;motion_test_452_20MHz.c,28 :: 		}
	GOTO        $+0
; end of _main
