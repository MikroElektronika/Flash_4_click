/*
    __flash4_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __flash4_driver.h
@brief    Flash4 Driver
@mainpage Flash4 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   FLASH4
@brief      Flash4 Click Driver
@{

| Global Library Prefix | **FLASH4** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **okt 2018.**      |
| Developer             | **MikroE Team**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _FLASH4_H_
#define _FLASH4_H_

/** 
 * @macro T_FLASH4_P
 * @brief Driver Abstract type 
 */
#define T_FLASH4_P    const uint8_t*

/** @defgroup FLASH4_COMPILE Compilation Config */              /** @{ */

   #define   __FLASH4_DRV_SPI__                            /**<     @macro __FLASH4_DRV_SPI__  @brief SPI driver selector */
//  #define   __FLASH4_DRV_I2C__                            /**<     @macro __FLASH4_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __FLASH4_DRV_UART__                           /**<     @macro __FLASH4_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup FLASH4_VAR Variables */                           /** @{ */


extern const uint8_t _FLASH4_MANUFACTURER_ID;
extern const uint8_t _FLASH4_DEVICE_ID      ;


/* Commands */
extern const uint8_t _FLASH4_CMD_READ_ID                      ;
extern const uint8_t _FLASH4_CMD_READ_IDENTIFICATION          ;
extern const uint8_t _FLASH4_CMD_READ_ELECTRONIC_SIGNATURE    ;
extern const uint8_t _FLASH4_CMD_READ_SERIAL_FLASH_PARAMETERS ;
extern const uint8_t _FLASH4_CMD_READ_STATUS_REG_1            ;
extern const uint8_t _FLASH4_CMD_READ_STATUS_REG_2            ;
extern const uint8_t _FLASH4_CMD_READ_CONFIGURATION_REG       ;
extern const uint8_t _FLASH4_CMD_READ_BANK_REG                ;
extern const uint8_t _FLASH4_CMD_WRITE_BANK_REG               ;
extern const uint8_t _FLASH4_CMD_ACCESS_BANK_REG              ;
extern const uint8_t _FLASH4_CMD_WRITE_REGISTER_WRR           ;
extern const uint8_t _FLASH4_CMD_WRITE_ENABLE_WREN            ;
extern const uint8_t _FLASH4_CMD_WRITE_DISABLE_WRDI           ;
extern const uint8_t _FLASH4_CMD_CLEAR_STATUS_REG             ;
extern const uint8_t _FLASH4_CMD_READ_ECC_STATUS_REG          ;
extern const uint8_t _FLASH4_CMD_READ_AUTO_BOOT_REG           ;
extern const uint8_t _FLASH4_CMD_WRITE_AUTO_BOOT_REG          ;
extern const uint8_t _FLASH4_CMD_PROGRAM_NVDLR                ;
extern const uint8_t _FLASH4_CMD_WRITE_VDLR                   ;
extern const uint8_t _FLASH4_CMD_READ_DATA_LEARNING_PATTERN   ;
extern const uint8_t _FLASH4_CMD_READ_FLASH                   ;
extern const uint8_t _FLASH4_CMD_4READ_FLASH                  ;
extern const uint8_t _FLASH4_CMD_FAST_READ_FLASH              ;
extern const uint8_t _FLASH4_CMD_FAST_4READ_FLASH             ;
extern const uint8_t _FLASH4_CMD_FAST_READ_DDR                ;
extern const uint8_t _FLASH4_CMD_FAST_4READ_DDR               ;
extern const uint8_t _FLASH4_CMD_PAGE_PROGRAM                 ;
extern const uint8_t _FLASH4_CMD_PAGE_4PROGRAM                ;
extern const uint8_t _FLASH4_CMD_PROGRAM_SUSPEND              ;
extern const uint8_t _FLASH4_CMD_PROGRAM_RESUME               ;
extern const uint8_t _FLASH4_CMD_SECTOR_ERASE                 ;
extern const uint8_t _FLASH4_CMD_SECTOR_4ERASE                ;
extern const uint8_t _FLASH4_CMD_BULK_ERASE                   ;
extern const uint8_t _FLASH4_CMD_ERASE_SUSPEND                ;
extern const uint8_t _FLASH4_CMD_ERASE_RESUME                 ;
extern const uint8_t _FLASH4_CMD_WRITE_OTP_PROGRAM            ;
extern const uint8_t _FLASH4_CMD_READ_OTP                     ;
extern const uint8_t _FLASH4_CMD_READ_ASP                     ;
extern const uint8_t _FLASH4_CMD_WRITE_ASP_PROGRAM            ;
extern const uint8_t _FLASH4_CMD_READ_DYB                     ;
extern const uint8_t _FLASH4_CMD_WRITE_DYB                    ;
extern const uint8_t _FLASH4_CMD_READ_PPB                     ;
extern const uint8_t _FLASH4_CMD_WRITE_PPB                    ;
extern const uint8_t _FLASH4_CMD_ERASE_PPB                    ;
extern const uint8_t _FLASH4_CMD_READ_PPB_LOCK_BIT            ;
extern const uint8_t _FLASH4_CMD_WRITE_PPB_LOCK_BIT           ;
extern const uint8_t _FLASH4_CMD_SOFTWARE_RESET               ;
extern const uint8_t _FLASH4_CMD_MODE_BIT_RESET               ;
                                                                       /** @} */

#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup FLASH4_INIT Driver Initialization */              /** @{ */

