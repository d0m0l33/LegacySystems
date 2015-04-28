#!/usr/bin/python

import time

#function that calculates the ackermann value given integers m and n
def iterate(m, n):

	stack = []
   
	stack.append(m)
	
	while stack :
	
		m = stack.pop()
		if m == 0:
			n = n+1
			continue
		elif n == 0:
			n = 1
			stack.append(m-1)
			continue
		else:
			n = n - 1
			stack.append(m-1)
			stack.append(m)
			continue
	return n
	
quit = 1;
	
print "Welcome to Ackermann value calculator"

while quit == 1:
			
	m = input('Enter first integer (m) : ')
	n = input('Enter second integer (n) : ')
		
	startTime = time.clock()
	
	print "ackermann vaue : " , iterate(m,n)
	
	elapsedTime = (time.clock() - startTime) * 1000
	
	print "process time elapsed  : ",elapsedTime, "milli seconds"
	
	quit = input('Choose 1 to continue, 0 to exit :')
	
print "exiting .."
	
	
	
