.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
  sueldo_basico   dd ?
  primas          dd ?
  deducciones     dd ?
  resultado       dd ?

  formato_entrada     db "%d", 0
  formato_salida      db "Sueldo Neto: %d", 0Ah, 0

  msg_sueldo_basico   db 0Ah, "Ingrese el sueldo basico: ", 0
  msg_primas          db 0Ah, "Ingrese el valor de las primas: ", 0
  msg_deducciones     db 0Ah, "Ingrese el valor de las deducciones: ", 0

.code
start:
    ; --- Ingresar sueldo básico ---
    push offset msg_sueldo_basico
    call crt_printf
    add esp, 4

    push offset sueldo_basico
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Ingresar primas ---
    push offset msg_primas
    call crt_printf
    add esp, 4

    push offset primas
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Ingresar deducciones ---
    push offset msg_deducciones
    call crt_printf
    add esp, 4

    push offset deducciones
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Calcular sueldo neto: sueldo + primas - deducciones ---
    mov eax, sueldo_basico
    add eax, primas
    sub eax, deducciones
    mov resultado, eax

    ; --- Mostrar resultado ---
    push resultado
    push offset formato_salida
    call crt_printf
    add esp, 8

    call crt_getchar
    ret
end start