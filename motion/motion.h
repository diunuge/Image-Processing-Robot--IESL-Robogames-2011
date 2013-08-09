//wijesinghe D.B.

#define  M1_F  PORTD.B0
#define  M1_R  PORTD.B1
#define  M2_F  PORTC.B0
#define  M2_R  PORTC.B3
#define  M3_F  PORTC.B4
#define  M3_R  PORTC.B5
#define  M4_F  PORTD.B3
#define  M4_R  PORTD.B2


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

void go_0();                        //                      ^ Y
void go_45();                       //                  2   |
void go_90();                       //
void go_135();                      //
void go_180();                      //          3               1        --> X
void go_225();                      //
void go_270();                      //
void go_315();                      //                  4


void M1_foward(){
     M1_F = 1;
     M1_R = 0;
}

void M1_reverse(){
     M1_F = 0;
     M1_R = 1;
}

void M1_stop(){
     M1_F = 0;
     M1_R = 0;
}

void M2_foward(){
     M2_F = 1;
     M2_R = 0;
}

void M2_reverse(){
     M2_F = 0;
     M2_R = 1;
}

void M2_stop(){
     M2_F = 0;
     M2_R = 0;
}

void M3_foward(){
     M3_F = 1;
     M3_R = 0;
}

void M3_reverse(){
     M3_F = 0;
     M3_R = 1;
}

void M3_stop(){
     M3_F = 0;
     M3_R = 0;
}

void M4_foward(){
     M4_F = 1;
     M4_R = 0;
}

void M4_reverse(){
     M4_F = 0;
     M4_R = 1;
}

void M4_stop(){
     M4_F = 0;
     M4_R = 0;
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
     PWM1_Set_Duty(pwmY);
}

void foward_X(int pwmX){
     foward_X_set();
     PWM2_Set_Duty(pwmX);
}

void reverse_Y(int pwmY){
     reverse_Y_set();
     PWM1_Set_Duty(pwmY);
}

void reverse_X(int pwmX){
     reverse_X_set();
     PWM2_Set_Duty(pwmX);
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
}

void go_45(){
     foward_X(255);
     foward_Y(255);
}

void go_90(){
     foward_X(0);
     foward_Y(255);
}

void go_135(){
     reverse_X(255);
     foward_Y(255);
}

void go_180(){
     reverse_X(255);
     foward_Y(0);
}

void go_225(){
     reverse_X(255);
     reverse_Y(255);
}

void go_270(){
     reverse_X(0);
     reverse_Y(255);
     PORTB = 64;
}

void go_315(){
     foward_X(255);
     reverse_Y(255);
}