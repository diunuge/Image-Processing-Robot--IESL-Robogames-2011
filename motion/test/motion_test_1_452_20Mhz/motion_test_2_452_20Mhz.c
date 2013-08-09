//wijesinghe D.B.

#include "motion.h"
char i, error, byte_read;
void Initialize_motion();

void main() {

     Initialize_motion();


    error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
    if (error > 0) {
        PORTB = error;                        // Signalize Init error
        while(1) ;                            // Stop program
    }
    Delay_ms(100);

    for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
      Soft_UART_Write(i);
      Delay_ms(100);
    }

    while(1) {
        byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
        if (error)                            // If error was detected
          PORTB = error;                      //   signal it on PORTB
        else{
            switch(byte_read){
                 case 'a':go_0();     break;
                 case 'b':go_45();    break;
                 case 'c':go_90();    break;
                 case 'd':go_135();   break;
                 case 'e':go_180();   break;
                 case 'f':go_225();   break;
                 case 'g':go_270();   break;
                 case 'h':go_315();   break;
                 case 's':stop();     break;
                 case 'j':rotate_clockwise(255);        break;
                 case 'k':rotate_anti_clockwise(255);   break;

                 default :
                 {
                      byte_read = 'z';
                      Soft_UART_Write(byte_read);
                      break;
                 }
            }
        }
    }


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