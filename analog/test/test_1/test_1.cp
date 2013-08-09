#line 1 "C:/Users/Robot/Desktop/brainstorm/analog/test/test_1/test_1.c"


void interrupt(){
 if(INTCON.ADIF){


 }
}

void initialize();

unsigned int temp_res,temp;

void main() {
 ADCON1 = 0x80;

 TRISA = 0xFF;
 TRISC = 0;
 TRISB = 0;

 do {
 temp_res = ADC_Read(0);
 temp = temp_res*5000/1024;
 PORTB = temp_res;
 PORTC = temp_res >> 8;
 } while(1);
}



void initialize(){
 PORTA = 255;
 ADCON0 = 0b10000000;
 ADCON1 = 0b01000001;
 INTCON.ADIF = 0;
 INTCON.ADIE = 1;
 INTCON.GIE = 1;


}
