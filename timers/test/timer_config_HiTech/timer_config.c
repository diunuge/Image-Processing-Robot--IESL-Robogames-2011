#include <pic.h>
//Configure device
__CONFIG(INTIO & WDTDIS & PWRTDIS & MCLRDIS &
UNPROTECT & BORDIS & IESODIS & FCMDIS);
//-----------------------DATA MEMORY
unsigned char counter; //counter variable to count
//the number of TMR0 overflows
//----------------------PROGRAM MEMORY
/*----------------------------------------------------------
Subroutine: INIT
Parameters: none
Returns: nothing
Synopsys: Initializes all registers
associated with the application
----------------------------------------------------------*/
Init(void)
{
TMR0 = 0;//Clear the TMR0 register
/*Configure Timer0 as follows:
- Use the internal instruction clock
as the source to the module
- Assign the Prescaler to the Watchdog
Timer so that TMR0 increments at a 1:1
ratio with the internal instruction clock*/
OPTION = 0B00001000;
}
/*----------------------------------------------------------
Subroutine: main
Parameters: none
Returns: nothing
Synopsys: Main program function
-----------------------------------------------------------*/
main(void)
{
Init(); //Initialize the relevant registers
while(1)
{
//Poll the T0IF flag to see if TMR0 has overflowed
if (T0IF)
{
++counter;//if T0IF = 1 increment the counter
//variable by 1
T0IF = 0;//Clear the T0IF flag so that
//the next overflow can be detected
}
}
}