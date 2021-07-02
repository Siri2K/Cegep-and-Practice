; Sriram Kanagalingham
; 40170212
; s_anagal@live.concordia.ca
; Section: AI-X
; 21/06/2021


section	.data
array	db	3,2,4,1,5,6
; array => 0x00000000 = 0x03
;	   0x00000001 = 0x02
;	   0x00000002 = 0x04
;          0x00000003 = 0x01
;	   0x00000004 = 0x05
;          0x00000005 = 0x06

;array = 3 2
;	 4 1
;	 5 6


section	.bss
element_result	resb 	1

section	.text
	global	_start


_start:
	mov al,2		 ; row index = 0			-> mov,register direct,immediate 
	mov bl,0		 ; column index = 0			-> mov,register direct,immediate

	mov cl,2		 ; cl = 2 , Number of columns in Array 	-> mov,register direct,immediate
	imul cl			 ; ax = al*2 				-> mov,register direct
	add al,bl		 ; al = al+bl			        -> mov,register direct,register direct
										
	mov esi,eax		 ; esi = eax 				-> mov,register direct,register direct
	mov ebp, array		 ; ebp = array 				-> mov,register direct,register direct
	mov cl,[ebp+esi]	 ; cl = 0x03 				-> mov,register direct,register inderect with displacement
	mov [element_result],cl	 ; M[element_value] = cl		-> mov,register indirect with displacement,register direct


_exit: 	mov eax,1 ; -> mov,register direct,immediate
	mov ebx,0 ; -> mov,register direct,immediate
	int 0x80  ;						



; Addressing Mode Identification Process:
;
; opcode,adress mode for destination, address mode for source
;
; Ex: mov eax,0 -> mov,register direct,immediate

