#line 1 "C:/Users/Robot/Desktop/brainstorm/interrupt/test/Int_microC_20MHz_877_external/Int_microC_20MHz_877_external.c"



int Digit1;


void interrupt()
{
 if (INTF)
 {
 PORTA = 1;
 Digit1 = Digit1 +1;
 INTCON.INTF = 0;
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


void main()
{

 ADCON1 = 0b111;
 ADCON0 = 0b0;
 TRISA = 0;
 PORTA = 0;

 TRISB = 0b11110001;

 PORTB = 0;
 TRISD = 0;
 PORTD = 0;

 INTCON = 0b10011000;
 Digit1 = 0;
 while (1)
 {
 PORTD = Digit1;
 Delay_ms(100);
 }
}
