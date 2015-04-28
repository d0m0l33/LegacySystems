IDENTIFICATION DIVISION.
PROGRAM-ID. ROMAN-NUMERAL-CONV.

ENVIRONMENT DIVISION.
	INPUT-OUTPUT SECTION.
	FILE-CONTROL.
		SELECT myFile ASSIGN TO literal
		ORGANIZATION IS line SEQUENTIAL.

DATA DIVISION.

FILE SECTION.
	FD myFile.
	01 IN-FILE.
		05 NAME PIC A(100).


WORKING-STORAGE SECTION.

01 WS-STUDENT.
	05 WS-NAME PIC x(100).
01 WS-EOF PIC A(1).

* stores individual roman numeral string

01 string-array. 
    05 StudentName pic x occurs 30 times.
    
    
* count used in calculating length of roman numeral string

01 strcnt pic 9(2) value 0.
    
    
* count used as index of each character in roman numeral string

01 cnt pic 9(2) value 1.

* roman numeral sum

01 romSum pic 9(5) value 0.

* length

01 l pic 9(2).

* option to either enter from command line or read from file

01 opt pic 9(1).


* number of times user wishes to enter a roman numeral

01 convNum pic 9(2).

* file name

01 fName pic x(25).


PROCEDURE DIVISION.
	
	Main.

	Display 'Choose 1 to read from file, Choose 2 to use command Line'.
	accept opt.
	
	if opt = 1 then		
		display 'OK, Please enter file name : '
		accept fName
		move fName to literal
		open input myFile
		
			perform until WS-EOF = 'Y'
				read myFile into string-array					
					at end move 'Y' to WS-EOF
				end-read
				perform get-size
			    DISPLAY 'RomanNumeral is : ' string-array
			    call 'func' using string-array,l,romSum
			    display "Roooman Numeral Sum : " romSum
	        end-perform
		close myFile
	end-if.
		
	if opt = 2 then
	
		display 'How many different numbers would you like to convert?(enter any integer) :'
		accept convNum
		perform convNum times
		
			Display 'Enter Roman Numeral (Upper or Lower Case)'
			Accept string-array
			perform get-size
			call 'func' using string-array,l,romSum
			display "Roman Numeral Sum : " romSum	
			
		end-perform
	end-if.
	
	display 'Terminating..'.
	
	STOP RUN.
	
	get-size.

		move 0 to strcnt.
		inspect string-array replacing all low-value by space.
		inspect function reverse(string-array) tallying strcnt for leading space.
		compute l = length of string-array - strcnt.
	        

