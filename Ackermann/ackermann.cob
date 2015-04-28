IDENTIFICATION DIVISION.
PROGRAM-ID. func.

DATA DIVISION.

	WORKING-STORAGE SECTION.
	
	01 t pic 9(2).
	01 d pic 9(2) value 2.
	01 c pic 9(2) value 1.
	
	01 arrayS.
        05  s pic 9999 occurs 32765 times.
        
        
	01 tsize pic 9(5) value 32764.
	

    LINKAGE SECTION.
    
    01 m pic 9(1).
    
    01 n pic 9(5).
    
    01 res pic 9(5).


PROCEDURE DIVISION USING m,n,res.

    compute res = 0.
    compute s(1) = m.
    compute s(2) = n.
    compute t = 2.
    
	perform iteration until t = 1.
	stop run.
	
	    iteration.
	    
	    add 1 to c.

	    if s(t - 1) = 0 then
			compute m =  0
			compute t = t - 1
			compute s(t) = s(t-1) + 1
		else
		if s(t) = 0
		    compute n = 0
		    compute s(t) = 1
			compute s(t-1) = s(t-1) - 1
		else 
		    compute s(t+1) = s(t) - 1
			compute s(t) = s(t-1)
			compute s(t-1) = s(t-1) - 1
			compute t = t + 1
		end-if.
		if t > d
		    compute d = t
		    if d > tsize then
		        display 'error, not enough memmory'
		    end-if
		end-if.
	    

		
goback.