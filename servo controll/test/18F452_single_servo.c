void main() {
     int count=0;
     TRISA = 0;
     TRISB = 0x00;
     PORTB = 0x00;

        while(1)
        {

                for(count=0;count<100;count++)
                {  //far counter-clockwise
                PORTB = 0b00000011;
                delay_ms(2);
                PORTB = 0x00;
                delay_ms(18);
                }
                        //middle
        for(count=0;count<100;count++)
                {
                PORTB = 0b00000011;
                delay_ms(1);
                delay_us(500);
                PORTB = 0x00;
                delay_ms(18);
                delay_us(500);
                }
        for(count=0;count<100;count++)
                {  //far counter-clockwise
                PORTB = 0b00000011;
                delay_ms(1);
                PORTB = 0x00;
                delay_ms(19);
                }
        }
}