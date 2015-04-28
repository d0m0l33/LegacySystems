IDENTIFICATION DIVISION.
PROGRAM-ID. func.

DATA DIVISION.

	WORKING-STORAGE SECTION.
	
* count used as index
	
	01 cnt pic 9(2) value 1.
	
* R + 1th number in roman numeral string	
	
	01 conv pic 9(5) value 0.
	
* Rth number in roman numeral string

	01 prev pic 9(5) value 0.	

    LINKAGE SECTION.
    
    01 string-array. 
        05 romNum pic x occurs 30 times.
       
* length of roman numeral string
 
    01 l pic 9(2).
 
 
* roman numeral sum
   
	01 romSum pic 9(5) value 0.
	

    

PROCEDURE DIVISION USING string-array,l,romSum.

	compute romSum = 0.
	compute cnt = 1.
	compute prev = 1001.

	perform l times

		if romNum(cnt) = 'V' or romNum(cnt) = 'v' then
			compute conv =  5 
		end-if
		if romNum(cnt) = 'X' or romNum(cnt) = 'x' then
			compute conv =  10 
		end-if
		if romNum(cnt) = 'L' or romNum(cnt) = 'l' then
			compute conv =  50 
		end-if
		if romNum(cnt) = 'C' or romNum(cnt) = 'c' then
			compute conv =  100 
		end-if
		if romNum(cnt) = 'D' or romNum(cnt) = 'd' then
			compute conv =  500 
		end-if
		if romNum(cnt) = 'M' or romNum(cnt) = 'm' then
			compute conv =  1000
		end-if
		if romNum(cnt) = 'I' or romNum(cnt) = 'i' then
			compute conv = 1
		end-if
		add 1 to cnt
			
			
*	if Rth term is bigger than R + 1th term, then add Rth term to the total
	
		compute romSum = romSum + conv
		if conv > prev then
			compute romSum = romSum - (2 * prev)
		end-if
		
		move conv to prev
									
	end-perform. 
	   
goback.
