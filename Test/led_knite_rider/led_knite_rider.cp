#line 1 "C:/Users/Robot/Desktop/brainstorm/Test/led_knite_rider.c"
void moveLeft(){
 while(PORTB.B7 !=1){
 PORTB = PORTB*2;
 delay_ms(50);
 }

}
void moveRight(){
 while(PORTB.B0 !=1){
 PORTB = PORTB/2;
 delay_ms(50);
 }
}
void main() {
 TRISB = 0;
 PORTB = 255;
 delay_ms(1000);
 PORTB = 1;
 delay_ms(300);
 while(1){
 moveLeft();
 moveRight();
 }
}
