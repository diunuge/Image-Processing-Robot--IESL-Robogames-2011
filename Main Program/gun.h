#include "servo.h"

#define  SHOOT_PIN   PORTB.B0
#define  SENCE_PIN   PORTB.B2
#define  SHOOT_TIME   200

void shoot();

void shoot(){
     SHOOT_PIN = 1;
     delay_ms(SHOOT_TIME);
     SHOOT_PIN = 0;
}