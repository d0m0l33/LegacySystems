all :roman func

roman : roman.cob
	cobc -x -free -Wall roman.cob

func : func.cob
	cobc -m -free -Wall func.cob
	
clean :
	rm -f *.o roman
