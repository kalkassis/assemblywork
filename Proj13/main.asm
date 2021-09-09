;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/08/2019
;// Lab 5C

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	dwArray DWORD 12 DUP(?)

.code  		;// write your program here
main proc
	call Randomize ;// seeds the random number generator
	mov ebx, 0 ;// zero to ebx
	mov ecx, 12 ;// 12 to counter register ecx
	mov edx, OFFSET dwArray ;// moves array to edx
	call randArray ;// calls randarray proc
	call ArrayPrint ;// calls arrayprint proc


	invoke ExitProcess,0
main endp

randArray PROC
push ebx ;// saves
push ecx;// saves
L1:
mov eax, 6 ;//6 to eax
call RandomRange ;// eax is upper bound, will give you number between 0 and eax-1
mov dwArray[ebx], eax ;// moves to point ebx in array eax
add ebx, TYPE DWORD ;// adds ebx and length of dword
Loop L1 ;// loops back
pop ecx ;//saves
pop ebx ;// restores
ret ;// back to main proc
randArray ENDP

ArrayPrint PROC
push ebx ;// save in stack
push ecx ;// save in stack
L2:
mov eax, dwArray[ebx * TYPE DWORD] ;// moves to eax content at dwarray at ebx
call WriteInt ;// writes the content of eax
call Crlf ;// return
inc ebx ;// ebx up by one
Loop L2 ;// loops back
pop ecx ;// restore
pop ebx ;// restore
ret ;// back to main

ArrayPrint ENDP

end main