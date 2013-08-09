#define A PORTB.B0;

// Introduce functions and variables
int Digit1; // Variable for Digit1

// Interrupt Service Routine (ISR)
void interrupt()
{
    if (INTF) // Check for Timer 0 interrupt
    {
        PORTA = 1;
        Digit1 = Digit1 +1; // Increase Digit 1
        INTCON.INTF = 0; // Clear RB0 interrupt flag
    }
    if(INTCON.B0){
        PORTA = 2;
        delay_ms(100);
        PORTA = 0;
        delay_ms (100);
        PORTA =4;
        Digit1 = Digit1 -1;
        INTCON.RBIF = 0;
    }
    delay_ms(100);
    PORTA = 0;
    INTCON.INTF = 0;
    INTCON.B0 = 0;
}

//Main Function
void main()
{

    ADCON1 = 0b111;
    ADCON0 = 0b0;
    TRISA = 0;
    PORTA = 0;
    
    TRISB = 0b11110001; //RB0 input

    PORTB = 0;
    TRISD = 0;
    PORTD = 0;
    
    INTCON = 0b10011000; //Enable RB0 interrupts
    Digit1 = 0; //Start from 0
    while (1) // loop forever
    {
        PORTD = Digit1; //Display digit 1
        Delay_ms(100); //Small delay
    }
}
