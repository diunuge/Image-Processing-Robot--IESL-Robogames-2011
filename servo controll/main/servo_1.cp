#line 1 "C:/Users/Robot/Desktop/brainstorm/servo controll/main/servo_1.c"
#line 1 "c:/users/robot/desktop/brainstorm/servo controll/servo.h"







unsigned int servo_reading;

void servo_turn_clockwise();
void servo_turn_anti_clockwise();
void servo_turn_to_middle();
int set_throw_position();
int set_get_position();
int get_servo_reading();

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
 while(servo_reading <  700 ){
 servo_reading = get_servo_reading();
 servo_turn_clockwise();
 }
 return 1;
}

int set_get_position(){
 while(servo_reading >  300 ){
 servo_reading = get_servo_reading();
 servo_turn_anti_clockwise();
 }
 return 1;
}

int get_servo_reading(){
 return ADC_Read(0);
}
#line 10 "C:/Users/Robot/Desktop/brainstorm/servo controll/main/servo_1.c"
void initialize();

void main() {

 int a = 0;
 initialize();
 while(1)
 {
 servo_reading = ADC_Read( 0 );
 PORTD = servo_reading;
 PORTE = servo_reading/256;

 if(servo_reading >=700)
 servo_turn_anti_clockwise();
 else
 servo_turn_clockwise();


 }
}

void initialize(){

 ADCON1 = 0b01000000;
 TRISA = 255;
 PORTA = 0;
 PORTB = 0;
 TRISB = 0;
 TRISD = 0;
 TRISE = 0;
}
