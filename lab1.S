.global lab1
.syntax unified

/* Вхідні значення */
#define A #6
#define B #5

lab1:
    push {lr}              /* Зберігаємо адресу повернення */
    
    mov r0, A              
    mov r1, B              
    
    add r2, r0, r1         /* r2 = a + b */
    cmp r2, #10            /* Порівнюємо суму з 10 */
    
    /* Блок ITE (If-Then-Else) для реалізації умови */
    ITE GE                 /* Якщо >= 10 */
    andge r3, r0, r1       /* r3 = a AND b */
    orrlt r3, r0, r1       /* Інакше: r3 = a OR b */
    
    ITE GE                 /* Другий блок для зсувів */
    lslge r3, r3, #2       /* Якщо >= 10: зсув вліво на 2 */
    lsrlt r3, r3, #1       /* Інакше: зсув вправо на 1 */
    
    pop {pc}               /* Повернення до start.S */
