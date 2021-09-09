;// Khalil Alkassis
;// CSIS-118B-3888
;// 01/27/2019
;// Lab 2

INCLUDE c:\Irvine\Irvine32.inc
;// these three lines must be included if irvine directory isnt and vice versa
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
		msg1 BYTE "Here is some notable fiction:", 0dh,0ah,0
		title1 BYTE "The Pearl",0
		author1 BYTE "John Steinbeck",0
		publisher1 BYTE "Viking Press",0
		title2 BYTE "The Great Gatsby",0
		author2 BYTE "F. Scott Fitzgerald",0
		publisher2 BYTE "Scribner",0
		title3 BYTE "1984",0
		author3 BYTE "George Orwell",0
		publisher3 BYTE "Harvill Secker",0
		msg BYTE 0dh,0ah,0 ;// CR LF
		tabr BYTE 9h, 0 ;//TAB




.code  		;// write your program here
main proc
call Clrscr ;// clears screen
mov edx,offset msg1 ;// moves into edx registry first message, in this case msg1
call WriteString ;// writes message
mov edx,offset msg ;// moves into edx registry the CR LF string msg (creates new column)
call WriteString;// writes message

mov edx,offset title1 ;// moves into edx registry first book title, in this case title1
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg (creates spacing), changed from crlf for formatting
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg, changed from crlf for formatting

call WriteString;// writes message

mov edx,offset author1 ;// moves into edx registry first author, in this case author1
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset tabr;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset tabr;// moves into edx registry the tab string msg
call WriteString;// writes message

mov edx,offset publisher1 ;// moves into edx registry first publisher, in this case publisher1
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF msg
call WriteString;// writes message

mov edx,offset title2 ;// moves into edx registry second book title, in this case title2
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg, changed from crlf for formatting
call WriteString;// writes message

mov edx,offset author2 ;// moves into edx registry second author, in this case author2
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset tabr;// moves into edx registry the tab string msg
call WriteString;// writes message

mov edx,offset publisher2 ;// moves into edx registry second publisher, in this case publisher2
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF msg
call WriteString;// writes message

mov edx,offset title3 ;// moves into edx registry third book title, in this case title3
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg, changed from crlf for formatting
call WriteString;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg, changed from crlf for formatting
call WriteString;// writes message
mov edx,offset tabr ;// moves into edx registry the tabr string msg, changed from crlf for formatting
call WriteString;// writes message

mov edx,offset author3 ;// moves into edx registry third author, in this case author3
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset tabr;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset tabr;// moves into edx registry the tab string msg 
call WriteString;// writes message

mov edx,offset publisher3 ;// moves into edx registry third publisher, in this case publisher3
call WriteString ;// writes message
mov edx,offset tabr ;// moves into edx registry the tab string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF string msg
call WriteString;// writes message
mov edx,offset msg;// moves into edx registry the CR LF msg
call WriteString;// writes message

	


	invoke ExitProcess,0
main endp
end main