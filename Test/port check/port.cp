#line 1 "F:/Laptop/Programing & Competions/Robotics/Project - IESL Robot competition -Branstormers/brainstorm/Test/port check/port.c"
void main() {
 TRISA = 0;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 TRISE = 0;

 PORTA = 255;
 PORTB = 255;
 PORTC = 255;
 PORTD = 255;
 PORTE = 255;


 while(1){

 delay_ms(1000);

 PORTA = 255;
 PORTB = 255;
 PORTC = 255;
 PORTD = 255;
 PORTE = 255;

 delay_ms(1000);

 PORTA = 0;
 PORTB = 0;
 PORTC = 0;
 PORTD = 0;
 PORTE = 0;
 }
}
