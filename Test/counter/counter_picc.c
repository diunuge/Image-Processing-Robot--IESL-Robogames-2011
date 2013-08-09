#include "16f877a.h "
#use delay(clock =20000000)
#fuses HS,NOWDT,NOLVP

void ssdecode(int i)
{
     
        output_high(PIN_B7);
		delay_ms(300);
		output_low(PIN_B7);
		delay_ms(300);
     
}

void main(){
	int number = 0;
	while (1)
     {
           if(input(PIN_A0) == 0)
                       ssdecode(number);
           //if(number>9) number=0;
           
           //Delay_ms(100);
     }
}