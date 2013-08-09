 
// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

void interrupt(){
     if(INTCON.ADIF){     //if A/D interrupt flag is set, ...
     
     
     }
}

void initialize();

void main()
{

     //initialize();
      unsigned long Vin, mV;
      unsigned char op[12];
      unsigned char i,j,lcd[5];
      TRISB = 0; // PORTB are outputs (LCD)
      TRISA = 0xFF; // PORTA is input
      //
      // Configure LCD
      //
      Lcd_Init(); // LCD is connected to PORTC
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1,1,"VOLTMETER");
      Delay_ms(2000);
      //
      // Configure A/D converter. AN0 is used in this project
      //
      ADCON1 = 0x80; // Use AN0 and Vref=+5V
      //
      // Program loop
      //
      for(;;) // Endless loop
      {
          Lcd_Cmd(_LCD_CLEAR);
          Vin = Adc_Read(0); // Read from channel 0 (AN0)
          Lcd_Out(1,1,"mV = "); // Display "mV = "
          mV = (Vin * 5000) >> 10; // mv = Vin x 5000 / 1024
          LongToStr(mV,op); // Convert to string in "op"
          //
          // Remove leading blanks
          //
          j=0;
          for(i=0;i<=11;i++)
          {
                if(op[i] != ' ') // If a blank
                {
                      lcd[j]=op[i];
                      j++;
                }
          }
          //
          // Display result on LCD
          //
          Lcd_Out(1,6,lcd); // Output to LCD
          Delay_ms(1000); // Wait 1 second
      }
}

void initialize(){
     PORTA = 255;
     ADCON0 = 0b10000000;
     ADCON1 = 0b01000001;
     INTCON.ADIF = 0;
     INTCON.ADIE = 1;
     INTCON.GIE = 1;     //INTCON =
     
     
}