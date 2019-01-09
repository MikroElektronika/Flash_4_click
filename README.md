![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# Flash4 Click

- **CIC Prefix**  : FLASH4
- **Author**      : MikroE Team
- **Verison**     : 1.0.0
- **Date**        : okt 2018.

---

### Software Support

We provide a library for the Flash4 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2603/flash-4-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library contains all the necessary functions for working with Flash 4 click.

Key functions :

- ``` void flash4_writeCommand(uint8_t cmd) ``` - Functions for write command
- ``` void flash4_4ReadFlash(uint8_t *outData, uint32_t addr, uint8_t nData) ``` - Functions for read Flash, with 4 byte address
- ``` void flash4_4PageProgram(uint8_t *inData, uint32_t addr, uint8_t nData) ``` - Functions for write data in Flash, with 4 byte address

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes SPI Module and sets RST pin and CS pin as OUTPUT
- Application Initialization - Initialization driver init and reset device
- Application Task - (code snippet) - Erases memory at 0x00001234.
                                      Writes a message (MikroElektronika) to address 0x00001234.
                                      Then reads the data from the address 0x00001234.


```.c
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
```


The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2603/flash-4-click) page.

Other mikroE Libraries used in the example:

- SPI

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
