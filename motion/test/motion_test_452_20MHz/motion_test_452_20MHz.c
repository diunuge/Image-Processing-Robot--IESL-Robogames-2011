//wijesinghe D.B.

#include "motion.h"
void Initialize_motion();

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

void Initialize_motion(){

     TRISC = 0;
     PORTC = 0;
     TRISD = 0;
     PORTD = 0;
     TRISB = 0;
     PORTB = 0;

     PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
     PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
     PWM1_Start();                       // start PWM1
     PWM2_Start();                       // start PWM2

}
