char i, error, byte_read;                 // Auxiliary variables

void main(){

  //ADCON1  = 0b111;                             // Configure AN pins as digital I/O
  //ADCON = 0b0;
  TRISD = 0x00;
  PORTD = 0;
  TRISB = 0x00;                           // Set PORTB as output (error signalization)
  PORTB = 0;                              // No error

  error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
  if (error > 0) {
    PORTB = error;                        // Signalize Init error
    while(1) ;                            // Stop program
  }
  Delay_ms(100);

  for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
    Soft_UART_Write(i);
    Delay_ms(100);
  }

  while(1) {
    byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
    if (error)                            // If error was detected
      PORTB = error;                      //   signal it on PORTB
    else{
      Soft_UART_Write(byte_read);         // If error was not detected, return byte read
      PORTD = byte_read;
    }
  }
}