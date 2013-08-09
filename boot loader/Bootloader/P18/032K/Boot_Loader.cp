#line 1 "C:/Users/Chamith N Wijesinghe/Desktop/codes/Bootloader/P18/032K/Boot_Loader.c"
#line 40 "C:/Users/Chamith N Wijesinghe/Desktop/codes/Bootloader/P18/032K/Boot_Loader.c"
void Susart_Init(char Brg_reg);
void Susart_Write(char data_);
void Start_Bootload();
void Start_Program();
char Susart_Write_Loop(char send, char recieve);


void main() org 32112 {
#line 61 "C:/Users/Chamith N Wijesinghe/Desktop/codes/Bootloader/P18/032K/Boot_Loader.c"
 Susart_Init(64);
 if (Susart_Write_Loop('g','r')) {
 Start_Bootload();
 }
 else {
 Start_Program();
 }

}
