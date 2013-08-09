#line 1 "C:/Users/Robot/Desktop/brainstorm/servo controll/test/18F452_single_servo.c"
void main() {
 int count=0;
 TRISA = 0;
 TRISB = 0x00;
 PORTB = 0x00;

 while(1)
 {

 for(count=0;count<100;count++)
 {
 PORTB = 0b00000011;
 delay_ms(2);
 PORTB = 0x00;
 delay_ms(18);
 }

 for(count=0;count<100;count++)
 {
 PORTB = 0b00000011;
 delay_ms(1);
 delay_us(500);
 PORTB = 0x00;
 delay_ms(18);
 delay_us(400);
 }
 for(count=0;count<100;count++)
 {
 PORTB = 0b00000011;
 delay_ms(1);
 PORTB = 0x00;
 delay_ms(19);
 }
 }
}
