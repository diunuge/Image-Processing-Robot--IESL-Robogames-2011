
_main:

;Boot_Loader.c,47 :: 		void main() org 32112 {
;Boot_Loader.c,61 :: 		Susart_Init(64);                    // Init USART at 9600
	MOVLW       64
	MOVWF       FARG_Susart_Init_Brg_reg+0 
	CALL        _Susart_Init+0, 0
;Boot_Loader.c,62 :: 		if (Susart_Write_Loop('g','r')) {   // Send 'g' for ~5 sec, if 'r'
	MOVLW       103
	MOVWF       FARG_Susart_Write_Loop_send+0 
	MOVLW       114
	MOVWF       FARG_Susart_Write_Loop_recieve+0 
	CALL        _Susart_Write_Loop+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main0
;Boot_Loader.c,63 :: 		Start_Bootload();                 //   received start bootload
	CALL        _Start_Bootload+0, 0
;Boot_Loader.c,64 :: 		}
	GOTO        L_main1
L_main0:
;Boot_Loader.c,66 :: 		Start_Program();                  //   else start program
	CALL        _Start_Program+0, 0
;Boot_Loader.c,67 :: 		}
L_main1:
;Boot_Loader.c,69 :: 		}
	GOTO        $+0
; end of _main
