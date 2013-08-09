#include "motion.h"
#include "bluetooth.h"
#include "hand.h"


char command = 'S';
void initialize();
void dance();

void main() {

     initialize();
     initialize_bluetooth();
     short_test_bluetooth();
     while(1){
     
          if(SENCE_PIN == 1){
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
               //end of motion command

               case 'O' :
                    set_get_position();
                    
               case 'P' :
                    set_throw_position();
               
               case 'c' :     //catch ball
                    catch_ball();
                    break;

               case 's' :     //shoot ball
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

               case 'Z' :     //game over
                    stop();
                    break;

               case 'W' :     //won
                    dance();
                    break;

               default  :
                    break;
          }
     }
}

void initialize(){
     //ADCON1 = 0b111;
     ADCON0 = 0b01000000;

     TRISA = 255;
     PORTA = 0;
     TRISB = 0b00000100;                 //pin B0 for shoot pin
     PORTB = 0;                          //pin B2 for ball detect pin
     TRISC = 0;
     PORTC = 0;
     TRISD = 0;
     PORTD = 0;


     PWM1_Init(5000);                    // Initialize PWM1 module at 5KHz
     PWM2_Init(5000);                    // Initialize PWM2 module at 5KHz
     PWM1_Start();                       // start PWM1
     PWM2_Start();                       // start PWM2

}

void dance(){
     //implement random dances....
}