//wijesinghe D.B.

#include "servo.h"

#define MAX_RESISTOR_VAL  700
#define MIN_RESISTOR_VAL  300
#define RES_PIN 0


void initialize();

void main() {

     int a = 0;
     initialize();
     while(1)
     {
           servo_reading = ADC_Read(RES_PIN);   // Get 10-bit results of AD conversion
           PORTD = servo_reading;
           PORTE = servo_reading/256;
           
           if(servo_reading >=700)
                   servo_turn_anti_clockwise();
           else
                   servo_turn_clockwise();
           //if(temp>=0 && temp<2000)
           //        servo_turn_to_middle();
     }
}

void initialize(){
     //ADCON0 = 0b0;
     ADCON1 = 0b01000000;
     TRISA = 255;
     PORTA = 0;
     PORTB = 0;
     TRISB = 0;
     TRISD = 0;
     TRISE = 0;
}