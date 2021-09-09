;// Khalil Alkassis
;// CSIS-118B-3888
;// 01/20/2019
;// Lab 1

INCLUDE c:\Irvine\Irvine32.inc
;// these three lines must be included if irvine directory isnt and vice versa
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	msg1 BYTE "Welcome to", 0dh,0ah,0
    msg2 BYTE "ASM Programming", 0dh,0ah,0
    msg3 BYTE  0dh,0ah,0 ;//creates blank line
	msg4 BYTE "ASM language is fun to work with!", 0dh,0ah,0




.code  		;// write your program here
main proc
	mov edx, offset msg1;//moves into edx register the first message string
	call WriteString;//writes message to console
	mov edx, offset msg2;//moves into edx register the second message string
	call WriteString;//writes message to console
	mov edx, offset msg3;//moves into edx register the third message string
	call WriteString;//writes message to console
	mov edx, offset msg4;//moves into edx register the fourth message string
	call WriteString;//writes message to console


	invoke ExitProcess,0
main endp ;//ends procedure
end main