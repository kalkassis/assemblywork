;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/17/2019
;// Midterm

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
    prompt BYTE "The first array is: ", 0dh, 0ah, 0
    prompt1 BYTE "The second array is: ", 0dh, 0ah, 0
	array1 DWORD 10 DUP(?)
	array2 DWORD 10 DUP(?)

.code  		;// write your program here
main proc
	call Randomize ;// seeds random number generator
	mov ebx, 0 ;// zero to ebx
	mov ecx, 10 ;// 10 to counter register ecx
	call randArray ;// calls randArray proc
	call powerArray ;// calls powerArray proc
	call ArrayPrint ;// prints both arrays

	invoke ExitProcess,0
main endp
randArray PROC
push ebx ;// saves
push ecx;// saves
push edx ;// saves
mov edx, OFFSET array1 ;// moves array1 to edx
L1:
mov eax, 5 ;//5 to eax, not 7 because the resultant of the next procedure call needs to be incremented by two to adjust for the range 2-6
call RandomRange ;// eax is upper bound, will give you number between 0 and eax-1
add eax, 2 ;// adds two to the resulting random number to adjust for lower bound 2
mov array1[ebx], eax ;// moves to point ebx in array eax
add ebx, TYPE DWORD ;// adds ebx and length of dword
Loop L1 ;// loops back
pop edx ;// restores
pop ecx ;//saves
pop ebx ;// restores
ret ;// back to main proc
randArray ENDP


ArrayPrint PROC
push ebx ;// save in stack
push ecx ;// save in stack
push edx ;// saves
mov edx, OFFSET prompt ;// prompt to edx
call WriteString ;// writes content of edx
L2:
mov eax, array1[ebx * TYPE DWORD] ;// moves to eax content at array1 at ebx
call WriteInt ;// writes the content of eax
call Crlf ;// return
inc ebx ;// ebx up by one
Loop L2 ;// loops back
mov edx, OFFSET prompt1 ;// prompt1 to edx
call WriteString ;// writes content of edx
mov ebx, 0 ;// zero to ebx
mov ecx, 10 ;// 10 to counter register ecx
L3:
mov eax, array2[ebx * TYPE DWORD] ;// moves to eax content at array2 at ebx
call WriteInt ;// writes the content of eax
call Crlf ;// return
inc ebx ;// ebx up by one
Loop L3 ;// loops back
pop edx ;// restores
pop ecx ;// restore
pop ebx ;// restore
ret ;// back to main

ArrayPrint ENDP

powerArray PROC
push ebx ;// saves
push ecx;// saves
push edx ;// saves

L4:
mov eax, array1[ebx * TYPE DWORD] ;// moves to eax content at array1 at ebx
mul eax ;// multiplies eax by itself, effectively eax^2
mov array2[ebx * TYPE DWORD], eax ;// moves to array2 at ebx content of eax, storing the resultant of eax^2 there
mov eax, array1[ebx * TYPE DWORD] ;// moves to eax content at array1 at ebx, setting it up to get multiplied by eax^2
mul array2[ebx * TYPE DWORD] ;// multiplying eax by eax^2, effectivly resulting in eax^3
mov array2[ebx * TYPE DWORD], eax ;// moves to array2 at ebx content of eax
inc ebx ;// ebx up by one
Loop L4 ;// loops

pop edx ;// restores
pop ecx ;// restores
pop ebx;//restores
ret ;// back to main
powerArray ENDP
end main