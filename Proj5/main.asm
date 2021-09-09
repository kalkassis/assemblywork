;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/03/2019
;// Lab 3A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "                               ************Welcome to the scrambler************", 0ah,0dh,0
	prompt2 BYTE "please enter ", 0ah,0dh,0

.code  		;// write your program here
main proc
mov edx, OFFSET prompt
call writestring
mov edx, OFFSET prompt2
call writestring
	invoke ExitProcess,0
main endp
end main