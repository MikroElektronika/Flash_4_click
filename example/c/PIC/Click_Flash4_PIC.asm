
_flash4_readEMS:

;Click_Flash4_PIC.c,34 :: 		void flash4_readEMS()                                                                         // read electronic manufacturer signature (Read_ID or REMS 90h)
;Click_Flash4_PIC.c,36 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,38 :: 		SPI1_Write(0x90);                      // command byte
	MOVLW       144
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,39 :: 		SPI1_Write(0x00);                      // address byte MSB
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,40 :: 		SPI1_Write(0x00);                      // address byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,41 :: 		SPI1_Write(0x00);                      // address byte LSB
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,43 :: 		for(i = 0; i < 2; i ++)
	CLRF        _i+0 
L_flash4_readEMS0:
	MOVLW       2
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readEMS1
;Click_Flash4_PIC.c,45 :: 		flash4EMS[i] = SPI1_Read(0x00);
	MOVLW       _flash4EMS+0
	MOVWF       FLOC__flash4_readEMS+0 
	MOVLW       hi_addr(_flash4EMS+0)
	MOVWF       FLOC__flash4_readEMS+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readEMS+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readEMS+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readEMS+0, FSR1
	MOVFF       FLOC__flash4_readEMS+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,43 :: 		for(i = 0; i < 2; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,46 :: 		}
	GOTO        L_flash4_readEMS0
L_flash4_readEMS1:
;Click_Flash4_PIC.c,47 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,48 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readEMS3:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readEMS3
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readEMS3
	NOP
;Click_Flash4_PIC.c,49 :: 		}
L_end_flash4_readEMS:
	RETURN      0
; end of _flash4_readEMS

_flash4_readID:

;Click_Flash4_PIC.c,50 :: 		void flash4_readID(unsigned short nData)                                                      // read ID (RDID 9Fh)(JEDEC Manufacturer ID and JEDEC CFI)
;Click_Flash4_PIC.c,52 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,54 :: 		SPI1_Write(0x9F);
	MOVLW       159
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,56 :: 		for(i = 0; i < nData; i ++)
	CLRF        _i+0 
L_flash4_readID4:
	MOVF        FARG_flash4_readID_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readID5
;Click_Flash4_PIC.c,58 :: 		flash4ID[i] = SPI1_Read(0x00);
	MOVLW       _flash4ID+0
	MOVWF       FLOC__flash4_readID+0 
	MOVLW       hi_addr(_flash4ID+0)
	MOVWF       FLOC__flash4_readID+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readID+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readID+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readID+0, FSR1
	MOVFF       FLOC__flash4_readID+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,56 :: 		for(i = 0; i < nData; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,59 :: 		}
	GOTO        L_flash4_readID4
L_flash4_readID5:
;Click_Flash4_PIC.c,60 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,61 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readID7:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readID7
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readID7
	NOP
;Click_Flash4_PIC.c,62 :: 		}
L_end_flash4_readID:
	RETURN      0
; end of _flash4_readID

_flash4_readES:

;Click_Flash4_PIC.c,63 :: 		void flash4_readES()                                                                          // read electronic signature (RES ABh)
;Click_Flash4_PIC.c,65 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,67 :: 		SPI1_Write(0xAB);                     // command byte
	MOVLW       171
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,68 :: 		SPI1_Write(0x00);                     // dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,69 :: 		SPI1_Write(0x00);                     // dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,70 :: 		SPI1_Write(0x00);                     // dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,72 :: 		flash4ES[0] = SPI1_Read(0x00);
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4ES+0 
;Click_Flash4_PIC.c,74 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,75 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readES8:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readES8
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readES8
	NOP
;Click_Flash4_PIC.c,76 :: 		}
L_end_flash4_readES:
	RETURN      0
; end of _flash4_readES

_flash4_readSFDP:

;Click_Flash4_PIC.c,77 :: 		void flash4_readSFDP(unsigned short nData)                                                    // read Serial Flash Discoverable Parameters (RSFDP 5Ah)
;Click_Flash4_PIC.c,79 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,81 :: 		SPI1_Write(0x5A);                     // command byte
	MOVLW       90
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,82 :: 		SPI1_Write(0x00);                     // address byte MSB
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,83 :: 		SPI1_Write(0x00);                     // address byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,84 :: 		SPI1_Write(0x00);                     // address byte LSB
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,85 :: 		SPI1_Write(0x00);                     // dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,86 :: 		for(i = 0; i < nData; i ++)
	CLRF        _i+0 
L_flash4_readSFDP9:
	MOVF        FARG_flash4_readSFDP_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readSFDP10
;Click_Flash4_PIC.c,88 :: 		flash4SFDP[i] = SPI1_Read(0x00);
	MOVLW       _flash4SFDP+0
	MOVWF       FLOC__flash4_readSFDP+0 
	MOVLW       hi_addr(_flash4SFDP+0)
	MOVWF       FLOC__flash4_readSFDP+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readSFDP+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readSFDP+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readSFDP+0, FSR1
	MOVFF       FLOC__flash4_readSFDP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,86 :: 		for(i = 0; i < nData; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,89 :: 		}
	GOTO        L_flash4_readSFDP9
L_flash4_readSFDP10:
;Click_Flash4_PIC.c,90 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,91 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readSFDP12:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readSFDP12
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readSFDP12
	NOP
;Click_Flash4_PIC.c,92 :: 		}
L_end_flash4_readSFDP:
	RETURN      0
; end of _flash4_readSFDP

_flash4_readSR1:

;Click_Flash4_PIC.c,94 :: 		void flash4_readSR1()                                                                         // read status register 1 (RDSR1 05h)
;Click_Flash4_PIC.c,96 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,98 :: 		SPI1_Write(0x05);                     // command byte
	MOVLW       5
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,99 :: 		flash4SR1[0] = SPI1_Read(0x00);          // status - can be called during erase, program and write operations
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4SR1+0 
;Click_Flash4_PIC.c,101 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,102 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readSR113:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readSR113
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readSR113
	NOP
;Click_Flash4_PIC.c,103 :: 		}
L_end_flash4_readSR1:
	RETURN      0
; end of _flash4_readSR1

_flash4_readSR2:

;Click_Flash4_PIC.c,104 :: 		void flash4_readSR2()                                                                         // read status register 2 (RDSR2 07h)
;Click_Flash4_PIC.c,106 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,108 :: 		SPI1_Write(0x07);                     // command byte
	MOVLW       7
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,109 :: 		flash4SR2[0] = SPI1_Read(0x00);          // status - can be called during erase, program and write operations
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4SR2+0 
;Click_Flash4_PIC.c,111 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,112 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readSR214:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readSR214
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readSR214
	NOP
;Click_Flash4_PIC.c,113 :: 		}
L_end_flash4_readSR2:
	RETURN      0
; end of _flash4_readSR2

_flash4_readCR:

;Click_Flash4_PIC.c,114 :: 		void flash4_readCR()                                                                          // read configuration register (RDCR 35h)
;Click_Flash4_PIC.c,116 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,118 :: 		SPI1_Write(0x35);                     // command byte
	MOVLW       53
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,119 :: 		flash4CR[0] = SPI1_Read(0x00);           // configuration - can be called during erase, program and write operations
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4CR+0 
;Click_Flash4_PIC.c,121 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,122 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readCR15:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readCR15
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readCR15
	NOP
;Click_Flash4_PIC.c,123 :: 		}
L_end_flash4_readCR:
	RETURN      0
; end of _flash4_readCR

_flash4_readBR:

;Click_Flash4_PIC.c,124 :: 		void flash4_readBR()                                                                          // bakn register read (BRRD 16h)
;Click_Flash4_PIC.c,126 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,128 :: 		SPI1_Write(0x16);                     // command byte
	MOVLW       22
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,129 :: 		flash4BR[0] = SPI1_Read(0x00);           // bank
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4BR+0 
;Click_Flash4_PIC.c,131 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,132 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readBR16:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readBR16
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readBR16
	NOP
;Click_Flash4_PIC.c,133 :: 		}
L_end_flash4_readBR:
	RETURN      0
; end of _flash4_readBR

_flash4_writeBR:

;Click_Flash4_PIC.c,134 :: 		void flash4_writeBR(unsigned char bank)                                                       // bank register write (BRWR 17h)
;Click_Flash4_PIC.c,136 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,138 :: 		SPI1_Write(0x17);                     // command byte
	MOVLW       23
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,139 :: 		SPI1_Write(bank);
	MOVF        FARG_flash4_writeBR_bank+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,141 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,142 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeBR17:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeBR17
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeBR17
	NOP
;Click_Flash4_PIC.c,143 :: 		}
L_end_flash4_writeBR:
	RETURN      0
; end of _flash4_writeBR

_flash4_accessBR:

;Click_Flash4_PIC.c,144 :: 		void flash4_accessBR()                                                                        // bank register access (BRAC B9h)
;Click_Flash4_PIC.c,146 :: 		LATE.B0 = 0;                          // BRAC command is immediately followed by WRR command
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,148 :: 		SPI1_Write(0xB9);                     // command byte
	MOVLW       185
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,150 :: 		LATE.B0 = 1;                          // BRAC + WRR sequence is illegal when device is performing embedded algorithm or when the program (P_ERR) or erase (E_ERR) status bits are set to 1
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,151 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_accessBR18:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_accessBR18
	DECFSZ      R12, 1, 1
	BRA         L_flash4_accessBR18
	NOP
;Click_Flash4_PIC.c,152 :: 		}
L_end_flash4_accessBR:
	RETURN      0
; end of _flash4_accessBR

_flash4_writeR:

;Click_Flash4_PIC.c,153 :: 		void flash4_writeR(unsigned char status, unsigned char config)                                // register write (WRR 01h)
;Click_Flash4_PIC.c,155 :: 		LATE.B0 = 0;                          // writes new values to Status Register-1 and Configuration Register
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,157 :: 		if(config == 0)                       // WRR time 560 - 2000 ms
	MOVF        FARG_flash4_writeR_config+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_writeR19
