; This is the same as register.asm

section .data:
  stars times 9 db "*"

section .text
  global _start

_start:
  mov  eax, 4  ; sys_write
  mov ebx, 1  ; stdout
  mov ecx, stars
  mov edx, 9
  int 80h

  mov eax, 1
  int 80h
