.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
  horas_trabajadas dd ?
  pago_por_hora    dd ?
  salario_total    dd ?

  formato_entrada  db "%d", 0
  formato_salida   db 0Ah, "Salario Total: %d", 0Ah, 0

  msg_horas        db 0Ah, "Ingrese la cantidad de horas trabajadas: ", 0
  msg_pago         db 0Ah, "Ingrese el valor del pago por hora: ", 0

.code
start:
    ; --- Ingresar horas trabajadas ---
    push offset msg_horas
    call crt_printf
    add esp, 4

    push offset horas_trabajadas
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Ingresar pago por hora ---
    push offset msg_pago
    call crt_printf
    add esp, 4

    push offset pago_por_hora
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Calcular salario total: horas * pago ---
    mov eax, horas_trabajadas
    imul eax, pago_por_hora
    mov salario_total, eax

    ; --- Mostrar resultado ---
    push salario_total
    push offset formato_salida
    call crt_printf
    add esp, 8

    call crt_getchar
    ret
end start