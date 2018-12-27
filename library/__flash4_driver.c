/*
    __flash4_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__flash4_driver.h"
#include "__flash4_hal.c"

/* ------------------------------------------------------------------- MACROS */

const uint8_t _FLASH4_MANUFACTURER_ID = 0x01;
const uint8_t _FLASH4_DEVICE_ID       = 0x19;


/* Commands */
const uint8_t _FLASH4_CMD_READ_ID                      = 0x90;
const uint8_t _FLASH4_CMD_READ_IDENTIFICATION          = 0x9F;
const uint8_t _FLASH4_CMD_READ_ELECTRONIC_SIGNATURE    = 0xAB;
const uint8_t _FLASH4_CMD_READ_SERIAL_FLASH_PARAMETERS = 0x5A;
const uint8_t _FLASH4_CMD_READ_STATUS_REG_1            = 0x05;
const uint8_t _FLASH4_CMD_READ_STATUS_REG_2            = 0x07;
const uint8_t _FLASH4_CMD_READ_CONFIGURATION_REG       = 0x35;
const uint8_t _FLASH4_CMD_READ_BANK_REG                = 0x16;
const uint8_t _FLASH4_CMD_WRITE_BANK_REG               = 0x17;
const uint8_t _FLASH4_CMD_ACCESS_BANK_REG              = 0xB9;
const uint8_t _FLASH4_CMD_WRITE_REGISTER_WRR           = 0x01;
const uint8_t _FLASH4_CMD_WRITE_ENABLE_WREN            = 0x06;
const uint8_t _FLASH4_CMD_WRITE_DISABLE_WRDI           = 0x04;
const uint8_t _FLASH4_CMD_CLEAR_STATUS_REG             = 0x30;
const uint8_t _FLASH4_CMD_READ_ECC_STATUS_REG          = 0x18;
const uint8_t _FLASH4_CMD_READ_AUTO_BOOT_REG           = 0x14;
const uint8_t _FLASH4_CMD_WRITE_AUTO_BOOT_REG          = 0x15;
const uint8_t _FLASH4_CMD_PROGRAM_NVDLR                = 0x43;
const uint8_t _FLASH4_CMD_WRITE_VDLR                   = 0x4A;
const uint8_t _FLASH4_CMD_READ_DATA_LEARNING_PATTERN   = 0x41;
const uint8_t _FLASH4_CMD_READ_FLASH                   = 0x03;
const uint8_t _FLASH4_CMD_4READ_FLASH                  = 0x13;
const uint8_t _FLASH4_CMD_FAST_READ_FLASH              = 0x0B;
const uint8_t _FLASH4_CMD_FAST_4READ_FLASH             = 0x0C;
const uint8_t _FLASH4_CMD_FAST_READ_DDR                = 0x0D;
const uint8_t _FLASH4_CMD_FAST_4READ_DDR               = 0x0E;
const uint8_t _FLASH4_CMD_PAGE_PROGRAM                 = 0x02;
const uint8_t _FLASH4_CMD_PAGE_4PROGRAM                = 0x12;
const uint8_t _FLASH4_CMD_PROGRAM_SUSPEND              = 0x85;
const uint8_t _FLASH4_CMD_PROGRAM_RESUME               = 0x8A;
const uint8_t _FLASH4_CMD_SECTOR_ERASE                 = 0xD8;
const uint8_t _FLASH4_CMD_SECTOR_4ERASE                = 0xDC;
const uint8_t _FLASH4_CMD_BULK_ERASE                   = 0xC7;
const uint8_t _FLASH4_CMD_ERASE_SUSPEND                = 0x75;
const uint8_t _FLASH4_CMD_ERASE_RESUME                 = 0x7A;
const uint8_t _FLASH4_CMD_WRITE_OTP_PROGRAM            = 0x42;
const uint8_t _FLASH4_CMD_READ_OTP                     = 0x4B;
const uint8_t _FLASH4_CMD_READ_ASP                     = 0x2B;
const uint8_t _FLASH4_CMD_WRITE_ASP_PROGRAM            = 0x2F;
const uint8_t _FLASH4_CMD_READ_DYB                     = 0xE0;
const uint8_t _FLASH4_CMD_WRITE_DYB                    = 0xE1;
const uint8_t _FLASH4_CMD_READ_PPB                     = 0xE2;
const uint8_t _FLASH4_CMD_WRITE_PPB                    = 0xE3;
const uint8_t _FLASH4_CMD_ERASE_PPB                    = 0xE4;
const uint8_t _FLASH4_CMD_READ_PPB_LOCK_BIT            = 0xA7;
const uint8_t _FLASH4_CMD_WRITE_PPB_LOCK_BIT           = 0xA6;
const uint8_t _FLASH4_CMD_SOFTWARE_RESET               = 0xF0;
const uint8_t _FLASH4_CMD_MODE_BIT_RESET               = 0xFF;




