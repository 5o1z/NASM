SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
  msg1 db 'Enter a digit', 0xA
  len1 equ $ - msg1

  msg2 db 'Please enter a second digit', 0xA, 0xD
  len2 equ $ - msg2

  msg3 db 'The sum is: '
  len3 equ $ - msg3

section .bss
  num1 resb 2
  num2 resb 2
  res resb 1

section .text
  global _start

_start:
  ; Block 1
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, len1
  mov edx, msg1
  int 0x80

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num1
  mov edx, 2
  int 0x80

 ; Block 2
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, len2
  mov edx, msg2
  int 0x80

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num2
  mov edx, 2
  int 0x80

  ; Block 3
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, len3
  mov edx, msg3
  int 0x80

  ; moving the first number to eax register and second number to ebx
  ; and subtracting ascii '0' to convert it into a decimal number

  mov eax, [num1] ; Move variable 'num1' to eax register
  sub eax, '0' ; Change ASCII to decimal

  mov ebx, [num2] ; Move variable 'num2' to eax register
  sub ebx, '0' ; Change ASCII to decimal
  ; ---> The purpose of converting from ascii to decimal is to perform the calculation accurately.
  ; Because when we enter, the eax register will be stored in ASCII format and we need to convert them.
  ; Then convert back to ASCII to print to the screen.
  ; Adding the two numbers
  add eax, ebx
  ; add '0' to to convert the sum from decimal to ASCII
  add eax, '0'
  ; storing the sum in memory location res
  mov [res], eax

  ; Print the result
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, 1
  mov edx, res
  int 0x80

exit:
  mov eax, SYS_EXIT
  xor ebx, ebx
  int 0x80
