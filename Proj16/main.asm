;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/05/2019
;// Lab 6C

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	upper BYTE "Upper case " , 0ah,0dh,0
	lower BYTE "Lower case ", 0ah,0dh,0
	number BYTE "Number", 0ah,0dh,0
	punctuation BYTE "Punctuation", 0ah,0dh,0
	prompt BYTE "Enter a char ", 0ah, 0dh, 0

.code  		;// write your program here
main proc
	
	L1:
	mov edx, OFFSET prompt ;// prompt to edx
	call WriteString ;// writes
	call ReadChar ;// reads entered char
	call isPunc ;// calls proc isPunc
	cmp eax, 3 ;// compares eax to 3
	jz ISLOW ;// jumps if it is three
	cmp eax, 2 ;// compares eax to 2
	jz ISNUM ;// jumps if it is two
	cmp eax, 1 ;// compares eax to 1
	jz ISUP ;// jumps if it is one


	ISPUNC:
	mov edx, OFFSET punctuation ;// moves to edx
	call WriteString ;// writes content of edx
	Loop L1 ;// jumps to label

	ISLOW:
	mov edx, OFFSET lower ;// moves to edx
	call WriteString ;// writes content of edx
	Loop L1 ;// jumps to label
	ISUP:
	mov edx, OFFSET upper ;// preps to write
	call WriteString ;// writes
	Loop L1 ;// jumps to label
	ISNUM:
	mov edx, OFFSET number ;// moves to edx
	call WriteString ;// writes content of edx
	Loop L1 ;// jumps to label

	EXITOUT:
	exit ;// quites

	invoke ExitProcess,0
main endp

isUpper PROC
cmp al, 'A' ;// compares eax lower to 'A'
jz UPPERTRUE ;// zero flag set, its upper
jc UPPERFALSE ;// carry flag is set but not zero flag, char less than A

;// zero flag not set, carry flag not set, char is greater than A
cmp al, 'Z' ;// compares eax lower to Z
jz UPPERTRUE ;// zero flag set
jnc UPPERFALSE ;// no carryflag

UPPERTRUE:
mov eax, 1 ;// one to eax
ret ;// back to main
UPPERFALSE:
mov eax, 0 ;// zero to eax
ret ;// back to main
isUpper ENDP

isLower PROC
cmp al, 'a' ;// compares eax lower to 'a'
jz LOWERTRUE ;// zero flag set, its lower
jc LOWERFALSE ;// carry flag is set but not zero flag, char less than a

;// zero flag not set, carry flag not set, char is greater than a
cmp al, 'z' ;// compares eax lower to z
jz LOWERTRUE ;// zero flag set
jnc LOWERFALSE ;// no carryflag

LOWERTRUE:
mov eax, 0 ;// one to eax
ret ;// back to main
LOWERFALSE:
mov eax, 1 ;// zero to eax
ret ;// back to main
isLower ENDP

isPunc PROC
cmp al, 'A' ;// compares eax lower to 'a'
jz UPPERTRUE ;// zero flag set, its lower
jc UPPERFALSE ;// carry flag is set but not zero flag, char less than a

;// zero flag not set, carry flag not set, char is greater than a

cmp al, 'Z' ;// compares eax lower to z
jz UPPERTRUE ;// zero flag set
jnc UPPERFALSE ;// no carryflag

UPPERTRUE:
mov eax, 1 ;// one to eax
ret ;// back to main
UPPERFALSE:
cmp al, '0' ;// compares eax lower to '0'
jz NUMBERTRUE ;// zero flag set, its lower
jc NUMBERFALSE ;// carry flag is set but not zero flag, char less than a
;// zero flag not set, carry flag not set, char is greater than 0
cmp al, '9' ;// compares eax lower to '9'
jz NUMBERTRUE ;// zero flag set
jnc NUMBERFALSE ;// no carryflag
NUMBERTRUE:
mov eax, 2 ;// two to eax
ret ;// back to main
NUMBERFALSE:
cmp al, 'a' ;// compares eax lower to 'a'
jz LOWERTRUE ;// zero flag set, its lower
jc LOWERFALSE ;// carry flag is set but not zero flag, char less than a

;// zero flag not set, carry flag not set, char is greater than a
cmp al, 'z' ;// compares eax lower to z
jz LOWERTRUE ;// zero flag set
jnc LOWERFALSE ;// no carryflag

LOWERTRUE:
mov eax, 3 ;// one to eax
ret ;// back to main
LOWERFALSE:
mov eax, 0 ;// zero to eax
ret ;// back to main
isPunc ENDP

end main