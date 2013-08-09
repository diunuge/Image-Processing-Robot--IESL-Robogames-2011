#line 1 "F:/Laptop/Programing & Competions/Robotics/Project - IESL Robot competition -Branstormers/brainstorm/Test/port check/test uart/test.c"
char debug =65;
void configure(){


 RCIE_bit = 1;
 GIE_bit = 1;
 PEIE_bit = 1;





 UART1_Init(9600);









 Delay_ms(500);


}

void interrupt(){

 if(RCIF_bit ==1){
 debug=UART1_Read();

 RCIF_bit=0;
 }

}

void main() {
 configure();
while(1){
 UART1_Write(debug);
 UART1_Write(' ');
 delay_ms(1000);
}

}
