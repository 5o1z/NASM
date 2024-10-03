section .data
  userMsg db 'Please enter a number: '
  lenUserMsg equ $ - userMsg
  disMsg db 'You have entered: '
  lenDisMsg equ $ - disMsg

section .bss
  num resb 5 ; Unitialized data

section .text
  global _start

_start:
  ; Display user prompt
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, userMsg
  mov edx, lenUserMsg
  int 0x80

; Read and store the user input
  mov eax, 3 ; sys_read
  mov ebx, 2 ; stdin
  mov ecx, num
  mov edx, 5 ; Size of the user input (5 bytes)
  int 0x80

; Output the message
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, disMsg
  mov edx, lenDisMsg
  int 0x80

; Output the number have enter
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, num
  mov edx, 5 ; Size of the number (5 bytes)
  int 0x80
; Exit the program

  mov eax, 1
  mov ebx, 0
  int 0x80

; ---------------------------------------------
; NASM to C
; ---------------------------------------------

; #include <stdio.h>

; int main() {
;     char num[6];  // Bộ nhớ để lưu số mà người dùng nhập, thêm 1 ký tự cho '\0'

;     // Hiển thị thông báo yêu cầu nhập số
;     printf("Please enter a number: ");

;     // Đọc số từ người dùng nhập vào
;     fgets(num, sizeof(num), stdin);  // Đọc tối đa 5 ký tự từ người dùng, fgets tự thêm ký tự '\0'

;     // Hiển thị thông báo "You have entered: "
;     printf("You have entered: ");

;     // Hiển thị lại số mà người dùng đã nhập
;     printf("%s", num);

;     return 0;  // Thoát chương trình
; }
