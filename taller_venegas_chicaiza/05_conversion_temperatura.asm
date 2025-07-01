.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib

.data
  celsius dd ?
  fahrenheit dd ?

  msgIngCelsius db "Ingrese la temperatura en grados Celsius: ", 0
  msgFahrenheit db "Temperatura en Fahrenheit: %d", 0Ah, 0

.code
start:
  ; Pedir Celsius
  push offset msgIngCelsius
  call crt_printf
  add esp, 4

  push offset celsius
  push offset fmt_int
  call crt_scanf
  add esp, 8

  ; Calcular Fahrenheit = (Celsius * 9 / 5) + 32

  mov eax, celsius
  imul eax, 9         ; eax = Celsius * 9
  mov edx, 0
  mov ecx, 5
  div ecx            ; eax = (Celsius * 9) / 5
  add eax, 32        ; eax = resultado + 32

  mov fahrenheit, eax

  ; Mostrar Fahrenheit
  push fahrenheit
  push offset msgFahrenheit
  call crt_printf
  add esp, 8

  call crt_getchar ; Esperar tecla
  ret

fmt_int db "%d", 0
end start