// Introduce functions and variables
void ssdecode(int i); // Function for 7 Segment decoding
int Digit1; // Variable for digit1
int Digit2; // Variable for digit2
int LoopCounter; // Cycle counter

// Interrupt Service Routine (ISR)
void interrupt()
{
    if (INTCON.T0IF) // Check for Timer 0 interrupt
    {
        LoopCounter++;
        if(LoopCounter > 15) //Check for 15 cycles
        {
            Digit1 = Digit1 +1; // Increase Digit 1
            if(Digit1>9) // if it is 9 then
            {
                Digit1=0; // reset to 0 and
                Digit2++; // increase Digit 2
                if(Digit2>9)// If Digit 2 is 9
                Digit2=0;// then reset it to 0
            }
            LoopCounter =0; // Reset Loop Counter
        }
        INTCON.T0IF = 0; // Clear Timer 0 overflow flag
    }
}

//Main Function
void main()
{
      TRISA = 0b00011001; //RA0 input
      TRISB = 0; //PORTB output
      OPTION_REG = 0b10000111; //Configure Timer 0
      INTCON = 0b10100000; //Enable interrupts
      Digit1 = 0; //Start from 0
      Digit2 = 0; //Start from 0
      LoopCounter = 0; //Start from 0

      while (1) // loop forever
      {
            LoopCounter = 0; //Start from 0
            ssdecode(Digit1); //Display digit 1
            PORTA.B1 = 1; //Enable Digit1
            //Delay_ms(20); //Small delay
            PORTA.B1 = 0; //Disable Digit1
            ssdecode(Digit2); //Display digit 2
            PORTA.B2 = 1; //Enable Digit2
            //Delay_ms(20); //Small delay
            PORTA.B2 = 0; //Disable Digit2
            LoopCounter++;//Cycle counter
      }
}

// Sewven Segment Decoder function
void ssdecode(int i)
{
    switch (i)
    {
        case 0: PORTB = 0b00111111; break;
        case 1: PORTB = 0b00000110; break;
        case 2: PORTB = 0b01011011; break;
        case 3: PORTB = 0b01001111; break;
        case 4: PORTB = 0b01100110; break;
        case 5: PORTB = 0b01101101; break;
        case 6: PORTB = 0b01111101; break;
        case 7: PORTB = 0b00000111; break;
        case 8: PORTB = 0b01111111; break;
        case 9: PORTB = 0b01101111; break;
    }
}