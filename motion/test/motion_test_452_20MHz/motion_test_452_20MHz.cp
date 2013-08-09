#line 1 "C:/Users/Robot/Desktop/brainstorm/motion/test/motion_test_452_20MHz/motion_test_452_20MHz.c"
#line 1 "c:/users/robot/desktop/brainstorm/motion/motion.h"
#line 12 "c:/users/robot/desktop/brainstorm/motion/motion.h"
unsigned short current_duty_Y, current_duty_X;

void Initialize_motion();

void M1_foward();
void M1_reverse();
void M1_stop();
void M2_foward();
void M2_reverse();
void M2_stop();
void M3_foward();
void M3_reverse();
void M3_stop();
void M4_foward();
void M4_reverse();
void M4_stop();

void foward_Y_set();
void foward_X_set();
void reverse_Y_set();
void reverse_X_set();

void foward_Y(int pwmY);
void foward_X(int pwmX);
void reverse_Y(int pwmY);
void reverse_X(int pwmX);
void stop();

void rotate_clockwise(int PWM);
void rotate_anti_clockwise(int PWM);

void go_0();
void go_45();
void go_90();
void go_135();
void go_180();
void go_225();
void go_270();
void go_315();


void Initialize_motion(){

 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;
 TRISB = 0;
 PORTB = 0;

 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();

}

void M1_foward(){
  PORTD.B0  = 1;
  PORTD.B1  = 0;
}

void M1_reverse(){
  PORTD.B0  = 0;
  PORTD.B1  = 1;
}

void M1_stop(){
  PORTD.B0  = 0;
  PORTD.B1  = 0;
}

void M2_foward(){
  PORTC.B0  = 1;
  PORTC.B3  = 0;
}

void M2_reverse(){
  PORTC.B0  = 0;
  PORTC.B3  = 1;
}

void M2_stop(){
  PORTC.B0  = 0;
  PORTC.B3  = 0;
}

void M3_foward(){
  PORTC.B4  = 1;
  PORTC.B5  = 0;
}

void M3_reverse(){
  PORTC.B4  = 0;
  PORTC.B5  = 1;
}

void M3_stop(){
  PORTC.B4  = 0;
  PORTC.B5  = 0;
}

void M4_foward(){
  PORTD.B3  = 1;
  PORTD.B2  = 0;
}

void M4_reverse(){
  PORTD.B3  = 0;
  PORTD.B2  = 1;
}

void M4_stop(){
  PORTD.B3  = 0;
  PORTD.B2  = 0;
}

void foward_Y_set(){
 M1_foward();
 M3_foward();
}

void foward_X_set(){
 M2_foward();
 M4_foward();
}

void reverse_Y_set(){
 M1_reverse();
 M3_reverse();
}

void reverse_X_set(){
 M2_reverse();
 M4_reverse();
}

void foward_Y(int pwmY){
 foward_Y_set();
 PWM2_Set_Duty(pwmY);
}

void foward_X(int pwmX){
 foward_X_set();
 PWM1_Set_Duty(pwmX);
}

void reverse_Y(int pwmY){
 reverse_Y_set();
 PWM2_Set_Duty(pwmY);
}

void reverse_X(int pwmX){
 reverse_X_set();
 PWM1_Set_Duty(pwmX);
}

void stop(){
 PWM1_Set_Duty(0);
 PWM2_Set_Duty(0);
}

void rotate_clockwise(int PWM){
 M1_reverse();
 M2_foward();
 M3_foward();
 M4_reverse();
 PWM1_Set_Duty(PWM);
 PWM2_Set_Duty(PWM);
}

void rotate_anti_clockwise(int PWM){
 M1_foward();
 M2_reverse();
 M3_reverse();
 M4_foward();
 PWM1_Set_Duty(PWM);
 PWM2_Set_Duty(PWM);
}


void go_0(){
 foward_X(255);
 foward_Y(0);
 PORTB = 1;
}

void go_45(){
 foward_X(255);
 foward_Y(255);
 PORTB = 2;
}

void go_90(){
 foward_X(0);
 foward_Y(255);
 PORTB = 4;
}

void go_135(){
 reverse_X(255);
 foward_Y(255);
 PORTB = 8;
}

void go_180(){
 reverse_X(255);
 foward_Y(0);
 PORTB = 16;
}

void go_225(){
 reverse_X(255);
 reverse_Y(255);
 PORTB = 32;
}

void go_270(){
 reverse_X(0);
 reverse_Y(255);
 PORTB = 64;
}

void go_315(){
 foward_X(255);
 reverse_Y(255);
 PORTB = 128;
}
#line 5 "C:/Users/Robot/Desktop/brainstorm/motion/test/motion_test_452_20MHz/motion_test_452_20MHz.c"
void main() {

 Initialize_motion();

 go_0();
 delay_ms(1000);
 go_45();
 delay_ms(1000);
 go_90();
 go_135();
 delay_ms(1000);
 delay_ms(1000);
 go_180();
 delay_ms(1000);
 go_225();
 delay_ms(1000);
 go_270();
 delay_ms(1000);
 go_315();
 delay_ms(1000);
 stop();


}
