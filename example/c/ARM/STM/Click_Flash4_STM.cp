#line 1 "D:/Clicks_git/F/Flash_4_click/SW/example/c/ARM/STM/Click_Flash4_STM.c"
#line 1 "d:/clicks_git/f/flash_4_click/sw/example/c/arm/stm/click_flash4_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/f/flash_4_click/sw/example/c/arm/stm/click_flash4_config.h"
#line 1 "d:/clicks_git/f/flash_4_click/sw/example/c/arm/stm/click_flash4_types.h"
#line 4 "d:/clicks_git/f/flash_4_click/sw/example/c/arm/stm/click_flash4_config.h"
const uint32_t _FLASH4_SPI_CFG[ 2 ] =
{
 _SPI_FPCLK_DIV256,
 _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_CLK_IDLE_LOW |
 _SPI_MASTER |
 _SPI_MSB_FIRST |
 _SPI_8_BIT |
 _SPI_SSM_ENABLE |
 _SPI_SS_DISABLE |
 _SPI_SSI_1
};
#line 1 "d:/clicks_git/f/flash_4_click/sw/library/__flash4_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 58 "d:/clicks_git/f/flash_4_click/sw/library/__flash4_driver.h"
extern const uint8_t _FLASH4_MANUFACTURER_ID;
extern const uint8_t _FLASH4_DEVICE_ID ;



extern const uint8_t _FLASH4_CMD_READ_ID ;
extern const uint8_t _FLASH4_CMD_READ_IDENTIFICATION ;
extern const uint8_t _FLASH4_CMD_READ_ELECTRONIC_SIGNATURE ;
extern const uint8_t _FLASH4_CMD_READ_SERIAL_FLASH_PARAMETERS ;
extern const uint8_t _FLASH4_CMD_READ_STATUS_REG_1 ;
extern const uint8_t _FLASH4_CMD_READ_STATUS_REG_2 ;
extern const uint8_t _FLASH4_CMD_READ_CONFIGURATION_REG ;
extern const uint8_t _FLASH4_CMD_READ_BANK_REG ;
extern const uint8_t _FLASH4_CMD_WRITE_BANK_REG ;
extern const uint8_t _FLASH4_CMD_ACCESS_BANK_REG ;
extern const uint8_t _FLASH4_CMD_WRITE_REGISTER_WRR ;
extern const uint8_t _FLASH4_CMD_WRITE_ENABLE_WREN ;
extern const uint8_t _FLASH4_CMD_WRITE_DISABLE_WRDI ;
extern const uint8_t _FLASH4_CMD_CLEAR_STATUS_REG ;
extern const uint8_t _FLASH4_CMD_READ_ECC_STATUS_REG ;
extern const uint8_t _FLASH4_CMD_READ_AUTO_BOOT_REG ;
extern const uint8_t _FLASH4_CMD_WRITE_AUTO_BOOT_REG ;
extern const uint8_t _FLASH4_CMD_PROGRAM_NVDLR ;
extern const uint8_t _FLASH4_CMD_WRITE_VDLR ;
extern const uint8_t _FLASH4_CMD_READ_DATA_LEARNING_PATTERN ;
extern const uint8_t _FLASH4_CMD_READ_FLASH ;
extern const uint8_t _FLASH4_CMD_4READ_FLASH ;
extern const uint8_t _FLASH4_CMD_FAST_READ_FLASH ;
extern const uint8_t _FLASH4_CMD_FAST_4READ_FLASH ;
extern const uint8_t _FLASH4_CMD_FAST_READ_DDR ;
extern const uint8_t _FLASH4_CMD_FAST_4READ_DDR ;
extern const uint8_t _FLASH4_CMD_PAGE_PROGRAM ;
extern const uint8_t _FLASH4_CMD_PAGE_4PROGRAM ;
extern const uint8_t _FLASH4_CMD_PROGRAM_SUSPEND ;
extern const uint8_t _FLASH4_CMD_PROGRAM_RESUME ;
extern const uint8_t _FLASH4_CMD_SECTOR_ERASE ;
extern const uint8_t _FLASH4_CMD_SECTOR_4ERASE ;
extern const uint8_t _FLASH4_CMD_BULK_ERASE ;
extern const uint8_t _FLASH4_CMD_ERASE_SUSPEND ;
extern const uint8_t _FLASH4_CMD_ERASE_RESUME ;
extern const uint8_t _FLASH4_CMD_WRITE_OTP_PROGRAM ;
extern const uint8_t _FLASH4_CMD_READ_OTP ;
extern const uint8_t _FLASH4_CMD_READ_ASP ;
extern const uint8_t _FLASH4_CMD_WRITE_ASP_PROGRAM ;
extern const uint8_t _FLASH4_CMD_READ_DYB ;
extern const uint8_t _FLASH4_CMD_WRITE_DYB ;
extern const uint8_t _FLASH4_CMD_READ_PPB ;
extern const uint8_t _FLASH4_CMD_WRITE_PPB ;
extern const uint8_t _FLASH4_CMD_ERASE_PPB ;
extern const uint8_t _FLASH4_CMD_READ_PPB_LOCK_BIT ;
extern const uint8_t _FLASH4_CMD_WRITE_PPB_LOCK_BIT ;
extern const uint8_t _FLASH4_CMD_SOFTWARE_RESET ;
extern const uint8_t _FLASH4_CMD_MODE_BIT_RESET ;
#line 120 "d:/clicks_git/f/flash_4_click/sw/library/__flash4_driver.h"
void flash4_spiDriverInit( const uint8_t*  gpioObj,  const uint8_t*  spiObj);
#line 130 "d:/clicks_git/f/flash_4_click/sw/library/__flash4_driver.h"
void flash4_gpioDriverInit( const uint8_t*  gpioObj);




