;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/03/2019
;// Lab 3b

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter a number", 0dh, 0ah, 0 ;// 0dh and 0ah moves curser down and back
	prompt2 BYTE "the sum is", 0dh, 0ah, 0 ;// 0dh and 0ah moves curser down and back
    prompt3 BYTE "the difference is", 0dh, 0ah, 0 ;// 0dh and 0ah moves curser down and back

	val DWORD ? ;// ? means its empty

.code  		;// write your program here
main proc
mov edx, OFFSET prompt ;// offset seaches for first character, in this case E in enter and then writes the following
call WriteString ;// writes the string
call ReadInt ;// reads inputted int and moves it by default to eax
mov val,eax ;// moves inputted int stored in eax to our created val DWORD
call WriteString ;// writes the string
call ReadInt;// reads inputted int and moves it by default to eax
add eax, val ;// adds value in eax to value in val and stores result in eax
mov val,eax ;// moves inputted int stored in eax to our created val DWORD
call WriteString ;// writes the string
call ReadInt;// reads inputted int and moves it by default to eax
add eax, val ;// adds value in eax to value in val and stores result in eax
mov val, eax ;// moves inputted int stored in eax to our created val DWORD
mov edx, OFFSET prompt2 ;// offset seaches for first character, in this case E in enter and then writes the following
call WriteString ;// writes the string
call WriteDec ;// writes value as a dec (no +/-)
call Crlf ;// acts as return
mov edx, OFFSET prompt ;// offset seaches for first character, in this case E in enter and then writes the following
call WriteString ;// writes the string
call ReadInt ;// reads inputted int and moves it by default to eax
sub val, eax ;// subtracts from val the value stored in eax
mov edx, OFFSET prompt ;// offset seaches for first character, in this case E in enter and then writes the following
call WriteString ;// writes the string
call ReadInt ;// reads inputted int and moves it by default to eax
sub val, eax ;// subtracts from val the value stored in eax
mov eax, val ;// moves value in val to eax
mov edx , OFFSET prompt3 ;// moves prompt3 to edx
call WriteString ;// writes what is contained in edx
call WriteInt ;// writes value in eax as an Int (with +/-)

call Crlf ;// acts as return

	invoke ExitProcess,0
main endp
end main