#line 1 "C:/Users/Robot/Desktop/brainstorm/USRT/test/microC_12MHz/microC_12MHz.c"
char i, error, byte_read;

void main(){



 TRISD = 0x00;
 PORTD = 0;
 TRISB = 0x00;
 PORTB = 0;

 error = Soft_UART_Init(&PORTC, 7, 6, 14400, 0);
 if (error > 0) {
 PORTB = error;
 while(1) ;
 }
 Delay_ms(100);

 for (i = 'z'; i >= 'A'; i--) {
 Soft_UART_Write(i);
 Delay_ms(100);
 }

 while(1) {
 byte_read = Soft_UART_Read(&error);
 if (error)
 PORTB = error;
 else{
 Soft_UART_Write(byte_read);
 PORTD = byte_read;
 }
 }
}
