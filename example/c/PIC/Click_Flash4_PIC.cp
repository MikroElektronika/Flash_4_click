#line 1 "D:/Clicks_git/F/Flash_4_click/SW/example/c/PIC/Click_Flash4_PIC.c"
#line 15 "D:/Clicks_git/F/Flash_4_click/SW/example/c/PIC/Click_Flash4_PIC.c"
unsigned char flash4EMS[2];
unsigned char flash4ID[100];
unsigned char flash4SFDP[100];
unsigned char flash4ECC[100];
unsigned char flash4AB[100];
unsigned char readData[20];
unsigned short dummyData[10];
unsigned char dataBuffer[22] = { 'M', 'i', 'k', 'r', 'o', ' ','E', 'l', 'e', 'k', 't', 'r','o', 'n', 'i', 'k', 'a', 13, 10, 0 };
unsigned short flash4ES[1];
unsigned short flash4SR1[1];
unsigned short flash4SR2[1];
unsigned short flash4CR[1];
unsigned short flash4BR[1];
unsigned short flash4DLPRD[1];
unsigned char txt[50];
unsigned short i;
unsigned short extadd;


void flash4_readEMS()
{
 LATE.B0 = 0;

 SPI1_Write(0x90);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);

 for(i = 0; i < 2; i ++)
 {
 flash4EMS[i] = SPI1_Read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readID(unsigned short nData)
{
 LATE.B0 = 0;

 SPI1_Write(0x9F);

 for(i = 0; i < nData; i ++)
 {
 flash4ID[i] = SPI1_Read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readES()
{
 LATE.B0 = 0;

 SPI1_Write(0xAB);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);

 flash4ES[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readSFDP(unsigned short nData)
{
 LATE.B0 = 0;

 SPI1_Write(0x5A);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 for(i = 0; i < nData; i ++)
 {
 flash4SFDP[i] = SPI1_Read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_readSR1()
{
 LATE.B0 = 0;

 SPI1_Write(0x05);
 flash4SR1[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readSR2()
{
 LATE.B0 = 0;

 SPI1_Write(0x07);
 flash4SR2[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readCR()
{
 LATE.B0 = 0;

 SPI1_Write(0x35);
 flash4CR[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readBR()
{
 LATE.B0 = 0;

 SPI1_Write(0x16);
 flash4BR[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeBR(unsigned char bank)
{
 LATE.B0 = 0;

 SPI1_Write(0x17);
 SPI1_Write(bank);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_accessBR()
{
 LATE.B0 = 0;

 SPI1_Write(0xB9);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeR(unsigned char status, unsigned char config)
{
 LATE.B0 = 0;

 if(config == 0)
 {
 SPI1_Write(0x01);
 SPI1_Write(status);
 }
 else if(config > 0)
 {
 SPI1_Write(0x01);
 SPI1_Write(status);
 SPI1_Write(config);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeEN()
{
 LATE.B0 = 0;

 SPI1_Write(0x06);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeDI()
{
 LATE.B0 = 0;

 SPI1_Write(0x04);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_clearSR()
{
 LATE.B0 = 0;



 SPI1_Write(0x30);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readECC(unsigned short nDummy)
{
 LATE.B0 = 0;

 SPI1_Write(0x18);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);
 SPI1_Write(0x00);

 for(i = 0; i < nDummy; i ++)
 {
 SPI1_Write(0x00);
 }
 for(i = 0; i < 16; i ++)
 {
 flash4ECC[i] = SPI1_Read(0x00);
 }

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readAB()
{
 LATE.B0 = 0;

 SPI1_Write(0x14);

 for(i = 0; i < 4; i ++)
 {
 flash4AB[i] = SPI1_Read(0x00);
 }

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeAB()
{
 LATE.B0 = 0;

 SPI1_Write(0x15);

 for(i = 0; i < 4; i ++)
 {
 flash4AB[i] = SPI1_Read(0x00);
 }

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_programNVDLR(unsigned char inData)
{
 LATE.B0 = 0;

 SPI1_Write(0x43);
 SPI1_Write(inData);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeVDLR(unsigned char inData)
{
 LATE.B0 = 0;

 SPI1_Write(0x4A);
 SPI1_Write(inData);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readDLPRD()
{
 LATE.B0 = 0;

 SPI1_Write(0x41);

 flash4DLPRD[0] = SPI1_Read(0x00);

 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_readFlash(unsigned char addrType, unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 if(addrType == 3)
 {
 LATE.B0 = 0;

 SPI1_Write(0x03);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
 else if(addrType == 4)
 {
 LATE.B0 = 0;

 SPI1_Write(0x03);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
}
void flash4_4ReadFlash(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0x13);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_fastReadFlash(unsigned long addr, unsigned short nData, unsigned short nDummy, unsigned short addrType)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 if(addrType == 3)
 {
 LATE.B0 = 0;

 SPI1_Write(0x03);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nDummy; i++)
 {
 dummyData[i] = SPI1_read(0x00);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
 else if(addrType == 4)
 {
 LATE.B0 = 0;

 SPI1_Write(0x03);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nDummy; i++)
 {
 dummyData[i] = SPI1_read(0x00);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
}
void flash4_4FastReadFlash(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[3] = (unsigned short)(addr & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[0] = (unsigned short)(addr>>24 & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0x0C);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_pageProgram(unsigned short addrType, unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 if(addrType == 3)
 {
 LATE.B0 = 0;

 SPI1_Write(0x02);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
 else if(addrType == 4)
 {
 LATE.B0 = 0;

 SPI1_Write(0x02);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
}
void flash4_4PageProgram(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[3] = (unsigned short)(addr & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[0] = (unsigned short)(addr>>24 & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0x12);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_sectorErase(unsigned short addrType, unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 if(addrType == 3)
 {
 LATE.B0 = 0;

 SPI1_Write(0xD8);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
 else if(addrType == 4)
 {
 LATE.B0 = 0;

 SPI1_Write(0xD8);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
 }
}
void flash4_4sectorErase(unsigned short addrType, unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xDC);
 for(i = 0; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);

}
void flash4_bulkErase()
{
 LATE.B0 = 0;

 SPI1_Write(0xC7);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_eraseSuspend()
{
 LATE.B0 = 0;

 SPI1_Write(0x75);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_eraseResume()
{
 LATE.B0 = 0;

 SPI1_Write(0x7A);

 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_programOTP(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0x42);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readOTP(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0x4B);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 SPI1_Write(0x00);
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_programASP()
{
 LATE.B0 = 0;

 SPI1_Write(0x2F);
 for(i = 0; i < 2; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readASP(unsigned short nData)
{
 LATE.B0 = 0;

 SPI1_Write(0x2B);
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeDYB(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xE1);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < 1; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readDYB(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xE0);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 SPI1_Write(0x00);
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_ProgramPPB(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xE3);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readPPB(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xE2);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_erasePPB()
{
 LATE.B0 = 0;

 SPI1_Write(0xE4);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readLockBit(unsigned long addr, unsigned short nData)
{
 unsigned short brake[5];

 brake[0] = (unsigned short)(addr>>24 & 0xFFul);
 brake[1] = (unsigned short)(addr>>16 & 0xFFul);
 brake[2] = (unsigned short)(addr>>8 & 0xFFul);
 brake[3] = (unsigned short)(addr & 0xFFul);

 LATE.B0 = 0;

 SPI1_Write(0xA7);
 for(i = 1; i < 4; i++)
 {
 SPI1_Write(brake[i]);
 }
 for(i = 0; i < nData; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_writeLockBit()
{
 LATE.B0 = 0;

 SPI1_Write(0xA6);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_programPASS()
{
 LATE.B0 = 0;

 SPI1_Write(0xE8);
 for(i = 0; i < 8; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_readPASS()
{
 LATE.B0 = 0;

 SPI1_Write(0xE7);
 for(i = 0; i < 8; i++)
 {
 readData[i] = SPI1_read(0x00);
 }
 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_unlockPASS()
{
 LATE.B0 = 0;

 SPI1_Write(0xE9);
 for(i = 0; i < 8; i++)
 {
 SPI1_Write(dataBuffer[i]);
 }
 LATE.B0 = 1;
 delay_ms(1);
}

void flash4_softReset()
{
 LATE.B0 = 0;

 SPI1_Write(0xF0);

 LATE.B0 = 1;
 delay_ms(1);
}
void flash4_modeReset()
{
 LATE.B0 = 0;

 SPI1_Write(0xFF);

 LATE.B0 = 1;
 delay_ms(1);
}

unsigned short flash4_checkWIP()
{
 flash4_readSR1();
 delay_ms(10);
 if(flash4SR1[0] & 0x01)
 {
 return 1;
 }
 else if (!(flash4SR1[0] & 0x01))
 {
 return 0;
 }
}
unsigned short flash4_checkWEL()
{
 flash4_readSR1();
 delay_ms(10);
 if(flash4SR1[0] & 0x02)
 {
 return 1;
 }
 else if (!(flash4SR1[0] & 0x02))
 {
 return 0;
 }
}
unsigned short flash4_checkPS()
{
 flash4_readSR2();
 delay_ms(10);
 if(flash4SR2[0] & 0x01)
 {
 return 1;
 }
 else if (!(flash4SR2[0] & 0x01))
 {
 return 0;
 }
}
unsigned short flash4_checkES()
{
 flash4_readSR2();
 delay_ms(10);
 if(flash4SR2[0] & 0x02)
 {
 return 1;
 }
 else if (!(flash4SR2[0] & 0x02))
 {
 return 0;
 }
}

void flash4_Init()
{
 LATC.B0 = 0;
 delay_ms(100);
 LATC.B0 = 1;

 LATE.B0 = 1;

 UART1_Write_Text(" ... Flash 4 click initialization done ... ");
 UART1_Write(13);
 UART1_Write(10);
}
void systemInit()
{
 ANCON0 = 0x00;
 ANCON1 = 0x00;
 ANCON2 = 0x00;

 TRISB.B1 = 0;
 TRISC.B0 = 0;
 TRISC.B2 = 0;
 TRISE.B0 = 0;

 LATC.B0 = 1;

 UART1_Init(9600);
 Delay_ms(1000);
 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 Delay_ms(2000);
 UART1_Write_Text(" ... System initialization done ... ");
 UART1_Write(13);
 UART1_Write(10);
}
void dataInit()
{
#line 935 "D:/Clicks_git/F/Flash_4_click/SW/example/c/PIC/Click_Flash4_PIC.c"
}

void main()
{
 systemInit();
 delay_ms(100);
 flash4_Init();
 delay_ms(100);
 dataInit();
 delay_ms(100);
 UART1_Write_Text(dataBuffer);
 delay_ms(50);
 UART1_Write(13);
 UART1_Write(10);
#line 964 "D:/Clicks_git/F/Flash_4_click/SW/example/c/PIC/Click_Flash4_PIC.c"
 flash4_writeEN();
 delay_ms(100);
 flash4_4PageProgram(0x00010000, 17);
 while(flash4_checkWIP());
 delay_ms(100);
 flash4_4ReadFlash(0x00010000, 17);
 while(flash4_checkWIP());
 delay_ms(100);
 UART1_Write_Text(readData);
 UART1_Write(13);
 UART1_Write(10);
}
