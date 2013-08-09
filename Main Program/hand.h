//wijesinghe D.B.

#define servo_pin  PORTB.B0

#define MAX_RESISTOR_VAL  700
#define MIN_RESISTOR_VAL  300

#define  SHOOT_PIN   PORTB.B1
#define  SENCE_PIN   PORTB.B2
#define  SHOOT_TIME   200


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
     servo_pin = 1;
     delay_ms(1);
     servo_pin = 0;
     delay_ms(19);
}

void servo_turn_anti_clockwise(){
     servo_pin = 1;
     delay_ms(2);
     servo_pin = 0;
     delay_ms(18);
}

void servo_turn_to_middle(){
     servo_pin = 1;
     delay_ms(1);
     delay_us(500);
     servo_pin = 0;
     delay_ms(18);
     delay_us(500);
}

int set_throw_position(){
     servo_reading = get_servo_reading();
     while(servo_reading < MAX_RESISTOR_VAL){
           servo_reading = get_servo_reading();
           servo_turn_clockwise();
     }
     return 1;
}

int set_get_position(){
     servo_reading = get_servo_reading();
     while(servo_reading > MIN_RESISTOR_VAL){
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
      while(!SENCE_PIN);
      //delay_ms(4000);
      set_throw_position();
}

void shoot(){
     SHOOT_PIN = 1;
     delay_ms(SHOOT_TIME);
     SHOOT_PIN = 0;
}