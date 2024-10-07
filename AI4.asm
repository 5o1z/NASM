; Trong phép chia kết quả (thương) được lưu vào AX | số dư được lưu và DX
; Thanh ghi AX được dùng để lưu kết quả của các phép tính
; Trong khi đó thanh ghi DX dùng để lưu những phần nầng cao hơn của phép tính ví dụ số dư...

; The dividend 8 is stored in the 16-bit AX register and the divisor 2 is stored in the 8-bit BL register
section .text
  global _start

_start:
  mov ax, '8' ; 18 bits register (2 bytes)
  sub ax, '0'

  mov bl, '2' ;  8 bit register (1byte)
  sub bl, '0'
  div bl
  add ax, '0'

  mov [res], ax
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

  ; Print result
  mov eax, 4
  mov ebx, 1
  mov ecx, res
  mov edx, 1
  int 0x80

  mov eax, 1
  xor ebx, ebx
  int 0x80

section .data
  msg db 'The result is: ', 0xa, 0
  len equ $ - msg

section .bss
  res resb 1
