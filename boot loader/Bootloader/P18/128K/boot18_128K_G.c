#include "built_in.h"

/*
 * constants :
 *  _FLASH_WRITE_LATCH - flash write latch size
 *  _FLASH_ERASE       - flash erase block size
 * are related to mcu flash memory write and erase block sizes
 * and as such are defined in appropriate flash library file.
 * Be aware that these constants are MCU dependent.
 * Compiler will link them from appropriate flash library,
 * so the user does not have to take care of them.
 *
 */

static char block[64];

void Susart_Init(unsigned short brg_reg) org 130768 {
  unsigned short i;

  TXSTA1.TXEN = 1;
  RCSTA1 = 0x90;
  TXSTA1.TX9D = 0; //8-bit transmission
  TXSTA1.BRGH = 1;
  SPBRG1 = brg_reg;
  TXSTA1.SYNC = 0;
  BAUDCON1.BRG16 = 0;
  TRISC.B7 = 1;
  TRISC.B6 = 0;

  while (PIR1.RCIF)
    i = RCREG1;
}


void Susart_Write(unsigned short data_) org 130728 {

  while (!TXSTA.TRMT)
    ;
  TXREG = data_;
}

unsigned short Susart_Data_Ready() org 130754 {
  return (PIR1.RCIF);
}

unsigned short Susart_Read() org 130696 {
  unsigned short rslt;
  rslt = RCREG1;

  if (RCSTA1.OERR) {
     RCSTA1.CREN = 0;
     RCSTA1.CREN = 1;
  }
  return rslt;
}

//-------------- Empty function, this is where the start address of 'real'
//               program will be placed (by Write_Begin()). That is why
//               this function must have at least 4 bytes of ROM available
//               after its org address.
void Start_Program() org 0x1FFC0 {
}

void Flash_Write_Sector(long address, char *sdata) org 130518 {
  unsigned short saveintcon, i, j;

  saveintcon = INTCON;

  //--- erase memory
  TBLPTRL = Lo(address);
  TBLPTRH = Hi(address);
  TBLPTRU = Higher(address);
  //--- required erase sequence
  EECON1.EEPGD = 1;
  EECON1.CFGS = 0;
  EECON1.WREN = 1;
  EECON1.FREE = 1;
  INTCON.GIE = 0;
  EECON2 = 0x55;
  EECON2 = 0xAA;
  EECON1.WR = 1;
  INTCON.GIE = 1;
  asm TBLRD*- ;
  //--- write memory
  FSR0L = Lo(sdata);
  FSR0H = Hi(sdata);
  j = 0;
  while (j < _FLASH_ERASE/_FLASH_WRITE_LATCH) {
    i = 0;
    while (i < _FLASH_WRITE_LATCH) {
      TABLAT  = POSTINC0;
      asm {
        TBLWT+*
      }
      i++;
    }
    EECON1.EEPGD = 1;
    EECON1.CFGS = 0;
    EECON1.WREN = 1;
    INTCON.GIE = 0;
    EECON2 = 0x55;
    EECON2 = 0xAA;
    EECON1.WR = 1;
    j++;
  }
  INTCON.GIE = 1;
  EECON1.WREN = 0;
  //--- restore interrupt
  INTCON = saveintcon;
}

unsigned short Susart_Write_Loop(char send, char receive) org 130460 {
  unsigned short rslt = 0;

  LBL_BOOT18_128_01:
    ___Boot_Delay128k();
    Susart_Write(send);
    ___Boot_Delay128k();

    rslt++;
    if (rslt == 255u)
      return 0;
    if (Susart_Read() == receive)
      return 1;
  goto LBL_BOOT18_128_01;
}

//-------------- This void will recover the bootlocation 0x0000, 0x0001 and
//               0x0002 to point to the bootloaer's main. It will also move
//               the reset vector of the program that is uploaded to a new
//               location, in this case 130424
void Write_Begin() org 130642 {

  Flash_Write_Sector(0x01FFC0, block);
  //--- goto main 130424
  block[0] = 0xBC;
  block[1] = 0xEF;
  block[2] = 0xFE;
  block[3] = 0xF0;
}

//-------------- Starts with bootload
void Start_Bootload() org 130804 {
  unsigned short i = 0, xx, yy;
  long j = 0;

  while (1) {
    if (i == 64u) {
      //--- If 32 words (64 bytes) recieved then write to flash
      if (!j)
        Write_Begin();
      Flash_Write_Sector(j, block);

      i = 0;
      j += 0x40;
    }
    //--- Ask for yy
    Susart_Write('y');
    while (!Susart_Data_Ready()) ;
    //--- Read yy
    yy = Susart_Read();
    //--- Ask for xx
    Susart_Write('x');
    while (!Susart_Data_Ready()) ;
    //--- Read xx
    xx = Susart_Read();
    //--- Save xxyy in block[i]
    block[i++] = yy;
    block[i++] = xx;
  }
}
