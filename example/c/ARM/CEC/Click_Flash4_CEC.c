/*
Example for Flash4 Click

    Date          : okt 2018.
    Author        : MikroE Team

Test configuration CEC :
    
    MCU              : CEC1702
    Dev. Board       : Clicker 2 for CEC1702
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes SPI Module and sets RST pin and CS pin as OUTPUT
- Application Initialization - Initialization driver init and reset device
- Application Task - (code snippet) - Erases memory at 0x00001234.
                                      Writes a message (MikroElektronika) to address 0x00001234.
                                      Then reads the data from the address 0x00001234.

*/

#include "Click_Flash4_types.h"
#include "Click_Flash4_config.h"

uint8_t dataBuffer[ 17 ] = { 'M', 'i', 'k', 'r', 'o', 'E', 'l', 'e', 'k', 't', 'r', 'o', 'n', 'i', 'k', 'a', 0 };
char readBuffer[ 20 ] = {0};
uint8_t cnt;

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    
    mikrobus_spiInit( _MIKROBUS1, &_FLASH4_SPI_CFG[0] );
    mikrobus_logInit( _MIKROBUS2, 9600 );
    mikrobus_logWrite("--- System Init ---", _LOG_LINE);
    Delay_ms( 100 );
}

void applicationInit()
{
    flash4_spiDriverInit( (T_FLASH4_P)&_MIKROBUS1_GPIO, (T_FLASH4_P)&_MIKROBUS1_SPI );
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