;Click_Flash4_PIC.c,159 :: 		SPI1_Write(0x01);                 // command byte
	MOVLW       1
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,160 :: 		SPI1_Write(status);               // status register 1 byte
	MOVF        FARG_flash4_writeR_status+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,161 :: 		}
	GOTO        L_flash4_writeR20
L_flash4_writeR19:
;Click_Flash4_PIC.c,162 :: 		else if(config > 0)
	MOVF        FARG_flash4_writeR_config+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_writeR21
;Click_Flash4_PIC.c,164 :: 		SPI1_Write(0x01);                 // command byte
	MOVLW       1
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,165 :: 		SPI1_Write(status);               // status register 1 byte
	MOVF        FARG_flash4_writeR_status+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,166 :: 		SPI1_Write(config);               // configuration register byte
	MOVF        FARG_flash4_writeR_config+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,167 :: 		}
L_flash4_writeR21:
L_flash4_writeR20:
;Click_Flash4_PIC.c,168 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,169 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeR22:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeR22
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeR22
	NOP
;Click_Flash4_PIC.c,170 :: 		}
L_end_flash4_writeR:
	RETURN      0
; end of _flash4_writeR

_flash4_writeEN:

;Click_Flash4_PIC.c,171 :: 		void flash4_writeEN()                                                                         // write enable (WREN 06h)
;Click_Flash4_PIC.c,173 :: 		LATE.B0 = 0;                          // sets the Write Enable Latch (WEL) bit of the Status Register 1 (SR1[1]) to 1
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,175 :: 		SPI1_Write(0x06);                     // command byte
	MOVLW       6
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,177 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,178 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeEN23:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeEN23
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeEN23
	NOP
;Click_Flash4_PIC.c,179 :: 		}
L_end_flash4_writeEN:
	RETURN      0
; end of _flash4_writeEN

_flash4_writeDI:

;Click_Flash4_PIC.c,180 :: 		void flash4_writeDI()                                                                         // write disable (WRDI 04h)
;Click_Flash4_PIC.c,182 :: 		LATE.B0 = 0;                          // sets the Write Enable Latch (WEL) bit of the Status Register 1 (SR1[1]) to 0
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,184 :: 		SPI1_Write(0x04);                     // command byte
	MOVLW       4
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,186 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,187 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeDI24:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeDI24
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeDI24
	NOP
;Click_Flash4_PIC.c,188 :: 		}
L_end_flash4_writeDI:
	RETURN      0
; end of _flash4_writeDI

_flash4_clearSR:

;Click_Flash4_PIC.c,189 :: 		void flash4_clearSR()                                                                         // clear status register (CLSR 30h)
;Click_Flash4_PIC.c,191 :: 		LATE.B0 = 0;                          // The Clear Status Register command resets bit SR1[5] (Erase Fail Flag) and bit SR1[6] (Program Fail Flag)
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,195 :: 		SPI1_Write(0x30);                     // command byte
	MOVLW       48
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,197 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,198 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_clearSR25:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_clearSR25
	DECFSZ      R12, 1, 1
	BRA         L_flash4_clearSR25
	NOP
;Click_Flash4_PIC.c,199 :: 		}
L_end_flash4_clearSR:
	RETURN      0
; end of _flash4_clearSR

_flash4_readECC:

;Click_Flash4_PIC.c,200 :: 		void flash4_readECC(unsigned short nDummy)                                                    // ECC Status Register Read (ECCRD 18h)
;Click_Flash4_PIC.c,202 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,204 :: 		SPI1_Write(0x18);                     // command byte
	MOVLW       24
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,205 :: 		SPI1_Write(0x00);                     // address byte MSB
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,206 :: 		SPI1_Write(0x00);                     // address byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,207 :: 		SPI1_Write(0x00);                     // address byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,208 :: 		SPI1_Write(0x00);                     // address byte LSB (last four LSbits of the address must be zero)
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,210 :: 		for(i = 0; i < nDummy; i ++)
	CLRF        _i+0 
L_flash4_readECC26:
	MOVF        FARG_flash4_readECC_nDummy+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readECC27
;Click_Flash4_PIC.c,212 :: 		SPI1_Write(0x00);                 // number of dummy cycles is selected by the read latency value in CR2V[3:0]
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,210 :: 		for(i = 0; i < nDummy; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,213 :: 		}
	GOTO        L_flash4_readECC26
L_flash4_readECC27:
;Click_Flash4_PIC.c,214 :: 		for(i = 0; i < 16; i ++)
	CLRF        _i+0 
L_flash4_readECC29:
	MOVLW       16
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readECC30
;Click_Flash4_PIC.c,216 :: 		flash4ECC[i] = SPI1_Read(0x00);
	MOVLW       _flash4ECC+0
	MOVWF       FLOC__flash4_readECC+0 
	MOVLW       hi_addr(_flash4ECC+0)
	MOVWF       FLOC__flash4_readECC+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readECC+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readECC+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readECC+0, FSR1
	MOVFF       FLOC__flash4_readECC+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,214 :: 		for(i = 0; i < 16; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,217 :: 		}
	GOTO        L_flash4_readECC29
L_flash4_readECC30:
;Click_Flash4_PIC.c,219 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,220 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readECC32:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readECC32
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readECC32
	NOP
;Click_Flash4_PIC.c,221 :: 		}
L_end_flash4_readECC:
	RETURN      0
; end of _flash4_readECC

_flash4_readAB:

;Click_Flash4_PIC.c,222 :: 		void flash4_readAB()                                                                          // AutoBoot Register Read (ABRD 14h)
;Click_Flash4_PIC.c,224 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,226 :: 		SPI1_Write(0x14);                     // command byte
	MOVLW       20
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,228 :: 		for(i = 0; i < 4; i ++)
	CLRF        _i+0 
L_flash4_readAB33:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readAB34
;Click_Flash4_PIC.c,230 :: 		flash4AB[i] = SPI1_Read(0x00);    // LSB first, MSbit of each Byte first
	MOVLW       _flash4AB+0
	MOVWF       FLOC__flash4_readAB+0 
	MOVLW       hi_addr(_flash4AB+0)
	MOVWF       FLOC__flash4_readAB+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readAB+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readAB+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readAB+0, FSR1
	MOVFF       FLOC__flash4_readAB+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,228 :: 		for(i = 0; i < 4; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,231 :: 		}
	GOTO        L_flash4_readAB33
L_flash4_readAB34:
;Click_Flash4_PIC.c,233 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,234 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readAB36:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readAB36
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readAB36
	NOP
;Click_Flash4_PIC.c,235 :: 		}
L_end_flash4_readAB:
	RETURN      0
; end of _flash4_readAB

_flash4_writeAB:

;Click_Flash4_PIC.c,236 :: 		void flash4_writeAB()                                                                         // AutoBoot Register Write (ABWR 15h)
;Click_Flash4_PIC.c,238 :: 		LATE.B0 = 0;                          // (WREN) command must be issued before the (ABWR) command
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,240 :: 		SPI1_Write(0x15);                     // Command byte
	MOVLW       21
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,242 :: 		for(i = 0; i < 4; i ++)
	CLRF        _i+0 
L_flash4_writeAB37:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_writeAB38
;Click_Flash4_PIC.c,244 :: 		flash4AB[i] = SPI1_Read(0x00);    // LSB first, MSbit of each Byte first
	MOVLW       _flash4AB+0
	MOVWF       FLOC__flash4_writeAB+0 
	MOVLW       hi_addr(_flash4AB+0)
	MOVWF       FLOC__flash4_writeAB+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_writeAB+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_writeAB+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_writeAB+0, FSR1
	MOVFF       FLOC__flash4_writeAB+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,242 :: 		for(i = 0; i < 4; i ++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,245 :: 		}
	GOTO        L_flash4_writeAB37
L_flash4_writeAB38:
;Click_Flash4_PIC.c,247 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,248 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeAB40:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeAB40
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeAB40
	NOP
;Click_Flash4_PIC.c,249 :: 		}
L_end_flash4_writeAB:
	RETURN      0
; end of _flash4_writeAB

_flash4_programNVDLR:

;Click_Flash4_PIC.c,250 :: 		void flash4_programNVDLR(unsigned char inData)                                                // Program NVDLR (PNVDLR 43h)
;Click_Flash4_PIC.c,252 :: 		LATE.B0 = 0;                          // (WREN) command must be issued before the (PNVDLR) command
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,254 :: 		SPI1_Write(0x43);                     // Command byte
	MOVLW       67
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,255 :: 		SPI1_Write(inData);
	MOVF        FARG_flash4_programNVDLR_inData+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,257 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,258 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_programNVDLR41:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_programNVDLR41
	DECFSZ      R12, 1, 1
	BRA         L_flash4_programNVDLR41
	NOP
;Click_Flash4_PIC.c,259 :: 		}
L_end_flash4_programNVDLR:
	RETURN      0
; end of _flash4_programNVDLR

_flash4_writeVDLR:

;Click_Flash4_PIC.c,260 :: 		void flash4_writeVDLR(unsigned char inData)                                                   // Write VDLR (WVDLR 4Ah)
;Click_Flash4_PIC.c,262 :: 		LATE.B0 = 0;                          // (WREN) command must be issued before the (WVDLR) command
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,264 :: 		SPI1_Write(0x4A);                     // Command byte
	MOVLW       74
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,265 :: 		SPI1_Write(inData);
	MOVF        FARG_flash4_writeVDLR_inData+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,267 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,268 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeVDLR42:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeVDLR42
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeVDLR42
	NOP
;Click_Flash4_PIC.c,269 :: 		}
L_end_flash4_writeVDLR:
	RETURN      0
; end of _flash4_writeVDLR

_flash4_readDLPRD:

;Click_Flash4_PIC.c,270 :: 		void flash4_readDLPRD()                                                                       // Data Learning Pattern Read (DLPRD 41h)
;Click_Flash4_PIC.c,272 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,274 :: 		SPI1_Write(0x41);                     // Command byte
	MOVLW       65
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,276 :: 		flash4DLPRD[0] = SPI1_Read(0x00);
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _flash4DLPRD+0 
;Click_Flash4_PIC.c,278 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,279 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readDLPRD43:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readDLPRD43
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readDLPRD43
	NOP
;Click_Flash4_PIC.c,280 :: 		}
L_end_flash4_readDLPRD:
	RETURN      0
; end of _flash4_readDLPRD

_flash4_readFlash:

;Click_Flash4_PIC.c,282 :: 		void flash4_readFlash(unsigned char addrType, unsigned long addr, unsigned short nData)       // Read 03h
;Click_Flash4_PIC.c,286 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_readFlash_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_readFlash_brake_L0+0 
;Click_Flash4_PIC.c,287 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_readFlash_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readFlash_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readFlash_brake_L0+1 
;Click_Flash4_PIC.c,288 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_readFlash_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readFlash_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_readFlash_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readFlash_brake_L0+2 
;Click_Flash4_PIC.c,289 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_readFlash_addr+0, 0 
	MOVWF       flash4_readFlash_brake_L0+3 
;Click_Flash4_PIC.c,291 :: 		if(addrType == 3)                         // (ExtAdd=0) is followed by a 3-byte address (A23-A0)
	MOVF        FARG_flash4_readFlash_addrType+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_readFlash44
;Click_Flash4_PIC.c,293 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,295 :: 		SPI1_Write(0x03);                     // Command byte
	MOVLW       3
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,296 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_readFlash45:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readFlash46
;Click_Flash4_PIC.c,298 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,296 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,299 :: 		}
	GOTO        L_flash4_readFlash45
L_flash4_readFlash46:
;Click_Flash4_PIC.c,300 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readFlash48:
	MOVF        FARG_flash4_readFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readFlash49
;Click_Flash4_PIC.c,302 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readFlash+0, FSR1
	MOVFF       FLOC__flash4_readFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,300 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,303 :: 		}
	GOTO        L_flash4_readFlash48
L_flash4_readFlash49:
;Click_Flash4_PIC.c,304 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,305 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readFlash51:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readFlash51
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readFlash51
	NOP
;Click_Flash4_PIC.c,306 :: 		}
	GOTO        L_flash4_readFlash52
L_flash4_readFlash44:
;Click_Flash4_PIC.c,307 :: 		else if(addrType == 4)                    // (ExtAdd=1) is followed by a 4-byte address (A31-A0)
	MOVF        FARG_flash4_readFlash_addrType+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_readFlash53
;Click_Flash4_PIC.c,309 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,311 :: 		SPI1_Write(0x03);                     // Command byte
	MOVLW       3
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,312 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_readFlash54:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readFlash55
;Click_Flash4_PIC.c,314 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,312 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,315 :: 		}
	GOTO        L_flash4_readFlash54
L_flash4_readFlash55:
;Click_Flash4_PIC.c,316 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readFlash57:
	MOVF        FARG_flash4_readFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readFlash58
;Click_Flash4_PIC.c,318 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readFlash+0, FSR1
	MOVFF       FLOC__flash4_readFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,316 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,319 :: 		}
	GOTO        L_flash4_readFlash57
L_flash4_readFlash58:
;Click_Flash4_PIC.c,320 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,321 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readFlash60:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readFlash60
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readFlash60
	NOP
;Click_Flash4_PIC.c,322 :: 		}
L_flash4_readFlash53:
L_flash4_readFlash52:
;Click_Flash4_PIC.c,323 :: 		}
L_end_flash4_readFlash:
	RETURN      0
; end of _flash4_readFlash

_flash4_4ReadFlash:

;Click_Flash4_PIC.c,324 :: 		void flash4_4ReadFlash(unsigned long addr, unsigned short nData)                              // 4Read 13h
;Click_Flash4_PIC.c,328 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_4ReadFlash_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_4ReadFlash_brake_L0+0 
;Click_Flash4_PIC.c,329 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_4ReadFlash_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4ReadFlash_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4ReadFlash_brake_L0+1 
;Click_Flash4_PIC.c,330 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_4ReadFlash_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4ReadFlash_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_4ReadFlash_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4ReadFlash_brake_L0+2 
;Click_Flash4_PIC.c,331 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_4ReadFlash_addr+0, 0 
	MOVWF       flash4_4ReadFlash_brake_L0+3 
;Click_Flash4_PIC.c,333 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,335 :: 		SPI1_Write(0x13);                     // Command byte
	MOVLW       19
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,336 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_4ReadFlash61:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4ReadFlash62
;Click_Flash4_PIC.c,338 :: 		SPI1_Write(brake[i]);
	MOVLW       flash4_4ReadFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_4ReadFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,336 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,339 :: 		}
	GOTO        L_flash4_4ReadFlash61
L_flash4_4ReadFlash62:
;Click_Flash4_PIC.c,340 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_4ReadFlash64:
	MOVF        FARG_flash4_4ReadFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4ReadFlash65
;Click_Flash4_PIC.c,342 :: 		readData[i] = SPI1_read(0x00);
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_4ReadFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_4ReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_4ReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_4ReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_4ReadFlash+0, FSR1
	MOVFF       FLOC__flash4_4ReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,340 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,343 :: 		}
	GOTO        L_flash4_4ReadFlash64
L_flash4_4ReadFlash65:
;Click_Flash4_PIC.c,344 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,345 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_4ReadFlash67:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_4ReadFlash67
	DECFSZ      R12, 1, 1
	BRA         L_flash4_4ReadFlash67
	NOP
;Click_Flash4_PIC.c,346 :: 		}
L_end_flash4_4ReadFlash:
	RETURN      0
; end of _flash4_4ReadFlash

_flash4_fastReadFlash:

;Click_Flash4_PIC.c,347 :: 		void flash4_fastReadFlash(unsigned long addr, unsigned short nData, unsigned short nDummy, unsigned short addrType)    // Read 0Bh
;Click_Flash4_PIC.c,351 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_fastReadFlash_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_fastReadFlash_brake_L0+0 
;Click_Flash4_PIC.c,352 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_fastReadFlash_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_fastReadFlash_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_fastReadFlash_brake_L0+1 
;Click_Flash4_PIC.c,353 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_fastReadFlash_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_fastReadFlash_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_fastReadFlash_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_fastReadFlash_brake_L0+2 
;Click_Flash4_PIC.c,354 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_fastReadFlash_addr+0, 0 
	MOVWF       flash4_fastReadFlash_brake_L0+3 
;Click_Flash4_PIC.c,356 :: 		if(addrType == 3)                          // 03h (ExtAdd=0) is followed by a 3-byte address (A23-A0)
	MOVF        FARG_flash4_fastReadFlash_addrType+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_fastReadFlash68
;Click_Flash4_PIC.c,358 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,360 :: 		SPI1_Write(0x03);                      // Command byte
	MOVLW       3
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,361 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_fastReadFlash69:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash70
;Click_Flash4_PIC.c,363 :: 		SPI1_Write(brake[i]);              // Address bytes
	MOVLW       flash4_fastReadFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_fastReadFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,361 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,364 :: 		}
	GOTO        L_flash4_fastReadFlash69
L_flash4_fastReadFlash70:
;Click_Flash4_PIC.c,365 :: 		for(i = 0; i < nDummy; i++)
	CLRF        _i+0 
L_flash4_fastReadFlash72:
	MOVF        FARG_flash4_fastReadFlash_nDummy+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash73
;Click_Flash4_PIC.c,367 :: 		dummyData[i] = SPI1_read(0x00);    // Up to 8 dummy cycles
	MOVLW       _dummyData+0
	MOVWF       FLOC__flash4_fastReadFlash+0 
	MOVLW       hi_addr(_dummyData+0)
	MOVWF       FLOC__flash4_fastReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_fastReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_fastReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_fastReadFlash+0, FSR1
	MOVFF       FLOC__flash4_fastReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,365 :: 		for(i = 0; i < nDummy; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,368 :: 		}
	GOTO        L_flash4_fastReadFlash72
L_flash4_fastReadFlash73:
;Click_Flash4_PIC.c,369 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_fastReadFlash75:
	MOVF        FARG_flash4_fastReadFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash76
;Click_Flash4_PIC.c,371 :: 		readData[i] = SPI1_read(0x00);     // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_fastReadFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_fastReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_fastReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_fastReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_fastReadFlash+0, FSR1
	MOVFF       FLOC__flash4_fastReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,369 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,372 :: 		}
	GOTO        L_flash4_fastReadFlash75
L_flash4_fastReadFlash76:
;Click_Flash4_PIC.c,373 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,374 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_fastReadFlash78:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_fastReadFlash78
	DECFSZ      R12, 1, 1
	BRA         L_flash4_fastReadFlash78
	NOP
;Click_Flash4_PIC.c,375 :: 		}
	GOTO        L_flash4_fastReadFlash79
L_flash4_fastReadFlash68:
;Click_Flash4_PIC.c,376 :: 		else if(addrType == 4)                     // 03h (ExtAdd=1) is followed by a 4-byte address (A31-A0)
	MOVF        FARG_flash4_fastReadFlash_addrType+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_fastReadFlash80
;Click_Flash4_PIC.c,378 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,380 :: 		SPI1_Write(0x03);                      // Command byte
	MOVLW       3
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,381 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_fastReadFlash81:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash82
;Click_Flash4_PIC.c,383 :: 		SPI1_Write(brake[i]);              // Address bytes
	MOVLW       flash4_fastReadFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_fastReadFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,381 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,384 :: 		}
	GOTO        L_flash4_fastReadFlash81
L_flash4_fastReadFlash82:
;Click_Flash4_PIC.c,385 :: 		for(i = 0; i < nDummy; i++)
	CLRF        _i+0 
L_flash4_fastReadFlash84:
	MOVF        FARG_flash4_fastReadFlash_nDummy+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash85
;Click_Flash4_PIC.c,387 :: 		dummyData[i] = SPI1_read(0x00);    // Up to 8 dummy cycles
	MOVLW       _dummyData+0
	MOVWF       FLOC__flash4_fastReadFlash+0 
	MOVLW       hi_addr(_dummyData+0)
	MOVWF       FLOC__flash4_fastReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_fastReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_fastReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_fastReadFlash+0, FSR1
	MOVFF       FLOC__flash4_fastReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,385 :: 		for(i = 0; i < nDummy; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,388 :: 		}
	GOTO        L_flash4_fastReadFlash84
L_flash4_fastReadFlash85:
;Click_Flash4_PIC.c,389 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_fastReadFlash87:
	MOVF        FARG_flash4_fastReadFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_fastReadFlash88
;Click_Flash4_PIC.c,391 :: 		readData[i] = SPI1_read(0x00);     // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_fastReadFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_fastReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_fastReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_fastReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_fastReadFlash+0, FSR1
	MOVFF       FLOC__flash4_fastReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,389 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,392 :: 		}
	GOTO        L_flash4_fastReadFlash87
L_flash4_fastReadFlash88:
;Click_Flash4_PIC.c,393 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,394 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_fastReadFlash90:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_fastReadFlash90
	DECFSZ      R12, 1, 1
	BRA         L_flash4_fastReadFlash90
	NOP
;Click_Flash4_PIC.c,395 :: 		}
L_flash4_fastReadFlash80:
L_flash4_fastReadFlash79:
;Click_Flash4_PIC.c,396 :: 		}
L_end_flash4_fastReadFlash:
	RETURN      0
; end of _flash4_fastReadFlash

_flash4_4FastReadFlash:

;Click_Flash4_PIC.c,397 :: 		void flash4_4FastReadFlash(unsigned long addr, unsigned short nData)                          // 4Read 0Ch
;Click_Flash4_PIC.c,401 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_4FastReadFlash_addr+0, 0 
	MOVWF       flash4_4FastReadFlash_brake_L0+3 
;Click_Flash4_PIC.c,402 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_4FastReadFlash_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4FastReadFlash_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_4FastReadFlash_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4FastReadFlash_brake_L0+2 
;Click_Flash4_PIC.c,403 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_4FastReadFlash_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4FastReadFlash_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4FastReadFlash_brake_L0+1 
;Click_Flash4_PIC.c,404 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_4FastReadFlash_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_4FastReadFlash_brake_L0+0 
;Click_Flash4_PIC.c,406 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,408 :: 		SPI1_Write(0x0C);                     // Command byte
	MOVLW       12
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,409 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_4FastReadFlash91:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4FastReadFlash92
;Click_Flash4_PIC.c,411 :: 		SPI1_Write(brake[i]);
	MOVLW       flash4_4FastReadFlash_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_4FastReadFlash_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,409 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,412 :: 		}
	GOTO        L_flash4_4FastReadFlash91
L_flash4_4FastReadFlash92:
;Click_Flash4_PIC.c,413 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_4FastReadFlash94:
	MOVF        FARG_flash4_4FastReadFlash_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4FastReadFlash95
;Click_Flash4_PIC.c,415 :: 		readData[i] = SPI1_read(0x00);
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_4FastReadFlash+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_4FastReadFlash+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_4FastReadFlash+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_4FastReadFlash+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_4FastReadFlash+0, FSR1
	MOVFF       FLOC__flash4_4FastReadFlash+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,413 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,416 :: 		}
	GOTO        L_flash4_4FastReadFlash94
L_flash4_4FastReadFlash95:
;Click_Flash4_PIC.c,417 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,418 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_4FastReadFlash97:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_4FastReadFlash97
	DECFSZ      R12, 1, 1
	BRA         L_flash4_4FastReadFlash97
	NOP
;Click_Flash4_PIC.c,419 :: 		}
L_end_flash4_4FastReadFlash:
	RETURN      0
; end of _flash4_4FastReadFlash

_flash4_pageProgram:

;Click_Flash4_PIC.c,421 :: 		void flash4_pageProgram(unsigned short addrType, unsigned long addr, unsigned short nData)    // Page Program (PP 02h)
;Click_Flash4_PIC.c,425 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_pageProgram_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_pageProgram_brake_L0+0 
;Click_Flash4_PIC.c,426 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_pageProgram_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_pageProgram_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_pageProgram_brake_L0+1 
;Click_Flash4_PIC.c,427 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_pageProgram_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_pageProgram_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_pageProgram_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_pageProgram_brake_L0+2 
;Click_Flash4_PIC.c,428 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_pageProgram_addr+0, 0 
	MOVWF       flash4_pageProgram_brake_L0+3 
;Click_Flash4_PIC.c,430 :: 		if(addrType == 3)                     // (ExtAdd=0) 3-byte address (A23-A0)
	MOVF        FARG_flash4_pageProgram_addrType+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_pageProgram98
;Click_Flash4_PIC.c,432 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,434 :: 		SPI1_Write(0x02);                 // Command byte
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,435 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_pageProgram99:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_pageProgram100
;Click_Flash4_PIC.c,437 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_pageProgram_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_pageProgram_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,435 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,438 :: 		}
	GOTO        L_flash4_pageProgram99
L_flash4_pageProgram100:
;Click_Flash4_PIC.c,439 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_pageProgram102:
	MOVF        FARG_flash4_pageProgram_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_pageProgram103
;Click_Flash4_PIC.c,441 :: 		SPI1_Write(dataBuffer[i]);    // Data to be programmed
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,439 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,442 :: 		}
	GOTO        L_flash4_pageProgram102
L_flash4_pageProgram103:
;Click_Flash4_PIC.c,443 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,444 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_pageProgram105:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_pageProgram105
	DECFSZ      R12, 1, 1
	BRA         L_flash4_pageProgram105
	NOP
;Click_Flash4_PIC.c,445 :: 		}
	GOTO        L_flash4_pageProgram106
L_flash4_pageProgram98:
;Click_Flash4_PIC.c,446 :: 		else if(addrType == 4)                // (ExtAdd=1) 4-byte address (A31-A0)
	MOVF        FARG_flash4_pageProgram_addrType+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_pageProgram107
;Click_Flash4_PIC.c,448 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,450 :: 		SPI1_Write(0x02);                 // Command byte
	MOVLW       2
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,451 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_pageProgram108:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_pageProgram109
;Click_Flash4_PIC.c,453 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_pageProgram_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_pageProgram_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,451 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,454 :: 		}
	GOTO        L_flash4_pageProgram108
L_flash4_pageProgram109:
;Click_Flash4_PIC.c,455 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_pageProgram111:
	MOVF        FARG_flash4_pageProgram_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_pageProgram112
;Click_Flash4_PIC.c,457 :: 		SPI1_Write(dataBuffer[i]);    // Data to be programmed
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,455 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,458 :: 		}
	GOTO        L_flash4_pageProgram111
L_flash4_pageProgram112:
;Click_Flash4_PIC.c,459 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,460 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_pageProgram114:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_pageProgram114
	DECFSZ      R12, 1, 1
	BRA         L_flash4_pageProgram114
	NOP
;Click_Flash4_PIC.c,461 :: 		}
L_flash4_pageProgram107:
L_flash4_pageProgram106:
;Click_Flash4_PIC.c,462 :: 		}
L_end_flash4_pageProgram:
	RETURN      0
; end of _flash4_pageProgram

_flash4_4PageProgram:

;Click_Flash4_PIC.c,463 :: 		void flash4_4PageProgram(unsigned long addr, unsigned short nData)                            // Page Program (4PP 12h)
;Click_Flash4_PIC.c,467 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_4PageProgram_addr+0, 0 
	MOVWF       flash4_4PageProgram_brake_L0+3 
;Click_Flash4_PIC.c,468 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_4PageProgram_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4PageProgram_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_4PageProgram_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4PageProgram_brake_L0+2 
;Click_Flash4_PIC.c,469 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_4PageProgram_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4PageProgram_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4PageProgram_brake_L0+1 
;Click_Flash4_PIC.c,470 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_4PageProgram_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_4PageProgram_brake_L0+0 
;Click_Flash4_PIC.c,472 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,474 :: 		SPI1_Write(0x12);                 // Command byte
	MOVLW       18
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,475 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_4PageProgram115:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4PageProgram116
;Click_Flash4_PIC.c,477 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_4PageProgram_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_4PageProgram_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,475 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,478 :: 		}
	GOTO        L_flash4_4PageProgram115
L_flash4_4PageProgram116:
;Click_Flash4_PIC.c,479 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_4PageProgram118:
	MOVF        FARG_flash4_4PageProgram_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4PageProgram119
;Click_Flash4_PIC.c,481 :: 		SPI1_Write(dataBuffer[i]);    // Data to be programmed
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,479 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,482 :: 		}
	GOTO        L_flash4_4PageProgram118
L_flash4_4PageProgram119:
;Click_Flash4_PIC.c,483 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,484 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_4PageProgram121:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_4PageProgram121
	DECFSZ      R12, 1, 1
	BRA         L_flash4_4PageProgram121
	NOP
;Click_Flash4_PIC.c,485 :: 		}
L_end_flash4_4PageProgram:
	RETURN      0
; end of _flash4_4PageProgram

_flash4_sectorErase:

;Click_Flash4_PIC.c,487 :: 		void flash4_sectorErase(unsigned short addrType, unsigned long addr, unsigned short nData)    // Sector Erase (SE D8h)
;Click_Flash4_PIC.c,491 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_sectorErase_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_sectorErase_brake_L0+0 
;Click_Flash4_PIC.c,492 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_sectorErase_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_sectorErase_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_sectorErase_brake_L0+1 
;Click_Flash4_PIC.c,493 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_sectorErase_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_sectorErase_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_sectorErase_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_sectorErase_brake_L0+2 
;Click_Flash4_PIC.c,494 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_sectorErase_addr+0, 0 
	MOVWF       flash4_sectorErase_brake_L0+3 
;Click_Flash4_PIC.c,496 :: 		if(addrType == 3)                     // (ExtAdd=0) 3-byte address (A23-A0)
	MOVF        FARG_flash4_sectorErase_addrType+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_sectorErase122
;Click_Flash4_PIC.c,498 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,500 :: 		SPI1_Write(0xD8);                 // Command byte
	MOVLW       216
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,501 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_sectorErase123:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_sectorErase124
;Click_Flash4_PIC.c,503 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_sectorErase_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_sectorErase_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,501 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,504 :: 		}
	GOTO        L_flash4_sectorErase123
L_flash4_sectorErase124:
;Click_Flash4_PIC.c,505 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,506 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_sectorErase126:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_sectorErase126
	DECFSZ      R12, 1, 1
	BRA         L_flash4_sectorErase126
	NOP
;Click_Flash4_PIC.c,507 :: 		}
	GOTO        L_flash4_sectorErase127
L_flash4_sectorErase122:
;Click_Flash4_PIC.c,508 :: 		else if(addrType == 4)                // (ExtAdd=1) 4-byte address (A31-A0)
	MOVF        FARG_flash4_sectorErase_addrType+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_flash4_sectorErase128
;Click_Flash4_PIC.c,510 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,512 :: 		SPI1_Write(0xD8);                 // Command byte
	MOVLW       216
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,513 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_sectorErase129:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_sectorErase130
;Click_Flash4_PIC.c,515 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_sectorErase_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_sectorErase_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,513 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,516 :: 		}
	GOTO        L_flash4_sectorErase129
L_flash4_sectorErase130:
;Click_Flash4_PIC.c,517 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,518 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_sectorErase132:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_sectorErase132
	DECFSZ      R12, 1, 1
	BRA         L_flash4_sectorErase132
	NOP
;Click_Flash4_PIC.c,519 :: 		}
L_flash4_sectorErase128:
L_flash4_sectorErase127:
;Click_Flash4_PIC.c,520 :: 		}
L_end_flash4_sectorErase:
	RETURN      0
; end of _flash4_sectorErase

_flash4_4sectorErase:

;Click_Flash4_PIC.c,521 :: 		void flash4_4sectorErase(unsigned short addrType, unsigned long addr, unsigned short nData)   // Sector Erase (4SE DCh)
;Click_Flash4_PIC.c,525 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_4sectorErase_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_4sectorErase_brake_L0+0 
;Click_Flash4_PIC.c,526 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_4sectorErase_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4sectorErase_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4sectorErase_brake_L0+1 
;Click_Flash4_PIC.c,527 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_4sectorErase_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_4sectorErase_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_4sectorErase_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_4sectorErase_brake_L0+2 
;Click_Flash4_PIC.c,528 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_4sectorErase_addr+0, 0 
	MOVWF       flash4_4sectorErase_brake_L0+3 
;Click_Flash4_PIC.c,530 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,532 :: 		SPI1_Write(0xDC);                 // Command byte
	MOVLW       220
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,533 :: 		for(i = 0; i < 4; i++)
	CLRF        _i+0 
L_flash4_4sectorErase133:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_4sectorErase134
;Click_Flash4_PIC.c,535 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_4sectorErase_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_4sectorErase_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,533 :: 		for(i = 0; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,536 :: 		}
	GOTO        L_flash4_4sectorErase133
L_flash4_4sectorErase134:
;Click_Flash4_PIC.c,537 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,538 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_4sectorErase136:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_4sectorErase136
	DECFSZ      R12, 1, 1
	BRA         L_flash4_4sectorErase136
	NOP
;Click_Flash4_PIC.c,540 :: 		}
L_end_flash4_4sectorErase:
	RETURN      0
; end of _flash4_4sectorErase

_flash4_bulkErase:

;Click_Flash4_PIC.c,541 :: 		void flash4_bulkErase()                                                                       // Bulk Erase (BE 60h or C7h)
;Click_Flash4_PIC.c,543 :: 		LATE.B0 = 0;                          // 103 - 460 sec
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,545 :: 		SPI1_Write(0xC7);                     // Command byte
	MOVLW       199
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,547 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,548 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_bulkErase137:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_bulkErase137
	DECFSZ      R12, 1, 1
	BRA         L_flash4_bulkErase137
	NOP
;Click_Flash4_PIC.c,549 :: 		}
L_end_flash4_bulkErase:
	RETURN      0
; end of _flash4_bulkErase

_flash4_eraseSuspend:

;Click_Flash4_PIC.c,550 :: 		void flash4_eraseSuspend()                                                                    // Erase suspend (ERSP 75h)
;Click_Flash4_PIC.c,552 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,554 :: 		SPI1_Write(0x75);                    // Command byte
	MOVLW       117
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,556 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,557 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_eraseSuspend138:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_eraseSuspend138
	DECFSZ      R12, 1, 1
	BRA         L_flash4_eraseSuspend138
	NOP
;Click_Flash4_PIC.c,558 :: 		}
L_end_flash4_eraseSuspend:
	RETURN      0
; end of _flash4_eraseSuspend

_flash4_eraseResume:

;Click_Flash4_PIC.c,559 :: 		void flash4_eraseResume()                                                                     // Erase resume (ERRS 7Ah)
;Click_Flash4_PIC.c,561 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,563 :: 		SPI1_Write(0x7A);                    // Command byte
	MOVLW       122
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,565 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,566 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_eraseResume139:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_eraseResume139
	DECFSZ      R12, 1, 1
	BRA         L_flash4_eraseResume139
	NOP
;Click_Flash4_PIC.c,567 :: 		}
L_end_flash4_eraseResume:
	RETURN      0
; end of _flash4_eraseResume

_flash4_programOTP:

;Click_Flash4_PIC.c,569 :: 		void flash4_programOTP(unsigned long addr, unsigned short nData)                              // OTP Program (OTPP 42h)
;Click_Flash4_PIC.c,573 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_programOTP_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_programOTP_brake_L0+0 
;Click_Flash4_PIC.c,574 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_programOTP_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_programOTP_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_programOTP_brake_L0+1 
;Click_Flash4_PIC.c,575 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_programOTP_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_programOTP_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_programOTP_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_programOTP_brake_L0+2 
;Click_Flash4_PIC.c,576 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_programOTP_addr+0, 0 
	MOVWF       flash4_programOTP_brake_L0+3 
;Click_Flash4_PIC.c,578 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,580 :: 		SPI1_Write(0x42);                 // Command byte
	MOVLW       66
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,581 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_programOTP140:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_programOTP141
;Click_Flash4_PIC.c,583 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_programOTP_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_programOTP_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,581 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,584 :: 		}
	GOTO        L_flash4_programOTP140
L_flash4_programOTP141:
;Click_Flash4_PIC.c,585 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_programOTP143:
	MOVF        FARG_flash4_programOTP_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_programOTP144
;Click_Flash4_PIC.c,587 :: 		SPI1_Write(dataBuffer[i]);    // Data to be programmed
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,585 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,588 :: 		}
	GOTO        L_flash4_programOTP143
L_flash4_programOTP144:
;Click_Flash4_PIC.c,589 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,590 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_programOTP146:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_programOTP146
	DECFSZ      R12, 1, 1
	BRA         L_flash4_programOTP146
	NOP
;Click_Flash4_PIC.c,591 :: 		}
L_end_flash4_programOTP:
	RETURN      0
; end of _flash4_programOTP

_flash4_readOTP:

;Click_Flash4_PIC.c,592 :: 		void flash4_readOTP(unsigned long addr, unsigned short nData)                                 // OTP Read (OTPR 4Bh)
;Click_Flash4_PIC.c,596 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_readOTP_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_readOTP_brake_L0+0 
;Click_Flash4_PIC.c,597 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_readOTP_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readOTP_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readOTP_brake_L0+1 
;Click_Flash4_PIC.c,598 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_readOTP_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readOTP_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_readOTP_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readOTP_brake_L0+2 
;Click_Flash4_PIC.c,599 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_readOTP_addr+0, 0 
	MOVWF       flash4_readOTP_brake_L0+3 
;Click_Flash4_PIC.c,601 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,603 :: 		SPI1_Write(0x4B);                     // Command byte
	MOVLW       75
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,604 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_readOTP147:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readOTP148
;Click_Flash4_PIC.c,606 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readOTP_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readOTP_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,604 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,607 :: 		}
	GOTO        L_flash4_readOTP147
L_flash4_readOTP148:
;Click_Flash4_PIC.c,608 :: 		SPI1_Write(0x00);                     // Dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,609 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readOTP150:
	MOVF        FARG_flash4_readOTP_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readOTP151
;Click_Flash4_PIC.c,611 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readOTP+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readOTP+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readOTP+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readOTP+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readOTP+0, FSR1
	MOVFF       FLOC__flash4_readOTP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,609 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,612 :: 		}
	GOTO        L_flash4_readOTP150
L_flash4_readOTP151:
;Click_Flash4_PIC.c,613 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,614 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readOTP153:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readOTP153
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readOTP153
	NOP
;Click_Flash4_PIC.c,615 :: 		}
L_end_flash4_readOTP:
	RETURN      0
; end of _flash4_readOTP

_flash4_programASP:

;Click_Flash4_PIC.c,617 :: 		void flash4_programASP()                                                                      // ASP Program (ASPP 2Fh)
;Click_Flash4_PIC.c,619 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,621 :: 		SPI1_Write(0x2F);                     // Command byte
	MOVLW       47
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,622 :: 		for(i = 0; i < 2; i++)
	CLRF        _i+0 
L_flash4_programASP154:
	MOVLW       2
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_programASP155
;Click_Flash4_PIC.c,624 :: 		SPI1_Write(dataBuffer[i]);        // Data to be programmed
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,622 :: 		for(i = 0; i < 2; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,625 :: 		}
	GOTO        L_flash4_programASP154
L_flash4_programASP155:
;Click_Flash4_PIC.c,626 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,627 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_programASP157:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_programASP157
	DECFSZ      R12, 1, 1
	BRA         L_flash4_programASP157
	NOP
;Click_Flash4_PIC.c,628 :: 		}
L_end_flash4_programASP:
	RETURN      0
; end of _flash4_programASP

_flash4_readASP:

;Click_Flash4_PIC.c,629 :: 		void flash4_readASP(unsigned short nData)                                                     // ASP Read (ASPRD 2Bh)
;Click_Flash4_PIC.c,631 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,633 :: 		SPI1_Write(0x2B);                     // Command byte
	MOVLW       43
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,634 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readASP158:
	MOVF        FARG_flash4_readASP_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readASP159
;Click_Flash4_PIC.c,636 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readASP+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readASP+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readASP+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readASP+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readASP+0, FSR1
	MOVFF       FLOC__flash4_readASP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,634 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,637 :: 		}
	GOTO        L_flash4_readASP158
