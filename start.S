.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global _hard_reset

.type vtable, object
.type _hard_reset, function

vtable:
    .word _stack_start     /* Вказівник стеку */
    .word _hard_reset + 1  /* Адреса першої команди (+1 для Thumb mode) */
.size vtable, . - vtable

_hard_reset:
    bl lab1                /* Перехід до функції */
_loop: 
    b _loop                /* Зациклюємо, щоб програма не "втекла" в пусту пам'ять */
