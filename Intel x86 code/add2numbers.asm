; Sriram Kanagalingham , id:4017012 , Section: AI
; June 7, 2021
; Sample program to add 2 numbers

section .data 		; Initialized variables in this section
mick dw 2 		; Define word (2 bytes) of data with value 2
keith dw 3		; Define word (2 bytes) of data with value 3

section .bss		; Uninitialized variables in this section

section .text
	global _start
_start:
	mov ax,[mick] 	; ax = mick = 2
ron:	mov bx,[keith]	; bx = keith = 3
	add ax,bx	; ax = ax+bx
	mov eax,1	; System call for exit (Sys_Exit)
	mov ebx,0	; Exit with return code of 0 (no error)
	int 80h
