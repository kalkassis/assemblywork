;// Khalil Alkassis
;// CSIS-118B-3888
;// 05/12/2019
;// Lab 9b

INCLUDE c:\Irvine\Irvine32.inc
fill2DArray PROTO,myArray:PTR DWORD, cLength: DWORD,rLength: DWORD ;// prototyping for invoke
print2DArray PROTO, myArray:PTR DWORD, cLength:DWORD, rLength: DWORD ;// prototyping for invoke
sumOddEven PROTO, myArray: PTR DWORD, Divby: DWORD ;// prototyping for invoke
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	Array DWORD 20 DUP(?)
	prompt BYTE "The sum of the even numbers is: ", 0ah, 0dh ,0
	prompt2 BYTE "THe sum of the odd numbers is: ", 0ah, 0dh, 0
.code  		;// write your program here
main proc
	INVOKE fill2DArray, ADDR Array, 5, 4 ;// passes address of Array and 5 columnms with 4 rows
	INVOKE print2DArray, ADDR Array, 5 ,4 ;// does same as above but for print
	INVOKE sumOddEven, ADDR Array, 2
	mov edx, OFFSET prompt ;// preps to write
	call WriteString ;// writes
	mov eax, ebx ;// moves sum of evens to eax
	call WriteDec ;// writes
	call crlf ;// clear
	mov edx, OFFSET prompt2 ;// preps to write
	call WriteString ;// writes
	mov eax, esi ;// moves sum of odds to eax
	call WriteDec ;// writes
	invoke ExitProcess,0
main endp
fill2DArray PROC,myArray:PTR DWORD, cLength: DWORD,rLength: DWORD
mov ecx, rLength ;// move value passed in rLength to ecx
mov edi, myArray ;// pass by pointer to edi
ROW:
push ecx ;// saves
mov ecx, cLength ;// moves to ecx column length
COL:
mov eax, 100 ;// preps num generater max 0-99
call RandomRange ;// get random number from 0 to eax
add eax, 1 ;// moves to 0-100
mov [edi], eax ;// store value in the array
add edi, 4 ;// move to next DWORD
loop COL ;// loop back
pop ecx ;// restores
loop ROW ;// loops back
ret ;// back to main
fill2DArray ENDP
print2DArray PROC, myArray:PTR DWORD, cLength:DWORD, rLength: DWORD
mov ecx, rLength ;// move value passed in rLength to ecx
mov edi, myArray ;// pass by pointer to edi
ROW:
push ecx ;// saves
mov ecx, cLength ;// moves to ecx value in cLength
COL:
mov eax, [edi] ;// moves to eax the value in edi
call WriteDec ;// writes
mov al, 09h ;// tab character
call WriteChar ;// writes tab
add edi, 4 ;// next DWORD
loop COL ;// loops
pop ecx ;// restores
call CRLF ;// return
loop ROW ;// loops
ret ;// back to main
print2DArray ENDP
sumOddEven PROC, myArray: PTR DWORD, Divby: DWORD
push ecx ;// saves
mov ecx, 20 ;// length of array is static here so i set it to the same
mov ebx, 0 ;// clears
mov esi, 0 ;// clears
mov edi, myArray ;// pass by pointer to edi
L1:
mov eax, [edi] ;// moves to eax the value at edi (pointer to address of first value in Array)
mov edx, 0 ;// preps for division, this will hold remainder
div Divby ;// divides eax by Divby, frees up ebx to hold values
cmp edx, 0 ;// tests to see if number was even, because if it was the remainder would be zero
jz EVENLABEL ;// even numberjump, if zero flag is set jz = jump if zero
add esi, [edi] ;// adds to the esi register the value pointed at by the edi register
JMP EXITPROC ;// jumps over to exit label, that way it wont go through evenlabel regardless of result
EVENLABEL:
add ebx, [edi] ;// adds to ebx the
EXITPROC:
add edi, 4 ;// next DWORD
loop L1 ;// loops
pop ecx ;// restores
ret ;// back to main
sumOddEven ENDP
end main