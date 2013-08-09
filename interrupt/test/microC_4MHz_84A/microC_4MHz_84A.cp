#line 1 "C:/Users/Robot/Desktop/brainstorm/interrupt/test/microC_4MHz_84A/microC_4MHz_84A.c"

void ssdecode(int i);
int Digit1;
int Digit2;
int LoopCounter;


void interrupt()
{
 if (INTCON.T0IF)
 {
 LoopCounter++;
 if(LoopCounter > 15)
 {
 Digit1 = Digit1 +1;
 if(Digit1>9)
 {
 Digit1=0;
 Digit2++;
 if(Digit2>9)
 Digit2=0;
 }
 LoopCounter =0;
 }
 INTCON.T0IF = 0;
 }
}


void main()
{
 TRISA = 0b00011001;
 TRISB = 0;
 OPTION_REG = 0b10000111;
 INTCON = 0b10100000;
 Digit1 = 0;
 Digit2 = 0;
 LoopCounter = 0;

 while (1)
 {
 LoopCounter = 0;
 ssdecode(Digit1);
 PORTA.B1 = 1;

 PORTA.B1 = 0;
 ssdecode(Digit2);
 PORTA.B2 = 1;

 PORTA.B2 = 0;
 LoopCounter++;
 }
}


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