/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __FLASH4_DRV_I2C__
static uint8_t _slaveAddress;
#endif

/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */

static void _memcpy(char * d1, char * s1, int n);

/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */

static void _memcpy(char * d1, char * s1, int n)
{
  char *dd;
  char *ss;

  ss = s1;
  dd = d1;
  while(n--)
    *dd++ = *ss++;
}

/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __FLASH4_DRV_SPI__

void flash4_spiDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
    hal_gpio_rstSet(1);
    hal_gpio_csSet(1);
}

#endif
#ifdef   __FLASH4_DRV_I2C__

void flash4_i2cDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __FLASH4_DRV_UART__

void flash4_uartDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
/* ----------------------------------------------------------- IMPLEMENTATION */

void flash4_readManufacturerID(uint8_t *deviceID)
{
    uint8_t writeReg[ 6 ];
    uint8_t readReg[ 6 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_ID;
    writeReg[ 1 ] = 0x00;
    writeReg[ 2 ] = 0x00;
    writeReg[ 3 ] = 0x00;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readReg, 6);
    hal_gpio_csSet( 1 );
    
    _memcpy(deviceID, &readReg[4], 2);
}

void flash4_readIdentification(uint8_t *outData, uint8_t nData)                                                      // read ID (RDID 9Fh)(JEDEC Manufacturer ID and JEDEC CFI)
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_IDENTIFICATION;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, nData + 1);
    hal_gpio_csSet( 1 );
    
    _memcpy(outData, &readData[1], nData);
}

uint8_t flash4_readElectronicID()
{
    uint8_t writeReg[ 5 ];
    uint8_t readReg[ 5 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_ELECTRONIC_SIGNATURE;
    writeReg[ 1 ] = 0x00;
    writeReg[ 2 ] = 0x00;
    writeReg[ 3 ] = 0x00;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readReg, 5);
    hal_gpio_csSet( 1 );

    return readReg[ 4 ];
}

void flash4_readSerialFlashParameters(uint8_t *outParams, uint8_t nData)
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_SERIAL_FLASH_PARAMETERS;
    writeReg[ 1 ] = 0x00;
    writeReg[ 2 ] = 0x00;
    writeReg[ 3 ] = 0x00;
    writeReg[ 4 ] = 0x00;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5 + nData);
    hal_gpio_csSet( 1 );
    
    _memcpy(outParams, &readData[5], nData);
}

uint8_t flash4_readByte(uint8_t reg)
{
    uint8_t writeReg[ 2 ];
    uint8_t readReg[ 2 ];
    
    writeReg[ 0 ] = reg;

    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readReg, 2);
    hal_gpio_csSet( 1 );
    
    return readReg[ 1 ];
}

void flash4_writeByte(uint8_t reg, uint8_t _data)
{
    uint8_t writeReg[ 2 ];
    
    writeReg[ 0 ] = reg;
    writeReg[ 1 ] = _data;
    
    hal_gpio_csSet( 0 );
    hal_spiWrite(writeReg, 2);
    hal_gpio_csSet( 1 );
}

void flash4_writeCommand(uint8_t cmd)
{
    uint8_t writeReg;
    
    writeReg = cmd;
    
    hal_gpio_csSet( 0 );
    hal_spiWrite(&writeReg, 1);
    hal_gpio_csSet( 1 );
}

void flash4_writeReg(uint8_t status, uint8_t config)
{
    uint8_t writeReg[ 3 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_WRITE_REGISTER_WRR;
    writeReg[ 1 ] = status;
    writeReg[ 2 ] = config;
    
    hal_gpio_csSet( 0 );
    hal_spiWrite(writeReg, 3);
    hal_gpio_csSet( 1 );
}

void flash4_readECC(uint8_t *outECC, uint8_t nDummy)
{
    uint8_t writeReg[ 21 ];
    uint8_t readData[ 21 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_ECC_STATUS_REG;
    writeReg[ 1 ] = 0x00;
    writeReg[ 2 ] = 0x00;
    writeReg[ 3 ] = 0x00;
    writeReg[ 4 ] = 0x00;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 21);
    hal_gpio_csSet( 1 );

    _memcpy(outECC, readData[ 5 ], 16);
}

void flash4_readAutoBoot(uint8_t *outAB)
{
    uint8_t writeReg[ 1 ];
    uint8_t readData[ 5 ];
    
    writeReg[ 0 ] = _FLASH4_CMD_READ_AUTO_BOOT_REG;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5);
    hal_gpio_csSet( 1 );
    
    _memcpy(outAB, &readData[ 1 ], 4);
}

