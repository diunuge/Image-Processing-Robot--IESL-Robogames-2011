
_main:

;microC_20MHz_877A.c,3 :: 		void main(){
;microC_20MHz_877A.c,7 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;microC_20MHz_877A.c,8 :: 		PORTD = 0;
	CLRF       PORTD+0
;microC_20MHz_877A.c,9 :: 		TRISB = 0x00;                           // Set PORTB as output (error signalization)
	CLRF       TRISB+0
;microC_20MHz_877A.c,10 :: 		PORTB = 0;                              // No error
	CLRF       PORTB+0
;microC_20MHz_877A.c,12 :: 		error = Soft_UART_Init(&PORTC, 7, 6, 9600, 0); // Initialize Soft UART at 9600 bps
	MOVLW      PORTC+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      7
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      6
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
	MOVF       R0+0, 0
	MOVWF      _error+0
;microC_20MHz_877A.c,13 :: 		if (error > 0) {
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main0
;microC_20MHz_877A.c,14 :: 		PORTB = error;                        // Signalize Init error
	MOVF       _error+0, 0
	MOVWF      PORTB+0
;microC_20MHz_877A.c,15 :: 		while(1) ;                            // Stop program
L_main1:
	GOTO       L_main1
;microC_20MHz_877A.c,16 :: 		}
L_main0:
;microC_20MHz_877A.c,17 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;microC_20MHz_877A.c,19 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	MOVLW      122
	MOVWF      _i+0
L_main4:
	MOVLW      65
	SUBWF      _i+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;microC_20MHz_877A.c,20 :: 		Soft_UART_Write(i);
	MOVF       _i+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;microC_20MHz_877A.c,21 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;microC_20MHz_877A.c,19 :: 		for (i = 'z'; i >= 'A'; i--) {          // Send bytes from 'z' downto 'A'
	DECF       _i+0, 1
;microC_20MHz_877A.c,22 :: 		}
	GOTO       L_main4
L_main5:
;microC_20MHz_877A.c,24 :: 		while(1) {
L_main8:
;microC_20MHz_877A.c,25 :: 		byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _byte_read+0
;microC_20MHz_877A.c,26 :: 		if (error)                            // If error was detected
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;microC_20MHz_877A.c,27 :: 		PORTB = error;                      //   signal it on PORTB
	MOVF       _error+0, 0
	MOVWF      PORTB+0
	GOTO       L_main11
L_main10:
;microC_20MHz_877A.c,29 :: 		Soft_UART_Write(byte_read);         // If error was not detected, return byte read
	MOVF       _byte_read+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;microC_20MHz_877A.c,30 :: 		PORTD = byte_read;
	MOVF       _byte_read+0, 0
	MOVWF      PORTD+0
;microC_20MHz_877A.c,31 :: 		}
L_main11:
;microC_20MHz_877A.c,32 :: 		}
	GOTO       L_main8
;microC_20MHz_877A.c,33 :: 		}
	GOTO       $+0
; end of _main
