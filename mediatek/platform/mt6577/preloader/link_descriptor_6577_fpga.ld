OUTPUT_ARCH(arm)

ENTRY(_start)

baseaddr = 0x01C10000;

SECTIONS {
    
    . = baseaddr;
    .start ALIGN(4) : {	
        *(.text.start)
    }
    
    . = baseaddr + 0x01FC;
    .rom_info ALIGN(4) : {	    	    	    	     
    	*(.data.rom_info)
    }     

    .text ALIGN(4) : {
        *(.text)
    }


    .rodata ALIGN(4) : {
        *(.rodata)
    }

    .data ALIGN(4) : {
        *(.data)
    }


    .got ALIGN(4) : {
        *(.got)
    }

    __boot_end = .;


    . = 0xF0008400;
    .bss ALIGN(16) : {
        _bss_start = .;
        *(.bss)
        *(.bss.*)
        *(COMMON)
        _bss_end = .;
    }


    .comment ALIGN(16) : {
        *(.comment)
    }

}
