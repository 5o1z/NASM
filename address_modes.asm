section .data
  name db 'Zara Ali'

section .text
  global _start

_start:
  ; Print 'Zara Ali'
  mov eax, 4 ; (sys_write)
  mov ebx, 1 ; (stdout)
  mov ecx, name
  mov edx, 9 ; msg length
  int 80h

  mov [name], dword 'Nuha' ; Đổi tên thành Nuha Ali
 ; 1 byte = 8 bits và 1 ký tự bằng 1 byte
 ; Nuha có 4 ký tự <=> 4 bytes = 1 dword
 ; Nuha sẽ ghi đè 4 bytes của Zara --> Nuha Ali

  ; In 'Nuha Ali'
  mov eax, 4 ; (sys_write)
  mov ebx, 1 ; (stdout)
  mov ecx, name
  mov edx, 8 ; msg length
  int 80h

  mov eax, 1 ; (sys_exit)
  xor ebx, ebx ; return 0
  int 80h

; --------------------------------------
; NASM to C
; --------------------------------------
; #include <unistd.h>
; #include <string.h>

; int main() {
;     // Khởi tạo chuỗi
;     char name[] = "Zara Ali";

;     // In ra chuỗi ban đầu "Zara Ali"
;     write(1, name, 9);  // stdout (1), chuỗi name, độ dài 9 (bao gồm dấu cách)

;     // Ghi đè phần đầu của chuỗi "Zara Ali" thành "Nuha"
;     memcpy(name, "Nuha", 4);  // Ghi đè 4 byte đầu tiên của chuỗi 'Zara Ali'

;     // In lại chuỗi đã thay đổi "Nuha Ali"
;     write(1, name, 8);  // stdout (1), chuỗi name, độ dài 8 (bao gồm dấu cách)

;     return 0;  // Exit chương trình với mã trả về 0
; }
