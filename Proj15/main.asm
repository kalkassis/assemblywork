;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/04/2019
;// Lab 6B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Guess a number between 10 and 20", 0ah,0dh,0
	outPrompt BYTE "The amount of times your number appeared in the array was: ",0ah,0dh,0
	count DWORD 0 ;// how many times user guesses
	array BYTE 6 DUP(?)

.code  		;// write your program here
main proc
	call Randomize ;// seeds random number generator
	TOP:
	mov edx, OFFSET prompt ;// moves prompt to edx
	call WriteString ;// writes
	call ReadInt ;// gets guess
	call arrayfill ;// calls proc arrayfill
	call numcheck ;// calls proc numcheck
	cmp eax, 0 ;// eax is count at this point, checks if its zero
	jz TOP ;// if count was zero, it loops back to TOP label

	exit ;// quits


	invoke ExitProcess,0
main endp
arrayfill PROC 
    push eax ;// saves
	push ebx ;// saves
	push ecx ;// saves
	mov ecx, lengthof array ;// 6 to ecx
	L1:
    mov eax, 10 ;// 10 to eax, sets upper bound for generator
	call RandomRange ;// gets value from 0 and eax-1
	inc eax ;// eax up by one
	add eax, 10 ;// adds to adjust for 10-20
	mov array[ecx * SIZEOF BYTE], al ;// moves number to array at pos 6 all the way down to 1
	Loop L1 ;// loops
	mov ecx, lengthof array ;// 6 to ecx
	L3:
	mov al, array[ecx * SIZEOF BYTE] ;// moves number to array at pos 6 all the way down to 1
	call writeInt ;// writes
	loop L3
	call Crlf ;// spacing
	pop ecx ;// restores
	pop ebx ;// restores
	pop eax ;// restores
	ret ;// back to main
arrayfill endp

numcheck PROC 
push ecx ;// saves
mov count, 0 ;// zeros count
mov ecx, lengthof array ;// sets ecx to size of array
L2:
cmp al, array[ecx * SIZEOF BYTE] ;// compares eax lower with number at point ecx of array
jz DETECTED ;// jumps to label if comparison is positive
JMP NOTDETECTED ;// jumps to notdetected if the number wasnt there
DETECTED:
inc count ;// count up if detected
NOTDETECTED:
loop L2
mov edx, OFFSET outPrompt ;// preps to write
call WriteString ;// writes
mov eax, count ;// count to eax
call WriteDec ;// writes
call Crlf ;// spacing
pop ecx ;// restores
ret ;// back to main
numcheck endp
end main