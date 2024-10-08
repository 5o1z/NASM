; Read a character from the user, convert it to an integer
; check if the number is even or odd, and print out the appropriate message

section .data
  msg1 db ' Please enter the number: '
  len1 equ $ - msg1

  msg2 db 'Odd number!', 0xA ; Flag 1
  len2 equ $ - msg2

  msg3 db 'Even number!', 0xA ; Flag 0
  len3 equ $ - msg3

section .bss
  num resb 1

section .text
  global _start

_start:
  ; Print msg1
  mov eax, 4               ; sys_write
  mov ebx, 1               ; stdout
  mov ecx, msg1            ; buffer
  mov edx, len1            ; length
  int 0x80                 ; call kernel

  ; Read a number from the user input and store in the buffer
  mov eax, 3               ; sys_read
  mov ebx, 0               ; stdin
  mov ecx, num             ; buffer
  mov edx, 4               ; length
  int 0x80                 ; call kernel

  movzx ax, byte [num]     ; take byte value from num into ax and expand to 16 bit
  sub ax, '0'              ; ASCII to decimal
  and ax, 1
  jz evenn
  mov eax, 4               ; sys_write
  mov ebx, 1               ; stdout
  mov ecx, msg2            ; buffer
  mov edx, len2            ; length
  jmp outprog

evenn:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, len3            ; length
  int 0x80                 ; call kernel

outprog:
  mov eax, 1               ; sys_exit
  xor ebx, ebx
  int 0x80                 ; call kernel
