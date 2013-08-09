
_interrupt:

;test_1.c,3 :: 		void interrupt(){
;test_1.c,4 :: 		if(INTCON.ADIF){     //if A/D interrupt flag is set, ...
	BTFSS       INTCON+0, 6 
	GOTO        L_interrupt0
;test_1.c,7 :: 		}
L_interrupt0:
;test_1.c,8 :: 		}
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;test_1.c,14 :: 		void main() {
;test_1.c,15 :: 		ADCON1 = 0x80;
	MOVLW       128
	MOVWF       ADCON1+0 
;test_1.c,17 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW       255
	MOVWF       TRISA+0 
;test_1.c,18 :: 		TRISC  = 0;                 // PORTC is output
	CLRF        TRISC+0 
;test_1.c,19 :: 		TRISB  = 0;                 // PORTB is output
	CLRF        TRISB+0 
;test_1.c,21 :: 		do {
L_main1:
;test_1.c,22 :: 		temp_res = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_res+0 
	MOVF        R1, 0 
	MOVWF       _temp_res+1 
;test_1.c,23 :: 		temp = temp_res*5000/1024;
	MOVLW       136
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       10
	MOVWF       R2 
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
L__main5:
	BZ          L__main6
	RRCF        _temp+1, 1 
	RRCF        _temp+0, 1 
	BCF         _temp+1, 7 
	ADDLW       255
	GOTO        L__main5
L__main6:
;test_1.c,24 :: 		PORTB = temp_res;         // Send lower 8 bits to PORTB
	MOVF        _temp_res+0, 0 
	MOVWF       PORTB+0 
;test_1.c,25 :: 		PORTC = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF        _temp_res+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;test_1.c,26 :: 		} while(1);
	GOTO        L_main1
;test_1.c,27 :: 		}
	GOTO        $+0
; end of _main

_initialize:

;test_1.c,31 :: 		void initialize(){
;test_1.c,32 :: 		PORTA = 255;
	MOVLW       255
	MOVWF       PORTA+0 
;test_1.c,33 :: 		ADCON0 = 0b10000000;
	MOVLW       128
	MOVWF       ADCON0+0 
;test_1.c,34 :: 		ADCON1 = 0b01000001;
	MOVLW       65
	MOVWF       ADCON1+0 
;test_1.c,35 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;test_1.c,36 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;test_1.c,37 :: 		INTCON.GIE = 1;     //INTCON =
	BSF         INTCON+0, 7 
;test_1.c,40 :: 		}
	RETURN      0
; end of _initialize
