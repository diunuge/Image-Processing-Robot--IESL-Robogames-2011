#line 1 "C:/Users/Robot/Desktop/brainstorm/analog/test/test_1/voltage_lcd_1.c"


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


void interrupt(){
 if(INTCON.ADIF){


 }
}

void initialize();

void main()
{


 unsigned long Vin, mV;
 unsigned char op[12];
 unsigned char i,j,lcd[5];
 TRISB = 0;
 TRISA = 0xFF;



 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"VOLTMETER");
 Delay_ms(2000);



 ADCON1 = 0x80;



 for(;;)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Vin = Adc_Read(0);
 Lcd_Out(1,1,"mV = ");
 mV = (Vin * 5000) >> 10;
 LongToStr(mV,op);



 j=0;
 for(i=0;i<=11;i++)
 {
 if(op[i] != ' ')
 {
 lcd[j]=op[i];
 j++;
 }
 }



 Lcd_Out(1,6,lcd);
 Delay_ms(1000);
 }
}

void initialize(){
 PORTA = 255;
 ADCON0 = 0b10000000;
 ADCON1 = 0b01000001;
 INTCON.ADIF = 0;
 INTCON.ADIE = 1;
 INTCON.GIE = 1;


}
