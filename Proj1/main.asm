;// Khalil Alkassis
;// CSIS-118B-3888
;// 05/22/2019
;// Final Exam

INCLUDE c:\Irvine\Irvine32.inc
FillArray PROTO,array: PTR DWORD, arraylength: DWORD ;// prototyping for invoke
PrintArrays PROTO, array: PTR DWORD, array1: PTR DWORD, row: DWORD, col: DWORD;// prototyping for invoke
FindNegative PROTO, array: PTR DWORD, arraylength: DWORD ;// prototyping for invoke
CalculateDiffOfArrays PROTO, array: PTR DWORD, array1: PTR DWORD, arraylength: DWORD;// prototyping for invoke
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myarray DWORD 16 DUP(?)
	myarray1 DWORD 16 DUP(?)
	prompt BYTE "Please enter 16 numbers: ", 0ah, 0dh, 0
	prompt1 BYTE "Here are your two 16 number arrays side by side in two columns:", 0ah, 0dh, 0
	prompt2 BYTE "The negative numbers found are:", 0ah, 0dh, 0
	prompt3 BYTE "No negative number found in the array.", 0ah, 0dh, 0
	prompt4 BYTE "Testing array for negative numbers. . .", 0ah, 0dh, 0
	prompt5 BYTE "The difference of the arrays is: ", 0ah, 0dh, 0
.code  		;// write your program here
main proc
	INVOKE FillArray, ADDR myarray, LENGTHOF myarray ;// invokes
	INVOKE FillArray, ADDR myarray1, LENGTHOF myarray1 ;// invokes
	INVOKE PrintArrays, ADDR myarray, ADDR myarray1, LENGTHOF myarray , 1 ;// invokes
	INVOKE FindNegative, ADDR myarray, LENGTHOF myarray ;// invokes
	INVOKE FindNegative, ADDR myarray1, LENGTHOF myarray1 ;// invokes
	INVOKE CalculateDiffOfArrays, ADDR myarray, ADDR myarray1, LENGTHOF myarray ;// invokes

	invoke ExitProcess,0
main endp
FillArray PROC,array: PTR DWORD, arraylength: DWORD
mov edx, OFFSET prompt ;// prep to write
call WriteString ;// writes
mov ecx, arraylength ;// moves to ecx the length of the array
mov edi, array ;// pass by pointer to edi
L1:
call readint ;// gets value from keyboard
mov [edi], eax ;// puts value into point in array pointed at by edi
add edi, SIZEOF array ;// moves to next dword
loop L1 ;// loops back
call crlf ;// spacing
ret ;// back to main
FillArray ENDP
PrintArrays PROC, array: PTR DWORD, array1: PTR DWORD, row: DWORD, col: DWORD
mov edx, offset prompt1 ;// preps to write
call writestring ;// writes
mov ecx, row ;// moves to ecx value in row
mov edi, array ;// moves to edi the pointer to array
mov esi, array1 ;// moves to edi the pointer to array
ROWS:
push ecx ;// saves
mov ecx, col ;// moves to ecx value in col
COLS:
mov eax, [edi] ;// moves to eax the value in edi
call WriteInt ;// writes
mov al, 09h ;// tab character
call WriteChar ;// writes tab
mov eax, [esi] ;// moves to eax the value in edi
call WriteInt ;// writes
loop COLS ;// loops
add edi, SIZEOF array ;// next dword
add esi, SIZEOF array ;// next dword
pop ecx ;// restores
call CRLF ;// return
loop ROWS ;// loops
call crlf ;// spacing
ret ;// back to main
PrintArrays ENDP
FindNegative PROC, array: PTR DWORD, arraylength: DWORD
mov edx, offset prompt4 ;// preps to write
call writestring ;// writes
mov edi, array ;// moves to edi the address of array
mov ecx, arraylength ;// moves to ecx the length of the array
mov ebx, 0 ;// sets ebx to zero
L1:
mov eax, [edi] ;// moves to eax value in edi
cmp eax, 0 ;// compares eax to zero
jl ISNEG ;// tests if eax is less than 0, if it is, it jumps to the label
JMP NEXT ;// jumps
ISNEG:
inc ebx ;// ebx up one
push eax ;// saves
NEXT:
add edi, SIZEOF array ;// next dword
loop L1 ;// loops
cmp ebx, 0 ;// compares ebx to zero
JE NONEGS ;// jumps if yes
mov ecx, ebx ;// moves into ecx value in ebx
mov edx, OFFSET prompt2 ;// preps to write
call writestring ;// writes
L2:
pop eax ;// restores
call writeint ;// writes
call crlf ;// spacing
loop L2 ;// loops
JMP ENDPROC ;// jumps
NONEGS:
mov edx, offset prompt3 ;// preps to write
call writestring ;// writes
ENDPROC:
call crlf ;// spacing
ret ;// back to main
FindNegative ENDP
CalculateDiffOfArrays PROC, array: PTR DWORD, array1: PTR DWORD, arraylength: DWORD
mov edx, OFFSET prompt5 ;// preps to write
call writestring ;// writes
mov ecx, arraylength ;// moves to ecx array length
mov edi, array ;// moves to edi the address of array
mov esi, array1 ;// moves to esi the address of array1
L1:
mov eax, [edi] ;// number at edi to eax
mov ebx, [esi] ;// number at esi to ebx
sub eax, ebx ;// eax = eax - ebx
mov [esi], eax ;// saves in array point of esi
add edi, SIZEOF array ;// next dword
add esi, SIZEOF array ;// next dword
loop L1 ;// loops back
mov ecx, arraylength ;// moves to ecx array length
mov esi, array1 ;// moves to esi the address of array1
L2:
mov eax, [esi] ;// preps to write
call writeint ;// writes
add esi, SIZEOF array ;// next dword
call crlf ;// spacing
loop L2 ;// loops

ret;// back to main
CalculateDiffOfArrays ENDP
end main