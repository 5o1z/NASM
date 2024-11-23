section .text
  global _start

_start:
  mov al, 5 ; 5 = 0101
  mov bl, 3 ; 3 = 0011
  or al, bl ; --> 0111 = 7 --> result
  add al, byte '0'

  mov [result], al
  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, 1
  int 0x80

  mov eax, 1
  int 0x80

section .bss
  result resb 1