void flash4_readManufacturerID(uint8_t *deviceID);
void flash4_readIdentification(uint8_t *outData, uint8_t nData);
uint8_t flash4_readElectronicID();
void flash4_readSerialFlashParameters(uint8_t *outParams, uint8_t nData);
uint8_t flash4_readByte(uint8_t reg);
void flash4_writeByte(uint8_t reg, uint8_t _data);
void flash4_writeCommand(uint8_t cmd);
void flash4_writeReg(uint8_t status, uint8_t config);
void flash4_readECC(uint8_t *outECC, uint8_t nDummy);
void flash4_readAutoBoot(uint8_t *outAB);
void flash4_readFlash(uint8_t *outData, uint32_t addr, uint8_t nData);
void flash4_4ReadFlash(uint8_t *outData, uint32_t addr, uint8_t nData);
void flash4_fastReadFlash(uint8_t *outData, uint32_t addr, uint8_t nDataDummy);
void flash4_4FastReadFlash(uint8_t *outData,uint8_t addr, uint8_t nData);

void flash4_4PageProgram(uint8_t *inData, uint32_t addr, uint8_t nData);
void flash4_sectorErase(uint32_t addr);
void flash4_4sectorErase(uint32_t addr);
uint8_t flash4_checkWIP();
uint8_t flash4_checkWEL();
uint8_t flash4_checkPS();
uint8_t flash4_checkES();
void flash4_reset();
#line 30 "D:/Clicks_git/F/Flash_4_click/SW/example/c/ARM/STM/Click_Flash4_STM.c"
uint8_t dataBuffer[ 17 ] = { 'M', 'i', 'k', 'r', 'o', 'E', 'l', 'e', 'k', 't', 'r', 'o', 'n', 'i', 'k', 'a', 0 };
uint8_t readBuffer[ 20 ] = {0};
uint8_t cnt;

void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );

 mikrobus_spiInit( _MIKROBUS1, &_FLASH4_SPI_CFG[0] );
 mikrobus_logInit( _LOG_USBUART_A, 9600 );
 mikrobus_logWrite("--- System Init ---", _LOG_LINE);
 Delay_ms( 100 );
}

void applicationInit()
{
 flash4_spiDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_SPI );
 flash4_reset();
}

void applicationTask()
{
 flash4_writeCommand(_FLASH4_CMD_WRITE_ENABLE_WREN);
 mikrobus_logWrite("--- Erase chip --START--", _LOG_LINE);
 flash4_4sectorErase(0x00001234);
 while(flash4_checkWIP());
 mikrobus_logWrite("--- Erase chip --DONE--", _LOG_LINE);

 flash4_writeCommand(_FLASH4_CMD_WRITE_ENABLE_WREN);
 flash4_4PageProgram(&dataBuffer[0], 0x00001234, 16);
 while(flash4_checkWIP());
 Delay_100ms();

 flash4_4ReadFlash(&readBuffer[0],0x00001234, 16);
 while(flash4_checkWIP());
 mikrobus_logWrite("--- Read buffer : ", _LOG_TEXT);
 mikrobus_logWrite(readBuffer, _LOG_LINE);

 Delay_ms( 7000 );
}

void main()
{
 systemInit();
 applicationInit();

 while (1)
 {
 applicationTask();
 }
}