#ifdef   __FLASH4_DRV_SPI__
void flash4_spiDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P spiObj);
#endif
#ifdef   __FLASH4_DRV_I2C__
void flash4_i2cDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P i2cObj, uint8_t slave);
#endif
#ifdef   __FLASH4_DRV_UART__
void flash4_uartDriverInit(T_FLASH4_P gpioObj, T_FLASH4_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void flash4_gpioDriverInit(T_FLASH4_P gpioObj);
                                                                       /** @} */
/** @defgroup FLASH4_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Functions for hardware reset chip
 */
void flash4_reset();

/**
 * @brief Functions for read Manufacturer ID
 *
 * @param[out] deviceID      [ 0 ] - Manufacturer ID and [ 1 ] - Device ID (hex)
 */
void flash4_readManufacturerID(uint8_t *deviceID);

/**
 * @brief Functions for Read Identification
 *
 * @param[out] outData      Data output
 * @param[in] nData         Number of data
 */
void flash4_readIdentification(uint8_t *outData, uint8_t nData);

/**
 * @brief Functions for Read Electronic Signature
 *
 * @retval  Device ID (0x19)
 */
uint8_t flash4_readElectronicID();

/**
 * @brief Functions for Read Serial Flash Discoverable Parameters
 *
 * @param[out] outParams      Data output
 * @param[in] nData           Number of data(max 200 byte)
 */
void flash4_readSerialFlashParameters(uint8_t *outParams, uint8_t nData);

/**
 * @brief Functions for read byte from register
 *
 * @param[in] reg    Register which will be read
 * @retval one byte data which is read from the register
 */
uint8_t flash4_readByte(uint8_t reg);

/**
 * @brief Functions for write one byte in register
 *
 * @param[in] reg    Register in which the data will be written
 * @param[in] _data  Data which be written in the register
 */
void flash4_writeByte(uint8_t reg, uint8_t _data);

/**
 * @brief Functions for write command
 *
 * @param[in] cmd    Command
 */
void flash4_writeCommand(uint8_t cmd);
void flash4_writeReg(uint8_t status, uint8_t config);

/**
 * @brief Functions for read ECC Status Register
 *
 * @param[out] outECC       Data output
 * @param[in] nDummy           Number of data(max 200 byte)
 */
void flash4_readECC(uint8_t *outECC, uint8_t nDummy);

/**
 * @brief Functions for read AutoBoot Register
 *
 * @param[out] outAB       Data output
 */
void flash4_readAutoBoot(uint8_t *outAB);

/**
 * @brief Functions for read Flash
 *
 * @param[out] outData         Data output
 * @param[in] addr             Start address
 * @param[in] nData            Number of data
 */
void flash4_readFlash(uint8_t *outData, uint32_t addr, uint8_t nData);

/**
 * @brief Functions for read Flash with 4 byte address
 *
 * @param[out] outData         Data output
 * @param[in] addr             Start address
 * @param[in] nData            Number of data
 */
void flash4_4ReadFlash(uint8_t *outData, uint32_t addr, uint8_t nData);

/**
 * @brief Functions for fast read Flash
 *
 * @param[out] outData              Data output
 * @param[in] addr                  Start address
 * @param[in] nDataDummy            Number of data
 */
void flash4_fastReadFlash(uint8_t *outData, uint32_t addr, uint8_t nDataDummy);

/**
 * @brief Functions for fast read Flash with 4 byte address
 *
 * @param[out] outData              Data output
 * @param[in] addr                  Start address
 * @param[in] nData                 Number of data
 */
void flash4_4FastReadFlash(uint8_t *outData,uint8_t addr, uint8_t nData);

/**
 * @brief Functions for write data in address with 4 byte address
 *
 * @param[in] inData                Data
 * @param[in] addr                  Start address
 * @param[in] nData                 Number of data
 */
void flash4_4PageProgram(uint8_t *inData, uint32_t addr, uint8_t nData);

/**
 * @brief Functions for sector Erase
 *
 * @param[in] addr                  Address for Erase
 */
void flash4_sectorErase(uint32_t addr);

/**
 * @brief Functions for sector Erase for 4 bytes address
 *
 * @param[in] addr                  Address for Erase
 */
void flash4_4sectorErase(uint32_t addr);

uint8_t flash4_checkWIP();
uint8_t flash4_checkWEL();
uint8_t flash4_checkPS();
uint8_t flash4_checkES();


                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_Flash4_STM.c
    @example Click_Flash4_TIVA.c
    @example Click_Flash4_CEC.c
    @example Click_Flash4_KINETIS.c
    @example Click_Flash4_MSP.c
    @example Click_Flash4_PIC.c
    @example Click_Flash4_PIC32.c
    @example Click_Flash4_DSPIC.c
    @example Click_Flash4_AVR.c
    @example Click_Flash4_FT90x.c
    @example Click_Flash4_STM.mbas
    @example Click_Flash4_TIVA.mbas
    @example Click_Flash4_CEC.mbas
    @example Click_Flash4_KINETIS.mbas
    @example Click_Flash4_MSP.mbas
    @example Click_Flash4_PIC.mbas
    @example Click_Flash4_PIC32.mbas
    @example Click_Flash4_DSPIC.mbas
    @example Click_Flash4_AVR.mbas
    @example Click_Flash4_FT90x.mbas
    @example Click_Flash4_STM.mpas
    @example Click_Flash4_TIVA.mpas
    @example Click_Flash4_CEC.mpas
    @example Click_Flash4_KINETIS.mpas
    @example Click_Flash4_MSP.mpas
    @example Click_Flash4_PIC.mpas
    @example Click_Flash4_PIC32.mpas
    @example Click_Flash4_DSPIC.mpas
    @example Click_Flash4_AVR.mpas
    @example Click_Flash4_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __flash4_driver.h

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