void flash4_readFlash(uint8_t *outData, uint32_t addr, uint8_t nData)
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];
    
    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFF);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFF);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFF);
    writeReg[ 4 ] = (uint8_t)(addr & 0xFF);

    writeReg[ 0 ] = _FLASH4_CMD_READ_FLASH;

    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5 + nData);
    hal_gpio_csSet( 1 );
    
    _memcpy(outData, &readData[ 5 ], nData);
}

void flash4_4ReadFlash(uint8_t *outData, uint32_t addr, uint8_t nData)
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];

    writeReg[ 1 ] = (uint8_t)(addr>>24 );
    writeReg[ 2 ] = (uint8_t)(addr>>16 );
    writeReg[ 3 ] = (uint8_t)(addr>>8 );
    writeReg[ 4 ] = (uint8_t)(addr);

    writeReg[ 0 ] = _FLASH4_CMD_4READ_FLASH;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5 + nData);
    hal_gpio_csSet( 1 );

    _memcpy(outData, &readData[ 5 ], nData);
}

void flash4_fastReadFlash(uint8_t *outData, uint32_t addr, uint8_t nDataDummy)
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];

    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFFul);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFFul);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFFul);
    writeReg[ 4 ] = (uint8_t)(addr & 0xFFul);

    writeReg[ 0 ] = _FLASH4_CMD_FAST_READ_FLASH;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5 + nDataDummy);
    hal_gpio_csSet( 1 );

    _memcpy(outData, &readData[5], nDataDummy);
}

void flash4_4FastReadFlash(uint8_t *outData,uint8_t addr, uint8_t nData)  // 4Read 0Ch
{
    uint8_t writeReg[ 256 ];
    uint8_t readData[ 256 ];

    writeReg[ 4 ] = (uint8_t)(addr & 0xFFul);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFFul);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFFul);
    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFFul);

    writeReg[ 0 ] = _FLASH4_CMD_FAST_4READ_FLASH;
    
    hal_gpio_csSet( 0 );
    hal_spiTransfer(writeReg, readData, 5 + nData);
    hal_gpio_csSet( 1 );

    _memcpy(outData, &readData[5], nData);
}

void flash4_4PageProgram(uint8_t *inData, uint32_t addr, uint8_t nData)
{
    uint8_t writeReg[ 256 ];
    
    writeReg[ 4 ] = (uint8_t)(addr & 0xFF);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFF);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFF);
    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFF);

    writeReg[ 0 ] = _FLASH4_CMD_PAGE_4PROGRAM;

    _memcpy(&writeReg[5], inData, ndata);
    
    hal_gpio_csSet( 0 );
    hal_spiWrite(writeReg, 5 + nData);
    hal_gpio_csSet( 1 );
}

void flash4_sectorErase(uint32_t addr)
{
    uint8_t writeReg[ 5 ];

    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFFul);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFFul);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFFul);
    writeReg[ 4 ] = (uint8_t)(addr & 0xFFul);

    writeReg[ 0 ] = _FLASH4_CMD_SECTOR_ERASE;
    
    hal_gpio_csSet( 0 );
    hal_spiWrite(writeReg, 5);
    hal_gpio_csSet( 1 );
}

void flash4_4sectorErase(uint32_t addr)
{
    uint8_t writeReg[ 5 ];

    writeReg[ 1 ] = (uint8_t)(addr>>24 & 0xFFul);
    writeReg[ 2 ] = (uint8_t)(addr>>16 & 0xFFul);
    writeReg[ 3 ] = (uint8_t)(addr>>8 & 0xFFul);
    writeReg[ 4 ] = (uint8_t)(addr & 0xFFul);

    writeReg[ 0 ] = _FLASH4_CMD_SECTOR_4ERASE;

    hal_gpio_csSet( 0 );
    hal_spiWrite(writeReg, 5);
    hal_gpio_csSet( 1 );
}

uint8_t flash4_checkWIP()
{
    uint8_t readData;
    
    readData = flash4_readByte(_FLASH4_CMD_READ_STATUS_REG_1);
    if(readData & 0x01)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
uint8_t flash4_checkWEL()
{
    uint8_t readData;

    readData = flash4_readByte(_FLASH4_CMD_READ_STATUS_REG_1);
    if(readData & 0x02)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
uint8_t flash4_checkPS()
{
    uint8_t readData;

    readData = flash4_readByte(_FLASH4_CMD_READ_STATUS_REG_2);

    if(readData & 0x01)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

uint8_t flash4_checkES()
{
    uint8_t readData;

    readData = flash4_readByte(_FLASH4_CMD_READ_STATUS_REG_2);
    if(readData & 0x02)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void flash4_reset()
{
    hal_gpio_rstSet( 0 );
    Delay_100ms();
    hal_gpio_rstSet( 1 );
}



/*
  __flash4_driver.c

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */