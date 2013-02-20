STACK_SIZE = 1k;

ENTRY(Reset_Handler)

MEMORY {
	/* LM3S811EVB */
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 64k
	SRAM (rwx) : ORIGIN = 0x20000000, LENGTH =  8k
	/* STM32F100RBT STM32VLDISCOVERY */
	/*
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 128k
	SRAM (rwx) : ORIGIN = 0x20000000, LENGTH =  8k
	*/
}

SECTIONS {

.text : { *(.vectors) *(.text) *(.rodata) } > FLASH
	
.data : {
	sec_data_b = .;
	sec_data_f = LOADADDR(.data);
	*(.data) 
	sec_data_e = .;
	} > SRAM AT> FLASH

.bss  : { *(.bss) } > SRAM
	
.stack : { 
	*(.stack) 
	. += STACK_SIZE;
	sec_stack_end = .;
	} > SRAM
}