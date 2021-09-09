;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/31/2019
;// Test 3

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Do you want to draw a card? (Y/N)",0ah,0dh,0
	prompt2 BYTE "Thank you for playing. Come back soon.",0ah,0dh,0
	prompt3 BYTE "Please draw a card. Press any key.",0ah,0dh,0
	prompt4 BYTE "Your card is: ",0ah,0dh,0
	

.code  		;// write your program here
main proc
		L1:
		call Randomize ;// seeds the random number generator
		mov edx, OFFSET prompt ;// preps to write
		call writestring ;// writes
		call readchar ;// reads input, stores in eax lower (al)
		call writechar ;// writes 
		call crlf ;//return
		cmp al, 'Y' ;// compares eax to Y
		jz YESLABEL ;// jumps to yesLABEL label if input was Y
		cmp al, 'y' ;// compares eax to y
		jz YESLABEL ;// jumps to yesLABEL label if input was y
		mov edx, OFFSET prompt2 ;.. preps tp write
		call writestring ;// writes
		JMP EXITLABEL ;// jumps to exit label
		YESLABEL:
		mov edx, OFFSET prompt3 ;// preps to write
		call crlf ;// returns
		call writestring ;// writes
		call readchar ;// reads char and stores in al in eax
		call NUMGEN ;// generates card number
		call SUITEGEN ;// generates suite
		cmp eax, 65 ;// checks ascii
		jz Letterlbl ;// goes to label
		cmp eax, 74 ;// checks ascii
		jz Letterlbl ;// goes to label
		cmp eax, 81;//checks ascii
		jz Letterlbl ;// goes to label
		cmp eax, 75;//checks ascii
		jz Letterlbl;// goes to label
		JMP Numlbl ;// jumps to numlbl
		Letterlbl:
		mov edx, offset prompt4 ;// preps to write
		call writestring ;//writes
		call writechar ;// writes char
		mov eax, ebx ;// moves to eax ebx
		call writechar ;// writes char
		JMP Looplbl ;// jumps to Looplbl
		Numlbl:
		mov edx, offset prompt4 ;// preps to write
		call writestring ;//writes
		call writedec ;// writes int
		mov eax, ebx ;// moves to eax value in ebx
		call writechar ;// writes char
		Looplbl:
		call crlf ;// returns
		call crlf ;// returns
		JNZ L1 ;// jumps back
		EXITLABEL:
		exit ;// ends program


	invoke ExitProcess,0
main endp
NUMGEN PROC
mov eax, 13 ;//13 to eax
call RandomRange ;// eax is upper bound, will give you number between 0 and eax-1
inc eax ;// eax up by one to adjust for no zeros
cmp eax, 1 ;// checks if eax is 1
jz Albl ;// jumps to Albl
cmp eax, 11 ;// checks if eax is 11
jz Jlbl ;// jumps to Jlbl
cmp eax, 12 ;// checks if eax is 12
jz Qlbl ;// jumps to Qlbl
cmp eax, 13 ;// checks if eax is 13
jz Klbl ;// jumps to Klbl
JMP NumLBL ;// jumps to NumLBL

Albl:
mov eax, 'A' ;// if so, changes eax to A 
JMP NumLBL ;// jumps to NumLBL
Jlbl:
mov eax, 'J' ;// if so, changes eax to J 
JMP NumLBL ;// jumps to NumLBL
Qlbl:
mov eax, 'Q' ;// if so, changes eax to Q 
JMP NumLBL ;// jumps to NumLBL
Klbl:
mov eax, 'K' ;// if so, changes eax to K 
NumLBL:
ret ;// returns
NUMGEN ENDP

SUITEGEN PROC
push eax ;// saves
mov eax, 4 ;//4 to eax
call RandomRange ;// eax is upper bound, will give you number between 0 and eax-1
inc eax ;// eax up by one to adjust for no zeros
cmp eax, 1 ;// checks if eax is 1
jz Slbl ;// jumps to Slbl
cmp eax, 2 ;// checks if eax is 2
jz Hlbl ;// jumps to Hlbl
cmp eax, 3 ;// checks if eax is 3
jz Dlbl ;// jumps to Dlbl
cmp eax, 4 ;// checks if eax is 4
jz Clbl ;// jumps to Clbl
JMP NumLBL ;// jumps to NumLBL

Slbl:
mov eax, 's' ;// if so, changes eax to A
JMP NumLBL ;// jumps to NumLBL
Hlbl:
mov eax, 'h' ;// if so, changes eax to J
JMP NumLBL ;// jumps to NumLBL
Dlbl:
mov eax, 'd' ;// if so, changes eax to Q
JMP NumLBL ;// jumps to NumLBL
Clbl:
mov eax, 'c' ;// if so, changes eax to K
NumLBL:
mov ebx, eax ;// stores value in ebx so we can put the suite in eax
pop eax ;// restores
ret ;// returns
SUITEGEN ENDP
end main