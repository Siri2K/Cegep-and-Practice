;Sriram Kanagalingham , Id:40170212 , Section AI-X
; 21/06/2021
; Hello World

section .data
_msg	db	'juMping JAck flaSh #1', 10 ,0

section .bss
	
section .text
	global _start
_start:	
_print_before:	
		mov eax,4			; eax = 4
		mov ebx,1			; ebx = 1
		mov ecx,_msg		; ecx -> 'juMping JAck flaSh #1'
		mov edx, 22			; edx = character count
		int 80h				; output print
;--------------------------------------------------
		mov esi,0			; esi = 0
		mov ebp,_msg		; ebp -> msg
_top:		
		mov al, [ebp+esi]	; al = msg[esi]
		cmp al,0			; check if al = 0
		je _exit_loop		; jmp to exit_loop
       ;------------------------------------
		cmp al, 0x61		; check if al < 'a'
		jb _next			; jmp to next
		cmp al, 0x7a		; check if al > 'z'
		ja _next			; jmp to next
		sub al,32			; singular to capital character conversion
		mov [ebp+esi],al	; msg[esi] = al
	   ;------------------------------------
_next:	inc esi				; esi = esi+1
		jmp _top			; jmp to _top

_exit_loop:
;-------------------------------------------------
_print_after:   	
		mov eax,4			; eax = 4
		mov ebx,1			; ebx = 1
		mov ecx,_msg		; ecx -> 'juMping JAck flaSh #1'
		mov edx, 22			; edx = character count
		int 80h				; output print
;--------------------------------------------------
_exit:		
		mov eax,1
		mov ebx,0
		int 80h
