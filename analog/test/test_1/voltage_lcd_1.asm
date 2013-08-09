
_interrupt:

;voltage_lcd_1.c,18 :: 		void interrupt(){
;voltage_lcd_1.c,19 :: 		if(INTCON.ADIF){     //if A/D interrupt flag is set, ...
	BTFSS       INTCON+0, 6 
	GOTO        L_interrupt0
;voltage_lcd_1.c,22 :: 		}
L_interrupt0:
;voltage_lcd_1.c,23 :: 		}
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;voltage_lcd_1.c,27 :: 		void main()
;voltage_lcd_1.c,34 :: 		TRISB = 0; // PORTB are outputs (LCD)
	CLRF        TRISB+0 
;voltage_lcd_1.c,35 :: 		TRISA = 0xFF; // PORTA is input
	MOVLW       255
	MOVWF       TRISA+0 
;voltage_lcd_1.c,39 :: 		Lcd_Init(); // LCD is connected to PORTC
	CALL        _Lcd_Init+0, 0
;voltage_lcd_1.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;voltage_lcd_1.c,41 :: 		Lcd_Out(1,1,"VOLTMETER");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_voltage_lcd_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_voltage_lcd_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;voltage_lcd_1.c,42 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 0
	BRA         L_main1
	DECFSZ      R12, 1, 0
	BRA         L_main1
	DECFSZ      R11, 1, 0
	BRA         L_main1
	NOP
	NOP
;voltage_lcd_1.c,46 :: 		ADCON1 = 0x80; // Use AN0 and Vref=+5V
	MOVLW       128
	MOVWF       ADCON1+0 
;voltage_lcd_1.c,50 :: 		for(;;) // Endless loop
L_main2:
;voltage_lcd_1.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;voltage_lcd_1.c,53 :: 		Vin = Adc_Read(0); // Read from channel 0 (AN0)
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_Vin_L0+0 
	MOVF        R1, 0 
	MOVWF       main_Vin_L0+1 
	MOVLW       0
	MOVWF       main_Vin_L0+2 
	MOVWF       main_Vin_L0+3 
;voltage_lcd_1.c,54 :: 		Lcd_Out(1,1,"mV = "); // Display "mV = "
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_voltage_lcd_1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_voltage_lcd_1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;voltage_lcd_1.c,55 :: 		mV = (Vin * 5000) >> 10; // mv = Vin x 5000 / 1024
	MOVF        main_Vin_L0+0, 0 
	MOVWF       R0 
	MOVF        main_Vin_L0+1, 0 
	MOVWF       R1 
	MOVF        main_Vin_L0+2, 0 
	MOVWF       R2 
	MOVF        main_Vin_L0+3, 0 
	MOVWF       R3 
	MOVLW       136
	MOVWF       R4 
	MOVLW       19
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVF        R0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        R2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        R3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVF        R4, 0 
L__main11:
	BZ          L__main12
	RRCF        FARG_LongToStr_input+3, 1 
	RRCF        FARG_LongToStr_input+2, 1 
	RRCF        FARG_LongToStr_input+1, 1 
	RRCF        FARG_LongToStr_input+0, 1 
	BCF         FARG_LongToStr_input+3, 7 
	ADDLW       255
	GOTO        L__main11
L__main12:
;voltage_lcd_1.c,56 :: 		LongToStr(mV,op); // Convert to string in "op"
	MOVLW       main_op_L0+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(main_op_L0+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;voltage_lcd_1.c,60 :: 		j=0;
	CLRF        main_j_L0+0 
;voltage_lcd_1.c,61 :: 		for(i=0;i<=11;i++)
	CLRF        main_i_L0+0 
L_main5:
	MOVF        main_i_L0+0, 0 
	SUBLW       11
	BTFSS       STATUS+0, 0 
	GOTO        L_main6
;voltage_lcd_1.c,63 :: 		if(op[i] != ' ') // If a blank
	MOVLW       main_op_L0+0
	MOVWF       FSR0L 
	MOVLW       hi_addr(main_op_L0+0)
	MOVWF       FSR0H 
	MOVF        main_i_L0+0, 0 
	ADDWF       FSR0L, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	XORLW       32
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;voltage_lcd_1.c,65 :: 		lcd[j]=op[i];
	MOVLW       main_lcd_L0+0
	MOVWF       FSR1L 
	MOVLW       hi_addr(main_lcd_L0+0)
	MOVWF       FSR1H 
	MOVF        main_j_L0+0, 0 
	ADDWF       FSR1L, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       main_op_L0+0
	MOVWF       FSR0L 
	MOVLW       hi_addr(main_op_L0+0)
	MOVWF       FSR0H 
	MOVF        main_i_L0+0, 0 
	ADDWF       FSR0L, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;voltage_lcd_1.c,66 :: 		j++;
	INCF        main_j_L0+0, 1 
;voltage_lcd_1.c,67 :: 		}
L_main8:
;voltage_lcd_1.c,61 :: 		for(i=0;i<=11;i++)
	INCF        main_i_L0+0, 1 
;voltage_lcd_1.c,68 :: 		}
	GOTO        L_main5
L_main6:
;voltage_lcd_1.c,72 :: 		Lcd_Out(1,6,lcd); // Output to LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_lcd_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_lcd_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;voltage_lcd_1.c,73 :: 		Delay_ms(1000); // Wait 1 second
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 0
	BRA         L_main9
	DECFSZ      R12, 1, 0
	BRA         L_main9
	DECFSZ      R11, 1, 0
	BRA         L_main9
	NOP
;voltage_lcd_1.c,74 :: 		}
	GOTO        L_main2
;voltage_lcd_1.c,75 :: 		}
	GOTO        $+0
; end of _main

_initialize:

;voltage_lcd_1.c,77 :: 		void initialize(){
;voltage_lcd_1.c,78 :: 		PORTA = 255;
	MOVLW       255
	MOVWF       PORTA+0 
;voltage_lcd_1.c,79 :: 		ADCON0 = 0b10000000;
	MOVLW       128
	MOVWF       ADCON0+0 
;voltage_lcd_1.c,80 :: 		ADCON1 = 0b01000001;
	MOVLW       65
	MOVWF       ADCON1+0 
;voltage_lcd_1.c,81 :: 		INTCON.ADIF = 0;
	BCF         INTCON+0, 6 
;voltage_lcd_1.c,82 :: 		INTCON.ADIE = 1;
	BSF         INTCON+0, 6 
;voltage_lcd_1.c,83 :: 		INTCON.GIE = 1;     //INTCON =
	BSF         INTCON+0, 7 
;voltage_lcd_1.c,86 :: 		}
	RETURN      0
; end of _initialize