L_flash4_readASP159:
;Click_Flash4_PIC.c,638 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,639 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readASP161:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readASP161
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readASP161
	NOP
;Click_Flash4_PIC.c,640 :: 		}
L_end_flash4_readASP:
	RETURN      0
; end of _flash4_readASP

_flash4_writeDYB:

;Click_Flash4_PIC.c,641 :: 		void flash4_writeDYB(unsigned long addr, unsigned short nData)                                // DYB Write (DYBWR E1h)
;Click_Flash4_PIC.c,645 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_writeDYB_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_writeDYB_brake_L0+0 
;Click_Flash4_PIC.c,646 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_writeDYB_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_writeDYB_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_writeDYB_brake_L0+1 
;Click_Flash4_PIC.c,647 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_writeDYB_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_writeDYB_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_writeDYB_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_writeDYB_brake_L0+2 
;Click_Flash4_PIC.c,648 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_writeDYB_addr+0, 0 
	MOVWF       flash4_writeDYB_brake_L0+3 
;Click_Flash4_PIC.c,650 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,652 :: 		SPI1_Write(0xE1);                 // Command byte
	MOVLW       225
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,653 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_writeDYB162:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_writeDYB163
;Click_Flash4_PIC.c,655 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_writeDYB_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_writeDYB_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,653 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,656 :: 		}
	GOTO        L_flash4_writeDYB162
L_flash4_writeDYB163:
;Click_Flash4_PIC.c,657 :: 		for(i = 0; i < 1; i++)
	CLRF        _i+0 
L_flash4_writeDYB165:
	MOVLW       1
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_writeDYB166
;Click_Flash4_PIC.c,659 :: 		SPI1_Write(dataBuffer[i]);    // Data to be written
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,657 :: 		for(i = 0; i < 1; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,660 :: 		}
	GOTO        L_flash4_writeDYB165
L_flash4_writeDYB166:
;Click_Flash4_PIC.c,661 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,662 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeDYB168:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeDYB168
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeDYB168
	NOP
;Click_Flash4_PIC.c,663 :: 		}
L_end_flash4_writeDYB:
	RETURN      0
; end of _flash4_writeDYB

_flash4_readDYB:

;Click_Flash4_PIC.c,664 :: 		void flash4_readDYB(unsigned long addr, unsigned short nData)                                 // DYB Read (DYBRD E0h)
;Click_Flash4_PIC.c,668 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_readDYB_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_readDYB_brake_L0+0 
;Click_Flash4_PIC.c,669 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_readDYB_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readDYB_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readDYB_brake_L0+1 
;Click_Flash4_PIC.c,670 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_readDYB_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readDYB_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_readDYB_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readDYB_brake_L0+2 
;Click_Flash4_PIC.c,671 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_readDYB_addr+0, 0 
	MOVWF       flash4_readDYB_brake_L0+3 
;Click_Flash4_PIC.c,673 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,675 :: 		SPI1_Write(0xE0);                     // Command byte
	MOVLW       224
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,676 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_readDYB169:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readDYB170
;Click_Flash4_PIC.c,678 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readDYB_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readDYB_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,676 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,679 :: 		}
	GOTO        L_flash4_readDYB169
L_flash4_readDYB170:
;Click_Flash4_PIC.c,680 :: 		SPI1_Write(0x00);                     // Dummy byte
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,681 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readDYB172:
	MOVF        FARG_flash4_readDYB_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readDYB173
;Click_Flash4_PIC.c,683 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readDYB+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readDYB+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readDYB+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readDYB+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readDYB+0, FSR1
	MOVFF       FLOC__flash4_readDYB+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,681 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,684 :: 		}
	GOTO        L_flash4_readDYB172
L_flash4_readDYB173:
;Click_Flash4_PIC.c,685 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,686 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readDYB175:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readDYB175
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readDYB175
	NOP
;Click_Flash4_PIC.c,687 :: 		}
L_end_flash4_readDYB:
	RETURN      0
; end of _flash4_readDYB

_flash4_ProgramPPB:

;Click_Flash4_PIC.c,688 :: 		void flash4_ProgramPPB(unsigned long addr, unsigned short nData)                              // PPB Program (PPBP E3h)
;Click_Flash4_PIC.c,692 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_ProgramPPB_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_ProgramPPB_brake_L0+0 
;Click_Flash4_PIC.c,693 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_ProgramPPB_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_ProgramPPB_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_ProgramPPB_brake_L0+1 
;Click_Flash4_PIC.c,694 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_ProgramPPB_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_ProgramPPB_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_ProgramPPB_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_ProgramPPB_brake_L0+2 
;Click_Flash4_PIC.c,695 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_ProgramPPB_addr+0, 0 
	MOVWF       flash4_ProgramPPB_brake_L0+3 
;Click_Flash4_PIC.c,697 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,699 :: 		SPI1_Write(0xE3);                 // Command byte
	MOVLW       227
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,700 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_ProgramPPB176:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_ProgramPPB177
;Click_Flash4_PIC.c,702 :: 		SPI1_Write(brake[i]);         // Address bytes
	MOVLW       flash4_ProgramPPB_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_ProgramPPB_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,700 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,703 :: 		}
	GOTO        L_flash4_ProgramPPB176
L_flash4_ProgramPPB177:
;Click_Flash4_PIC.c,704 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,705 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_ProgramPPB179:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_ProgramPPB179
	DECFSZ      R12, 1, 1
	BRA         L_flash4_ProgramPPB179
	NOP
;Click_Flash4_PIC.c,706 :: 		}
L_end_flash4_ProgramPPB:
	RETURN      0
; end of _flash4_ProgramPPB

_flash4_readPPB:

;Click_Flash4_PIC.c,707 :: 		void flash4_readPPB(unsigned long addr, unsigned short nData)                                 // PPB Read (PPBRD E2h)
;Click_Flash4_PIC.c,711 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_readPPB_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_readPPB_brake_L0+0 
;Click_Flash4_PIC.c,712 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_readPPB_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readPPB_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readPPB_brake_L0+1 
;Click_Flash4_PIC.c,713 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_readPPB_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readPPB_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_readPPB_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readPPB_brake_L0+2 
;Click_Flash4_PIC.c,714 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_readPPB_addr+0, 0 
	MOVWF       flash4_readPPB_brake_L0+3 
;Click_Flash4_PIC.c,716 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,718 :: 		SPI1_Write(0xE2);                     // Command byte
	MOVLW       226
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,719 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_readPPB180:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readPPB181
;Click_Flash4_PIC.c,721 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readPPB_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readPPB_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,719 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,722 :: 		}
	GOTO        L_flash4_readPPB180
L_flash4_readPPB181:
;Click_Flash4_PIC.c,723 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readPPB183:
	MOVF        FARG_flash4_readPPB_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readPPB184
;Click_Flash4_PIC.c,725 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readPPB+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readPPB+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readPPB+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readPPB+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readPPB+0, FSR1
	MOVFF       FLOC__flash4_readPPB+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,723 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,726 :: 		}
	GOTO        L_flash4_readPPB183
L_flash4_readPPB184:
;Click_Flash4_PIC.c,727 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,728 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readPPB186:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readPPB186
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readPPB186
	NOP
;Click_Flash4_PIC.c,729 :: 		}
L_end_flash4_readPPB:
	RETURN      0
; end of _flash4_readPPB

_flash4_erasePPB:

;Click_Flash4_PIC.c,730 :: 		void flash4_erasePPB()                                                                        // PPB Erase (PPBE E4h)
;Click_Flash4_PIC.c,732 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,734 :: 		SPI1_Write(0xE4);                     // Command byte
	MOVLW       228
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,736 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,737 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_erasePPB187:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_erasePPB187
	DECFSZ      R12, 1, 1
	BRA         L_flash4_erasePPB187
	NOP
;Click_Flash4_PIC.c,738 :: 		}
L_end_flash4_erasePPB:
	RETURN      0
; end of _flash4_erasePPB

_flash4_readLockBit:

;Click_Flash4_PIC.c,739 :: 		void flash4_readLockBit(unsigned long addr, unsigned short nData)                             // PPB Lock Bit Read (PLBRD A7h)
;Click_Flash4_PIC.c,743 :: 		brake[0] = (unsigned short)(addr>>24 & 0xFFul);
	MOVF        FARG_flash4_readLockBit_addr+3, 0 
	MOVWF       R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       flash4_readLockBit_brake_L0+0 
;Click_Flash4_PIC.c,744 :: 		brake[1] = (unsigned short)(addr>>16 & 0xFFul);
	MOVF        FARG_flash4_readLockBit_addr+2, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readLockBit_addr+3, 0 
	MOVWF       R1 
	CLRF        R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readLockBit_brake_L0+1 
;Click_Flash4_PIC.c,745 :: 		brake[2] = (unsigned short)(addr>>8 & 0xFFul);
	MOVF        FARG_flash4_readLockBit_addr+1, 0 
	MOVWF       R0 
	MOVF        FARG_flash4_readLockBit_addr+2, 0 
	MOVWF       R1 
	MOVF        FARG_flash4_readLockBit_addr+3, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVLW       255
	ANDWF       R0, 0 
	MOVWF       flash4_readLockBit_brake_L0+2 
;Click_Flash4_PIC.c,746 :: 		brake[3] = (unsigned short)(addr & 0xFFul);
	MOVLW       255
	ANDWF       FARG_flash4_readLockBit_addr+0, 0 
	MOVWF       flash4_readLockBit_brake_L0+3 
;Click_Flash4_PIC.c,748 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,750 :: 		SPI1_Write(0xA7);                     // Command byte
	MOVLW       167
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,751 :: 		for(i = 1; i < 4; i++)
	MOVLW       1
	MOVWF       _i+0 
