#line 1 "C:/Users/Robot/Desktop/brainstorm/Main Program/last/last_1.c"
#line 1 "c:/users/robot/desktop/brainstorm/main program/motion.h"
#line 13 "c:/users/robot/desktop/brainstorm/main program/motion.h"
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
#line 1 "c:/users/robot/desktop/brainstorm/main program/bluetooth.h"
char i, error, byte_read;

void initialize_bluetooth();
void test_bluetooth();
void short_test_bluetooth();
char recieve_command();
void send_command(char command);


void initialize_bluetooth(){
 error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0);
}

void short_test_bluetooth(){
 Soft_UART_Write('A');
}

void test_bluetooth(){
 for (i = 'z'; i >= 'A'; i--) {
 Soft_UART_Write(i);
 Delay_ms(100);
 }
}

char recieve_command(){
 return byte_read = Soft_UART_Read(&error);
}

void send_command(char command){
 Soft_UART_Write(command);
}
#line 1 "c:/users/robot/desktop/brainstorm/main program/hand.h"
#line 13 "c:/users/robot/desktop/brainstorm/main program/hand.h"
unsigned int servo_reading;

void servo_turn_clockwise();
void servo_turn_anti_clockwise();
void servo_turn_to_middle();
int set_throw_position();
int set_get_position();
int get_servo_reading();

void catch_ball();
void shoot();

void servo_turn_clockwise(){
  PORTB.B0  = 1;
 delay_ms(1);
  PORTB.B0  = 0;
 delay_ms(19);
}

void servo_turn_anti_clockwise(){
  PORTB.B0  = 1;
 delay_ms(2);
  PORTB.B0  = 0;
 delay_ms(18);
}

void servo_turn_to_middle(){
  PORTB.B0  = 1;
 delay_ms(1);
 delay_us(500);
  PORTB.B0  = 0;
 delay_ms(18);
 delay_us(500);
}

int set_throw_position(){
 servo_reading = get_servo_reading();
 while(servo_reading <  700 ){
 servo_reading = get_servo_reading();
 servo_turn_clockwise();
 }
 return 1;
}

int set_get_position(){
 servo_reading = get_servo_reading();
 while(servo_reading >  300 ){
 servo_reading = get_servo_reading();
 servo_turn_anti_clockwise();
 }
 return 1;
}

int get_servo_reading(){
 return ADC_Read(0);
}

void catch_ball(){
 set_get_position();
 while(! PORTB.B2 );

 set_throw_position();
}

void shoot(){
  PORTB.B1  = 1;
 delay_ms( 200 );
  PORTB.B1  = 0;
}
#line 6 "C:/Users/Robot/Desktop/brainstorm/Main Program/last/last_1.c"
char command = 'S';
void initialize();
void dance();

void main() {

 initialize();
 initialize_bluetooth();
 short_test_bluetooth();
 while(1){

 if( PORTB.B2  == 1){
 set_throw_position();
 send_command('h');
 }
 command = recieve_command();

 switch(command){
 case 'A' :
 go_0();
 break;

 case 'B' :
 go_90();
 break;

 case 'C' :
 go_180();
 break;

 case 'D' :
 go_270();
 break;

 case 'E' :
 go_45();
 break;

 case 'F' :
 go_135();
 break;
 case 'G' :
 go_225();
 break;

 case 'H' :
 go_315();
 break;

 case 'S' :
 stop();
 break;

 case 'J' :
 rotate_clockwise(255);
 break;

 case 'K' :
 rotate_anti_clockwise(255);
 break;

 case 'L' :
 rotate_clockwise(180);
 break;

 case 'M' :
 rotate_anti_clockwise(180);
 break;


 case 'O' :
 set_get_position();

 case 'P' :
 set_throw_position();

 case 'c' :
 catch_ball();
 break;

 case 's' :
 shoot();
 break;

 case 't' :
 servo_turn_clockwise();
 break;

 case 'u' :
 servo_turn_anti_clockwise();
 break;

 case 'v' :
 servo_turn_to_middle();
 break;

 case 'Z' :
 stop();
 break;

 case 'W' :
 dance();
 break;

 default :
 break;
 }
 }
}

void initialize(){

 ADCON0 = 0b01000000;

 TRISA = 255;
 PORTA = 0;
 TRISB = 0b00000100;
 PORTB = 0;
 TRISC = 0;
 PORTC = 0;
 TRISD = 0;
 PORTD = 0;


 PWM1_Init(5000);
 PWM2_Init(5000);
 PWM1_Start();
 PWM2_Start();

}

void dance(){

}
