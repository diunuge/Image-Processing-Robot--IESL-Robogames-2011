//wijesinghe D.B.

void interrupt(){
     if(INTCON.ADIF){     //if A/D interrupt flag is set, ...
     
     
     }
}

void initialize();

unsigned int temp_res,temp;

void main() {
  ADCON1 = 0x80;

  TRISA  = 0xFF;              // PORTA is input
  TRISC  = 0;                 // PORTC is output
  TRISB  = 0;                 // PORTB is output

  do {
    temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
    temp = temp_res*5000/1024;
    PORTB = temp_res;         // Send lower 8 bits to PORTB
    PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
  } while(1);
}



void initialize(){
     PORTA = 255;
     ADCON0 = 0b10000000;
     ADCON1 = 0b01000001;
     INTCON.ADIF = 0;
     INTCON.ADIE = 1;
     INTCON.GIE = 1;     //INTCON =
     
     
}