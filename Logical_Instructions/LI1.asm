section .text
  global _start

_start:
  mov ax, 8h ; getting 8 in the ax
  and ax, 1 ; and ax with 1
  jz evnn ; jump if zero 
  mov eax, 4 ; syscall number for write
  mov ebx, 1 ; file descriptor 1 (stdout)
  mov ecx, odd_msg
  mov edx, len2 ; length of message
  int 0x80 ; calling kernel
  jmp outprog

evnn:
  mov ah, 09h
  mov eax, 4 ; syscall number for write
  mov ebx, 1 ; file descriptor 1 (stdout)
  mov ecx, even_msg
  mov edx, len1 ; length of message
  int 0x80 ; calling kernel

outprog:
  mov eax, 60 ; syscall number for exit
  xor ebx, ebx ; exit code 0
  int 0x80 ; calling kernel

section .data
  even_msg db 'Even number!'
  len1 equ $ - even_msg

  odd_msg db 'Odd number!'
  len2 equ $ - odd_msg