L_flash4_readLockBit188:
	MOVLW       4
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readLockBit189
;Click_Flash4_PIC.c,753 :: 		SPI1_Write(brake[i]);             // Address bytes
	MOVLW       flash4_readLockBit_brake_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(flash4_readLockBit_brake_L0+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,751 :: 		for(i = 1; i < 4; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,754 :: 		}
	GOTO        L_flash4_readLockBit188
L_flash4_readLockBit189:
;Click_Flash4_PIC.c,755 :: 		for(i = 0; i < nData; i++)
	CLRF        _i+0 
L_flash4_readLockBit191:
	MOVF        FARG_flash4_readLockBit_nData+0, 0 
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readLockBit192
;Click_Flash4_PIC.c,757 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readLockBit+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readLockBit+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readLockBit+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readLockBit+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readLockBit+0, FSR1
	MOVFF       FLOC__flash4_readLockBit+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,755 :: 		for(i = 0; i < nData; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,758 :: 		}
	GOTO        L_flash4_readLockBit191
L_flash4_readLockBit192:
;Click_Flash4_PIC.c,759 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,760 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readLockBit194:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readLockBit194
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readLockBit194
	NOP
;Click_Flash4_PIC.c,761 :: 		}
L_end_flash4_readLockBit:
	RETURN      0
; end of _flash4_readLockBit

_flash4_writeLockBit:

;Click_Flash4_PIC.c,762 :: 		void flash4_writeLockBit()                                                                    // PPB Lock Bit Write (PLBWR A6h)
;Click_Flash4_PIC.c,764 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,766 :: 		SPI1_Write(0xA6);                     // Command byte
	MOVLW       166
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,768 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,769 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_writeLockBit195:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_writeLockBit195
	DECFSZ      R12, 1, 1
	BRA         L_flash4_writeLockBit195
	NOP
;Click_Flash4_PIC.c,770 :: 		}
L_end_flash4_writeLockBit:
	RETURN      0
; end of _flash4_writeLockBit

_flash4_programPASS:

;Click_Flash4_PIC.c,771 :: 		void flash4_programPASS()                                                                     // Password Program (PASSP E8h)
;Click_Flash4_PIC.c,773 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,775 :: 		SPI1_Write(0xE8);                      // Command byte
	MOVLW       232
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,776 :: 		for(i = 0; i < 8; i++)
	CLRF        _i+0 
L_flash4_programPASS196:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_programPASS197
;Click_Flash4_PIC.c,778 :: 		SPI1_Write(dataBuffer[i]);         // Password bytes (LSB firts)
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,776 :: 		for(i = 0; i < 8; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,779 :: 		}
	GOTO        L_flash4_programPASS196
L_flash4_programPASS197:
;Click_Flash4_PIC.c,780 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,781 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_programPASS199:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_programPASS199
	DECFSZ      R12, 1, 1
	BRA         L_flash4_programPASS199
	NOP
;Click_Flash4_PIC.c,782 :: 		}
L_end_flash4_programPASS:
	RETURN      0
; end of _flash4_programPASS

_flash4_readPASS:

;Click_Flash4_PIC.c,783 :: 		void flash4_readPASS()                                                                        // Password Read (PASSRD E7h)
;Click_Flash4_PIC.c,785 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,787 :: 		SPI1_Write(0xE7);                     // Command byte
	MOVLW       231
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,788 :: 		for(i = 0; i < 8; i++)
	CLRF        _i+0 
L_flash4_readPASS200:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_readPASS201
;Click_Flash4_PIC.c,790 :: 		readData[i] = SPI1_read(0x00);    // Data to be read
	MOVLW       _readData+0
	MOVWF       FLOC__flash4_readPASS+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FLOC__flash4_readPASS+1 
	MOVF        _i+0, 0 
	ADDWF       FLOC__flash4_readPASS+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FLOC__flash4_readPASS+1, 1 
	CLRF        FARG_SPI1_Read_buffer+0 
	CALL        _SPI1_Read+0, 0
	MOVFF       FLOC__flash4_readPASS+0, FSR1
	MOVFF       FLOC__flash4_readPASS+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Click_Flash4_PIC.c,788 :: 		for(i = 0; i < 8; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,791 :: 		}
	GOTO        L_flash4_readPASS200
L_flash4_readPASS201:
;Click_Flash4_PIC.c,792 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,793 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_readPASS203:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_readPASS203
	DECFSZ      R12, 1, 1
	BRA         L_flash4_readPASS203
	NOP
;Click_Flash4_PIC.c,794 :: 		}
L_end_flash4_readPASS:
	RETURN      0
; end of _flash4_readPASS

_flash4_unlockPASS:

;Click_Flash4_PIC.c,795 :: 		void flash4_unlockPASS()                                                                      // Password Unlock (PASSU E9h)
;Click_Flash4_PIC.c,797 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,799 :: 		SPI1_Write(0xE9);                      // Command byte
	MOVLW       233
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,800 :: 		for(i = 0; i < 8; i++)
	CLRF        _i+0 
L_flash4_unlockPASS204:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_flash4_unlockPASS205
;Click_Flash4_PIC.c,802 :: 		SPI1_Write(dataBuffer[i]);         // Password bytes (LSB firts)
	MOVLW       _dataBuffer+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FSR0H 
	MOVF        _i+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,800 :: 		for(i = 0; i < 8; i++)
	INCF        _i+0, 1 
;Click_Flash4_PIC.c,803 :: 		}
	GOTO        L_flash4_unlockPASS204
L_flash4_unlockPASS205:
;Click_Flash4_PIC.c,804 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,805 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_unlockPASS207:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_unlockPASS207
	DECFSZ      R12, 1, 1
	BRA         L_flash4_unlockPASS207
	NOP
;Click_Flash4_PIC.c,806 :: 		}
L_end_flash4_unlockPASS:
	RETURN      0
; end of _flash4_unlockPASS

_flash4_softReset:

;Click_Flash4_PIC.c,808 :: 		void flash4_softReset()                                                                       // Software Reset (RESET F0h)
;Click_Flash4_PIC.c,810 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,812 :: 		SPI1_Write(0xF0);                  // Command byte
	MOVLW       240
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,814 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,815 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_softReset208:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_softReset208
	DECFSZ      R12, 1, 1
	BRA         L_flash4_softReset208
	NOP
;Click_Flash4_PIC.c,816 :: 		}
L_end_flash4_softReset:
	RETURN      0
; end of _flash4_softReset

_flash4_modeReset:

;Click_Flash4_PIC.c,817 :: 		void flash4_modeReset()                                                                       // Mode Bit Reset (MBR FFh)
;Click_Flash4_PIC.c,819 :: 		LATE.B0 = 0;
	BCF         LATE+0, 0 
;Click_Flash4_PIC.c,821 :: 		SPI1_Write(0xFF);                  // Command byte
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;Click_Flash4_PIC.c,823 :: 		LATE.B0 = 1;
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,824 :: 		delay_ms(1);
	MOVLW       21
	MOVWF       R12, 0
	MOVLW       198
	MOVWF       R13, 0
L_flash4_modeReset209:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_modeReset209
	DECFSZ      R12, 1, 1
	BRA         L_flash4_modeReset209
	NOP
;Click_Flash4_PIC.c,825 :: 		}
L_end_flash4_modeReset:
	RETURN      0
; end of _flash4_modeReset

_flash4_checkWIP:

;Click_Flash4_PIC.c,827 :: 		unsigned short flash4_checkWIP()
;Click_Flash4_PIC.c,829 :: 		flash4_readSR1();
	CALL        _flash4_readSR1+0, 0
;Click_Flash4_PIC.c,830 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_flash4_checkWIP210:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_checkWIP210
	DECFSZ      R12, 1, 1
	BRA         L_flash4_checkWIP210
	NOP
	NOP
;Click_Flash4_PIC.c,831 :: 		if(flash4SR1[0] & 0x01)
	BTFSS       _flash4SR1+0, 0 
	GOTO        L_flash4_checkWIP211
;Click_Flash4_PIC.c,833 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_flash4_checkWIP
;Click_Flash4_PIC.c,834 :: 		}
L_flash4_checkWIP211:
;Click_Flash4_PIC.c,835 :: 		else if (!(flash4SR1[0] & 0x01))
	BTFSC       _flash4SR1+0, 0 
	GOTO        L_flash4_checkWIP213
;Click_Flash4_PIC.c,837 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_flash4_checkWIP
;Click_Flash4_PIC.c,838 :: 		}
L_flash4_checkWIP213:
;Click_Flash4_PIC.c,839 :: 		}
L_end_flash4_checkWIP:
	RETURN      0
; end of _flash4_checkWIP

_flash4_checkWEL:

;Click_Flash4_PIC.c,840 :: 		unsigned short flash4_checkWEL()
;Click_Flash4_PIC.c,842 :: 		flash4_readSR1();
	CALL        _flash4_readSR1+0, 0
;Click_Flash4_PIC.c,843 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_flash4_checkWEL214:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_checkWEL214
	DECFSZ      R12, 1, 1
	BRA         L_flash4_checkWEL214
	NOP
	NOP
;Click_Flash4_PIC.c,844 :: 		if(flash4SR1[0] & 0x02)
	BTFSS       _flash4SR1+0, 1 
	GOTO        L_flash4_checkWEL215
;Click_Flash4_PIC.c,846 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_flash4_checkWEL
;Click_Flash4_PIC.c,847 :: 		}
L_flash4_checkWEL215:
;Click_Flash4_PIC.c,848 :: 		else if (!(flash4SR1[0] & 0x02))
	BTFSC       _flash4SR1+0, 1 
	GOTO        L_flash4_checkWEL217
;Click_Flash4_PIC.c,850 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_flash4_checkWEL
;Click_Flash4_PIC.c,851 :: 		}
L_flash4_checkWEL217:
;Click_Flash4_PIC.c,852 :: 		}
L_end_flash4_checkWEL:
	RETURN      0
; end of _flash4_checkWEL

_flash4_checkPS:

;Click_Flash4_PIC.c,853 :: 		unsigned short flash4_checkPS()
;Click_Flash4_PIC.c,855 :: 		flash4_readSR2();
	CALL        _flash4_readSR2+0, 0
;Click_Flash4_PIC.c,856 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_flash4_checkPS218:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_checkPS218
	DECFSZ      R12, 1, 1
	BRA         L_flash4_checkPS218
	NOP
	NOP
