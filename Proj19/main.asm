;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/20/2019
;// Lab 8A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myString BYTE "Enter a Character",0ah,0dh,0
	aVowel BYTE "Character is a vowel", 0ah, 0dh, 0
	noVowel BYTE "Character is not a vowel", 0ah, 0dh ,0
	prompt BYTE "Enter Three Numbers to Add: ",0ah,0dh,0
	prompt2 BYTE "The sum of all three is: ",0ah,0dh,0

	num1 WORD ?
	num2 WORD ?
	num3 WORD ?

.code  		;// write your program here
main proc
	mov eax, 0 ;// clears
	mov ebx, 0 ;// clears
	mov ecx, 3 ;// sets ecx equal to three
	;mov edx, OFFSET myString ;// sets up to write
	;call WriteString ;// writes
	;call ReadChar ;// reads input
	;push ax ;// saves ax onto stack, aka the char we want to test in this case
	;call IsVowel ;// calls proc
	;cmp ax,1 ;// checks value
	;je AVOWL ;// jumps if it was
	;mov edx, OFFSET noVowel ;// sets to write
	;jmp EXITB ;// jumps
	;AVOWL:
	;mov edx, OFFSET aVowel ;// sets up to write
	;EXITB:
		;call WriteString ;// writes

		mov edx, OFFSET prompt ;// preps to write
		call WriteString ;// writes
		L1:
		call Readint ;// reads
		push ax ;// pushes to stack
		mov eax, 0 ;// since it is a signed value, the entire register needs to be cleared out since the uppermost bytes are altered due to the sign, if an even number is entered after a neg without clearing it will be off
		loop L1 ;// loops back
		call SumThree ;// calls proc
		mov edx, OFFSET prompt2 ;// preps to write
		call Writestring ;// writes
		call Writeint ;// writes
	invoke ExitProcess,0
main endp
IsVowel PROC
push ebp ;// saves the stack base pointer, holds base address of stack frame
mov ebp, esp ;// setup stack for IsVowel
mov ax, [ebp + 8] ;// ebp is 0-7 then + 8 for 16 bits, get parameter off stack
cmp al, 'A' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'E' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'I' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'O' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'U' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'a' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'e' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'i' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'o' ;// checks if vowel
JE VOWEL ;// jumps if it is
cmp al, 'u' ;// checks if vowel
JE VOWEL ;// jumps if it is
mov eax, 0 ;// clears eax, indicates its not a vowel
jmp EXITA ;// jumps
VOWEL:
mov eax, 1 ;// 1 to eax, indicates vowel
pop ebp ;// restores stack
ret ;// back
EXITA:
pop ebp ;// restores stack
ret;// back
IsVowel ENDP


SumThree PROC
push ebp ;// saves base pointer
mov ebp, esp ;// set base pointer to top of stack
mov ax, [ebp + 8]
mov num1, ax ;// moves to num1 value in ax
mov ax, [ebp + 10] ;// gets second num stored in ebp + 10
mov num2, ax ;// moves to num2 value in ax
mov ax, [ebp + 12] ;// gets second num stored in ebp + 12
mov num3, ax ;// moves to num3 the value stored in ax
mov ax, num1 ;// moves to ax the value in num1
add ax, num2 ;// adds val in ax (num1) to num2 and stores in ax
add ax, num3 ;// adds val in ax (num1 + num2) to num3 and stores in ax
pop ebp ;// restore
ret ;// back to main
SumThree ENDP
end main