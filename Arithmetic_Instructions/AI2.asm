section .text
  global _start

_start:
  mov eax, '3'
  sub eax, '0' ; Change ascii to decimal

  mov ebx, '4'
  sub ebx, '0' ; Change ascii to decimal
  add eax, ebx
  add eax, '0' ; Change decimal to ascii

  mov [sum], eax
  
  mov ecx, msg
  mov edx, len
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov ecx, sum
  mov edx,  1
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov eax, 1
  int 0x80

section .data
  msg db 'Sum of 3 and 4 is ', 0x0a, 0x00
  len equ $ - msg
  segment .bss
  sum resb 1
