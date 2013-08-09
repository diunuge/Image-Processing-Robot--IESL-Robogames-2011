char i, error, byte_read;                 // Auxiliary variables

void initialize_bluetooth();
void test_bluetooth();
char recieve_command();
void  send_command(char command);


void initialize_bluetooth(){
      error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
}

void test_bluetooth(){
      for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
            Soft_UART_Write(i);
            Delay_ms(100);
      }
}

char recieve_command(){
      return byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
}

void  send_command(char command){
      Soft_UART_Write(command);
}

