char debug =65;
void configure(){


      RCIE_bit = 1;                    // Enable USART Receiver interrupt
      GIE_bit = 1;                     // Enable Global interrupt
      PEIE_bit = 1;                    // Enable Peripheral interrupt

      //PWM1_Init(5000);
      //PWM2_Init(5000);
      //PWM1_Start();
      //PWM2_Start();
      UART1_Init(9600);
      //INTCON=0b11010000;
      //PIR2.B1=0;             //TMR3 Overflow Interrupt Flag bit
      //PIE2.B1=1;             //TMR3 Overflow Interrupt Enable bit
      //T3CON=0b00010001;
      //TMR3L=200;           //one register of 16 bit Timer 3 (TME3H & TMR3L)
      //ADCON1=0;

     // ADCON0 = 0b11000001;
     // ADCON1 = 0b00000000;   //ADCON1 = 0b00000000;
     Delay_ms(500);


}

void interrupt(){
      //debug = '1';
      if(RCIF_bit ==1){//if uart interrupt is happen
            debug=UART1_Read();

            RCIF_bit=0;
      }
      //TMR0IF = 0;
}

void main() {
 configure();
while(1){
         UART1_Write(debug);
        UART1_Write(' ');
      delay_ms(1000);
}

}