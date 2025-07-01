.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
  precio dd ?
  porcentaje dd ?
  descuento dd ?
  precioFinal dd ?

  msgIngPrecio db "Ingrese el precio original: ", 0
  msgIngPorcentaje db "Ingrese el porcentaje de descuento: ", 0
  msgPrecio db "Precio original: %d", 0Ah, 0
  msgDesc db "Valor del descuento: %d", 0Ah, 0
  msgFinal db "Precio final a pagar: %d", 0Ah, 0

.code
start:
  ; Solicitar precio
  push offset msgIngPrecio
  call crt_printf
  add esp, 4

  push offset precio
  push offset fmt_int
  call crt_scanf
  add esp, 8

  ; Solicitar porcentaje
  push offset msgIngPorcentaje
  call crt_printf
  add esp, 4

  push offset porcentaje
  push offset fmt_int
  call crt_scanf
  add esp, 8

  ; Calcular descuento = (precio * porcentaje) / 100
  mov eax, precio
  imul eax, porcentaje     ; eax = precio * porcentaje
  mov edx, 0
  mov ecx, 100
  div ecx                 ; eax = (precio * porcentaje) / 100
  mov descuento, eax

  ; Calcular precio final = precio - descuento
  mov eax, precio
  sub eax, descuento
  mov precioFinal, eax

  ; Mostrar precio original
  push precio
  push offset msgPrecio
  call crt_printf
  add esp, 8

  ; Mostrar descuento
  push descuento
  push offset msgDesc
  call crt_printf
  add esp, 8

  ; Mostrar precio final
  push precioFinal
  push offset msgFinal
  call crt_printf
  add esp, 8

  call crt_getchar ; Esperar tecla
  ret

fmt_int db "%d", 0
end start