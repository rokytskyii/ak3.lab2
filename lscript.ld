MEMORY
{
    /* Flash пам'ять починається з 0x08000000 (1MB) */
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1M
    /* RAM починається з 0x20000000 (128KB) */
    RAM (rxw)  : ORIGIN = 0x20000000, LENGTH = 128K
}

/* Стек починається з кінця оперативної пам'яті */
_stack_start = ORIGIN(RAM) + LENGTH(RAM);
