;// Khalil Alkassis
;// CSIS-118B-3888
;// 01/27/2019
;// Lab 2b

INCLUDE c:\Irvine\Irvine32.inc
;// these three lines must be included if irvine directory isnt and vice versa
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	




.code  		;// write your program here
main proc
call Clrscr ;// clears content on screen
call DumpRegs ;// dumps registers onto the console
mov al,22h ;// updates content of al segment with hex value ##h, the rest of EAX stays the same because al only affects the lower 8 bits 
call DumpRegs;// dumps registers onto the console
mov ax, 2222h ;//updates content of ax segment with hex value ##h, rest of EAX stays the same because ax affects only the lower 16 bits
call DumpRegs;// dumps registers onto the console
mov ah, 33h;//updates content of ah segment with hex value ##h, rest of EAX is the same because ah only affects  bits 8-16, the result is that the reading we are looking at is 3322, where we can represent ah 8 bit block as 33 and al 8 bit block as 22 
call DumpRegs;// dumps registers onto the console
mov eax, 4444h;//updates content of eax segment with hex value ##h, all if EAX changes here, 16 bit block ax is now represented as 4444 and the remaining upper 16 bits (two bytes) end up being zeros because we did not assign them a value here, and since calling eax means we are taking control of all 32 bits of EAX, they are cleared.
call DumpRegs;// dumps registers onto the console

	invoke ExitProcess,0
main endp
end main