
_configure:

;test.c,2 :: 		void configure(){
;test.c,5 :: 		RCIE_bit = 1;                    // Enable USART Receiver interrupt
	BSF         RCIE_bit+0, 5 
;test.c,6 :: 		GIE_bit = 1;                     // Enable Global interrupt
	BSF         GIE_bit+0, 7 
;test.c,7 :: 		PEIE_bit = 1;                    // Enable Peripheral interrupt
	BSF         PEIE_bit+0, 6 
;test.c,13 :: 		UART1_Init(9600);
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;test.c,23 :: 		Delay_ms(500);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_configure0:
	DECFSZ      R13, 1, 0
	BRA         L_configure0
	DECFSZ      R12, 1, 0
	BRA         L_configure0
	DECFSZ      R11, 1, 0
	BRA         L_configure0
	NOP
	NOP
;test.c,26 :: 		}
	RETURN      0
; end of _configure

_interrupt:

;test.c,28 :: 		void interrupt(){
;test.c,30 :: 		if(RCIF_bit ==1){//if uart interrupt is happen
	BTFSS       RCIF_bit+0, 5 
	GOTO        L_interrupt1
;test.c,31 :: 		debug=UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _debug+0 
;test.c,33 :: 		RCIF_bit=0;
	BCF         RCIF_bit+0, 5 
;test.c,34 :: 		}
L_interrupt1:
;test.c,36 :: 		}
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;test.c,38 :: 		void main() {
;test.c,39 :: 		configure();
	CALL        _configure+0, 0
;test.c,40 :: 		while(1){
L_main2:
;test.c,41 :: 		UART1_Write(debug);
	MOVF        _debug+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;test.c,42 :: 		UART1_Write(' ');
	MOVLW       32
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;test.c,43 :: 		delay_ms(1000);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       175
	MOVWF       R12, 0
	MOVLW       182
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 0
	BRA         L_main4
	DECFSZ      R12, 1, 0
	BRA         L_main4
	DECFSZ      R11, 1, 0
	BRA         L_main4
	NOP
;test.c,44 :: 		}
	GOTO        L_main2
;test.c,46 :: 		}
	GOTO        $+0
; end of _main
