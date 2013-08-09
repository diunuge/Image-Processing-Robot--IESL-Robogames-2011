void ssdecode(int i);
int number;
void main()
{
     TRISA = 0b00000001; //PORTA input
     TRISB = 0; //PORTB output
     number = 0; //Start from 0
     while (1)
     {
           if(PORTA.F0 == 1)
                       number = number +1;
           if(PORTA.F0 == 0)
                       PORTB.B7=1;
           Delay_ms(100);
           if(PORTA.F0 != 0)
                       PORTB.B7=0;
           if(number>9) number=0;
           ssdecode(number);
           Delay_ms(100);
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