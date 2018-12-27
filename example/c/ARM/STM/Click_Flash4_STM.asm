_systemInit:
;Click_Flash4_STM.c,34 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Flash4_STM.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Flash4_STM.c,37 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Flash4_STM.c,39 :: 		mikrobus_spiInit( _MIKROBUS1, &_FLASH4_SPI_CFG[0] );
MOVW	R0, #lo_addr(__FLASH4_SPI_CFG+0)
MOVT	R0, #hi_addr(__FLASH4_SPI_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_spiInit+0
;Click_Flash4_STM.c,40 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_Flash4_STM.c,41 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_Flash4_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_Flash4_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Flash4_STM.c,42 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_Flash4_STM.c,43 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_Flash4_STM.c,45 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Flash4_STM.c,47 :: 		flash4_spiDriverInit( (T_FLASH4_P)&_MIKROBUS1_GPIO, (T_FLASH4_P)&_MIKROBUS1_SPI );
MOVW	R1, #lo_addr(__MIKROBUS1_SPI+0)
MOVT	R1, #hi_addr(__MIKROBUS1_SPI+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_flash4_spiDriverInit+0
;Click_Flash4_STM.c,48 :: 		flash4_reset();
BL	_flash4_reset+0
;Click_Flash4_STM.c,49 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_Flash4_STM.c,51 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Flash4_STM.c,53 :: 		flash4_writeCommand(_FLASH4_CMD_WRITE_ENABLE_WREN);
MOVS	R0, __FLASH4_CMD_WRITE_ENABLE_WREN
BL	_flash4_writeCommand+0
;Click_Flash4_STM.c,54 :: 		mikrobus_logWrite("--- Erase chip --START--", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_Flash4_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_Flash4_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Flash4_STM.c,55 :: 		flash4_4sectorErase(0x00001234);
MOVW	R0, #4660
BL	_flash4_4sectorErase+0
;Click_Flash4_STM.c,56 :: 		while(flash4_checkWIP());
L_applicationTask2:
BL	_flash4_checkWIP+0
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask3
IT	AL
BAL	L_applicationTask2
L_applicationTask3:
;Click_Flash4_STM.c,57 :: 		mikrobus_logWrite("--- Erase chip --DONE--", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr3_Click_Flash4_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_Flash4_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Flash4_STM.c,59 :: 		flash4_writeCommand(_FLASH4_CMD_WRITE_ENABLE_WREN);
MOVS	R0, __FLASH4_CMD_WRITE_ENABLE_WREN
BL	_flash4_writeCommand+0
;Click_Flash4_STM.c,60 :: 		flash4_4PageProgram(&dataBuffer[0], 0x00001234, 16);
MOVS	R2, #16
MOVW	R1, #4660
MOVW	R0, #lo_addr(_dataBuffer+0)
MOVT	R0, #hi_addr(_dataBuffer+0)
BL	_flash4_4PageProgram+0
;Click_Flash4_STM.c,61 :: 		while(flash4_checkWIP());
L_applicationTask4:
BL	_flash4_checkWIP+0
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask5
IT	AL
BAL	L_applicationTask4
L_applicationTask5:
;Click_Flash4_STM.c,62 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_Flash4_STM.c,64 :: 		flash4_4ReadFlash(&readBuffer[0],0x00001234, 16);
MOVS	R2, #16
MOVW	R1, #4660
MOVW	R0, #lo_addr(_readBuffer+0)
MOVT	R0, #hi_addr(_readBuffer+0)
BL	_flash4_4ReadFlash+0
;Click_Flash4_STM.c,65 :: 		while(flash4_checkWIP());
L_applicationTask6:
BL	_flash4_checkWIP+0
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask7
IT	AL
BAL	L_applicationTask6
L_applicationTask7:
;Click_Flash4_STM.c,66 :: 		mikrobus_logWrite("--- Read buffer : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr4_Click_Flash4_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_Flash4_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_Flash4_STM.c,67 :: 		mikrobus_logWrite(readBuffer, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_readBuffer+0)
MOVT	R0, #hi_addr(_readBuffer+0)
BL	_mikrobus_logWrite+0
;Click_Flash4_STM.c,69 :: 		Delay_ms( 7000 );
MOVW	R7, #48383
MOVT	R7, #1281
NOP
NOP
L_applicationTask8:
SUBS	R7, R7, #1
BNE	L_applicationTask8
NOP
NOP
NOP
;Click_Flash4_STM.c,70 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_Flash4_STM.c,72 :: 		void main()
SUB	SP, SP, #4
;Click_Flash4_STM.c,74 :: 		systemInit();
BL	_systemInit+0
;Click_Flash4_STM.c,75 :: 		applicationInit();
BL	_applicationInit+0
;Click_Flash4_STM.c,77 :: 		while (1)
L_main10:
;Click_Flash4_STM.c,79 :: 		applicationTask();
BL	_applicationTask+0
;Click_Flash4_STM.c,80 :: 		}
IT	AL
BAL	L_main10
;Click_Flash4_STM.c,81 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