;Click_Flash4_PIC.c,857 :: 		if(flash4SR2[0] & 0x01)
	BTFSS       _flash4SR2+0, 0 
	GOTO        L_flash4_checkPS219
;Click_Flash4_PIC.c,859 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_flash4_checkPS
;Click_Flash4_PIC.c,860 :: 		}
L_flash4_checkPS219:
;Click_Flash4_PIC.c,861 :: 		else if (!(flash4SR2[0] & 0x01))
	BTFSC       _flash4SR2+0, 0 
	GOTO        L_flash4_checkPS221
;Click_Flash4_PIC.c,863 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_flash4_checkPS
;Click_Flash4_PIC.c,864 :: 		}
L_flash4_checkPS221:
;Click_Flash4_PIC.c,865 :: 		}
L_end_flash4_checkPS:
	RETURN      0
; end of _flash4_checkPS

_flash4_checkES:

;Click_Flash4_PIC.c,866 :: 		unsigned short flash4_checkES()
;Click_Flash4_PIC.c,868 :: 		flash4_readSR2();
	CALL        _flash4_readSR2+0, 0
;Click_Flash4_PIC.c,869 :: 		delay_ms(10);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_flash4_checkES222:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_checkES222
	DECFSZ      R12, 1, 1
	BRA         L_flash4_checkES222
	NOP
	NOP
;Click_Flash4_PIC.c,870 :: 		if(flash4SR2[0] & 0x02)
	BTFSS       _flash4SR2+0, 1 
	GOTO        L_flash4_checkES223
;Click_Flash4_PIC.c,872 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_flash4_checkES
;Click_Flash4_PIC.c,873 :: 		}
L_flash4_checkES223:
;Click_Flash4_PIC.c,874 :: 		else if (!(flash4SR2[0] & 0x02))
	BTFSC       _flash4SR2+0, 1 
	GOTO        L_flash4_checkES225
;Click_Flash4_PIC.c,876 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_flash4_checkES
;Click_Flash4_PIC.c,877 :: 		}
L_flash4_checkES225:
;Click_Flash4_PIC.c,878 :: 		}
L_end_flash4_checkES:
	RETURN      0
; end of _flash4_checkES

_flash4_Init:

;Click_Flash4_PIC.c,880 :: 		void flash4_Init()
;Click_Flash4_PIC.c,882 :: 		LATC.B0 = 0;              // reset
	BCF         LATC+0, 0 
;Click_Flash4_PIC.c,883 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_flash4_Init226:
	DECFSZ      R13, 1, 1
	BRA         L_flash4_Init226
	DECFSZ      R12, 1, 1
	BRA         L_flash4_Init226
	DECFSZ      R11, 1, 1
	BRA         L_flash4_Init226
	NOP
;Click_Flash4_PIC.c,884 :: 		LATC.B0 = 1;
	BSF         LATC+0, 0 
;Click_Flash4_PIC.c,886 :: 		LATE.B0 = 1;              // WP inactive
	BSF         LATE+0, 0 
;Click_Flash4_PIC.c,888 :: 		UART1_Write_Text(" ... Flash 4 click initialization done ... ");
	MOVLW       ?lstr1_Click_Flash4_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_Click_Flash4_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Click_Flash4_PIC.c,889 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,890 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,891 :: 		}
L_end_flash4_Init:
	RETURN      0
; end of _flash4_Init

_systemInit:

;Click_Flash4_PIC.c,892 :: 		void systemInit()
;Click_Flash4_PIC.c,894 :: 		ANCON0 = 0x00;
	CLRF        ANCON0+0 
;Click_Flash4_PIC.c,895 :: 		ANCON1 = 0x00;
	CLRF        ANCON1+0 
;Click_Flash4_PIC.c,896 :: 		ANCON2 = 0x00;
	CLRF        ANCON2+0 
;Click_Flash4_PIC.c,898 :: 		TRISB.B1 = 0;             // HOLD
	BCF         TRISB+0, 1 
;Click_Flash4_PIC.c,899 :: 		TRISC.B0 = 0;             // RST
	BCF         TRISC+0, 0 
;Click_Flash4_PIC.c,900 :: 		TRISC.B2 = 0;             // WP
	BCF         TRISC+0, 2 
;Click_Flash4_PIC.c,901 :: 		TRISE.B0 = 0;             // CS
	BCF         TRISE+0, 0 
;Click_Flash4_PIC.c,903 :: 		LATC.B0 = 1;
	BSF         LATC+0, 0 
;Click_Flash4_PIC.c,905 :: 		UART1_Init(9600);
	MOVLW       103
	MOVWF       SPBRG+0 
	BCF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Click_Flash4_PIC.c,906 :: 		Delay_ms(1000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_systemInit227:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit227
	DECFSZ      R12, 1, 1
	BRA         L_systemInit227
	DECFSZ      R11, 1, 1
	BRA         L_systemInit227
	NOP
;Click_Flash4_PIC.c,907 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;Click_Flash4_PIC.c,908 :: 		Delay_ms(2000);
	MOVLW       163
	MOVWF       R11, 0
	MOVLW       87
	MOVWF       R12, 0
	MOVLW       2
	MOVWF       R13, 0
L_systemInit228:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit228
	DECFSZ      R12, 1, 1
	BRA         L_systemInit228
	DECFSZ      R11, 1, 1
	BRA         L_systemInit228
	NOP
;Click_Flash4_PIC.c,909 :: 		UART1_Write_Text(" ... System initialization done ... ");
	MOVLW       ?lstr2_Click_Flash4_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_Click_Flash4_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Click_Flash4_PIC.c,910 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,911 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,912 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_dataInit:

;Click_Flash4_PIC.c,913 :: 		void dataInit()
;Click_Flash4_PIC.c,935 :: 		}
L_end_dataInit:
	RETURN      0
; end of _dataInit

_main:

;Click_Flash4_PIC.c,937 :: 		void main()
;Click_Flash4_PIC.c,939 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_Flash4_PIC.c,940 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main229:
	DECFSZ      R13, 1, 1
	BRA         L_main229
	DECFSZ      R12, 1, 1
	BRA         L_main229
	DECFSZ      R11, 1, 1
	BRA         L_main229
	NOP
;Click_Flash4_PIC.c,941 :: 		flash4_Init();
	CALL        _flash4_Init+0, 0
;Click_Flash4_PIC.c,942 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main230:
	DECFSZ      R13, 1, 1
	BRA         L_main230
	DECFSZ      R12, 1, 1
	BRA         L_main230
	DECFSZ      R11, 1, 1
	BRA         L_main230
	NOP
;Click_Flash4_PIC.c,943 :: 		dataInit();
	CALL        _dataInit+0, 0
;Click_Flash4_PIC.c,944 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main231:
	DECFSZ      R13, 1, 1
	BRA         L_main231
	DECFSZ      R12, 1, 1
	BRA         L_main231
	DECFSZ      R11, 1, 1
	BRA         L_main231
	NOP
;Click_Flash4_PIC.c,945 :: 		UART1_Write_Text(dataBuffer);
	MOVLW       _dataBuffer+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Click_Flash4_PIC.c,946 :: 		delay_ms(50);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main232:
	DECFSZ      R13, 1, 1
	BRA         L_main232
	DECFSZ      R12, 1, 1
	BRA         L_main232
	DECFSZ      R11, 1, 1
	BRA         L_main232
;Click_Flash4_PIC.c,947 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,948 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,964 :: 		flash4_writeEN();
	CALL        _flash4_writeEN+0, 0
;Click_Flash4_PIC.c,965 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main233:
	DECFSZ      R13, 1, 1
	BRA         L_main233
	DECFSZ      R12, 1, 1
	BRA         L_main233
	DECFSZ      R11, 1, 1
	BRA         L_main233
	NOP
;Click_Flash4_PIC.c,966 :: 		flash4_4PageProgram(0x00010000, 17);
	MOVLW       0
	MOVWF       FARG_flash4_4PageProgram_addr+0 
	MOVLW       0
	MOVWF       FARG_flash4_4PageProgram_addr+1 
	MOVLW       1
	MOVWF       FARG_flash4_4PageProgram_addr+2 
	MOVLW       0
	MOVWF       FARG_flash4_4PageProgram_addr+3 
	MOVLW       17
	MOVWF       FARG_flash4_4PageProgram_nData+0 
	CALL        _flash4_4PageProgram+0, 0
;Click_Flash4_PIC.c,967 :: 		while(flash4_checkWIP());
L_main234:
	CALL        _flash4_checkWIP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main235
	GOTO        L_main234
L_main235:
;Click_Flash4_PIC.c,968 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main236:
	DECFSZ      R13, 1, 1
	BRA         L_main236
	DECFSZ      R12, 1, 1
	BRA         L_main236
	DECFSZ      R11, 1, 1
	BRA         L_main236
	NOP
;Click_Flash4_PIC.c,969 :: 		flash4_4ReadFlash(0x00010000, 17);
	MOVLW       0
	MOVWF       FARG_flash4_4ReadFlash_addr+0 
	MOVLW       0
	MOVWF       FARG_flash4_4ReadFlash_addr+1 
	MOVLW       1
	MOVWF       FARG_flash4_4ReadFlash_addr+2 
	MOVLW       0
	MOVWF       FARG_flash4_4ReadFlash_addr+3 
	MOVLW       17
	MOVWF       FARG_flash4_4ReadFlash_nData+0 
	CALL        _flash4_4ReadFlash+0, 0
;Click_Flash4_PIC.c,970 :: 		while(flash4_checkWIP());
L_main237:
	CALL        _flash4_checkWIP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main238
	GOTO        L_main237
L_main238:
;Click_Flash4_PIC.c,971 :: 		delay_ms(100);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main239:
	DECFSZ      R13, 1, 1
	BRA         L_main239
	DECFSZ      R12, 1, 1
	BRA         L_main239
	DECFSZ      R11, 1, 1
	BRA         L_main239
	NOP
;Click_Flash4_PIC.c,972 :: 		UART1_Write_Text(readData);
	MOVLW       _readData+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_readData+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;Click_Flash4_PIC.c,973 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,974 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Click_Flash4_PIC.c,975 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
