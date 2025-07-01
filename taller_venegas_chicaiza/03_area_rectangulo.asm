.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
  base    dd ?
  altura  dd ?
  area    dd ?

  formato_entrada  db "%d", 0
  formato_salida   db 0Ah, "El area es: %d", 0Ah, 0

  msg_base         db 0Ah, "Ingrese la base: ", 0
  msg_altura       db 0Ah, "Ingrese la altura: ", 0

.code
start:
    ; --- Ingresar base ---
    push offset msg_base
    call crt_printf
    add esp, 4

    push offset base
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Ingresar altura ---
    push offset msg_altura
    call crt_printf
    add esp, 4

    push offset altura
    push offset formato_entrada
    call crt_scanf
    add esp, 8

    ; --- Calcular área: base * altura ---
    mov eax, base
    imul eax, altura
    mov area, eax

    ; --- Mostrar resultado ---
    push area
    push offset formato_salida
    call crt_printf
    add esp, 8

    call crt_getchar
    ret
end start