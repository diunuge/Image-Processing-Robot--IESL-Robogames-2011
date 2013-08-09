

#include <p18f452.h>
#include <timers.h>
#include <delays.h>

//The servos are all set to go to an initial 
                        //state when the system is powered on

int servo0 = 0xF63B; // Servo 0
int servo1 = 0xF077; // Servo 1

//Servos 2, 3 & 4 are not used however they are included
//        to show how multiple servos could (can) be used.
int servo2; // Servo 2
int servo3; // Servo 3
int servo4; // Servo 4

int count = 0;

void InterruptHandlerHigh (void);

void main(void)
{

TRISB = 0x00;
PORTB = 0x00;

RCON = 0b000000000; 
INTCON = 0b10100000;

OpenTimer0( TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_PS_1_2 );
OpenTimer1( TIMER_INT_ON & T1_16BIT_RW & T1_SOURCE_INT & T1_PS_1_2 & T1_OSC1EN_OFF & T1_SYNC_EXT_OFF );

/*
How Timer Calculations Work:
Both timers are set to 1:2 Prescaled values. The timers will count every instruction cycle executed as 2.

(1) Since servos use a 50Hz frequency, and, 1/50Hz = 20mS, we need to generate a timer for 20mS

(2) Pic Clock Frequency = 20 MHz = 20,000,000 Hz

(3) Pic Instruction Cycle Frequency = 20 MHz / 4 = 5 MHz = 5,000,000 Hz

(4) (0.020 Seconds) / 5,000,000 Hz = 100000 Instruction Cycles

(5) Timer counts every instruction as 2 ~~ 100000 / 2 = 50,000.

(6) Convert that value to Hex: 0xC350

(7) Finally, the timers count up from 0x0000, so subtract 0xC350 from 0xFFFF

(8) Final Value: 0x3CAF
*/

WriteTimer0( 0x3CAF );        //Trigger Interrupted after 20mS
WriteTimer1( 0xF63B );  //This is just a small initial delay chosen at random.
 

while(1){

        servo0 = 0xEC77;// Servo 0 - Move to 0 Degrees
        servo1 = 0xFB1D;// Servo 1 - Move to 90 Degrees
                Delay10KTCYx(250);        // 1 Second Delay
                Delay10KTCYx(250);
        servo0 = 0xF63B;// Servo 0 - Move to 45 Degrees
        servo1 = 0xF63B;// Servo 1 - Move to 45 Degrees
                Delay10KTCYx(250);        // 1 Second Delay
                Delay10KTCYx(250);
        servo0 = 0xFB1D;// Servo 0 - Move to 90 Degrees
        servo1 = 0xEC77;// Servo 1 - Move to 45 Degrees
                Delay10KTCYx(250);        // 1 Second Delay
                Delay10KTCYx(250);

}

}

//INTERRUPT CONTROL
#pragma code InterruptVectorHigh = 0x08                //interrupt pointer address (0x18 low priority)
void InterruptVectorHigh (void)
{
        _asm        //assembly code starts
        goto InterruptHandlerHigh                //interrupt control
        _endasm //assembly code ends
}
#pragma code
#pragma interrupt InterruptHandlerHigh        //enf.

void InterruptHandlerHigh()        // declaration of InterruptHandler
{//this gets ran when ever the timers flop over from FFFF->0000
        if(INTCONbits.TMR0IF)                        //check if TMR0 interrupt flag is set
        {
                                WriteTimer0( 0x3CAF );
                                WriteTimer1( 0xFC77 );
                                count = 0;
                            INTCONbits.TMR0IF = 0;                //clear TMR0 flag               
        }
        if(PIR1bits.TMR1IF == 1 && PIE1bits.TMR1IE == 1)        //if set controls the first servo
        {
                count++;        
                                switch(count){                
                        case 1:     PORTB = 0x01; // First Stage
                                            WriteTimer1( servo0 );
                                                break;
                        case 2:                PORTB = 0x02; // Servo 1
                                                WriteTimer1( servo1 );
                                                break;
                        case 3:                PORTB = 0x00;
                                                //PORTC = 0x02; // Swivel/Rotate
                                                WriteTimer1( servo2 );
                                                break;
                        case 4:                
                                                //WriteTimer1( servo3 ); 
                                                break;
                        case 5:                
                                                //WriteTimer1( servo4 ); 
                                                break;
                        case 6:                
                                                //WriteTimer1( 0 );
                                                break;
                                }

                PIR1bits.TMR1IF = 0;                        //clear Timer1 flag
                PIE1bits.TMR1IE = 1;                        //clear Timer1 enable flag set to zero
        }

    INTCONbits.GIE = 1;                                //re-enable all interrupts
}