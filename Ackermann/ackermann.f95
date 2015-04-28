program ackermann

   integer :: recursion
   integer :: first,second !integers(m,n) entered by user
   integer :: res !computed ackermann value
   integer :: option
   integer :: quit
   real :: startTime, finishTime
   
   quit = 1;
   
   write(*,*) 'Welcome to Ackermann value calculator'
   
   do while(quit == 1)
   
   write(*,*) 'enter first integer (m)'
   read (*,*)first
   write(*,*) 'enter second integer (n)'
   read (*,*)second
   write(*,*) 'Enter 1 to user recursion, 2 to use iteration with loops'
   read (*,*) option
   
   if(option == 1) then
       write(*,*) 'Recursion '
       call cpu_time(startTime)
       res = recursion(first, second)
       call cpu_time(finishTime)
       write(*,*) 'ackermann value : ', res
       print '("Time = ",f6.3," milli seconds.")',(finishTime-startTime) * 1000
    end if
    if(option == 2) then
        write(*,*) 'Iteration '
       call cpu_time(startTime)
       res = loops(first, second)
       call cpu_time(finishTime)
       write(*,*) 'ackermann value : ', res
       print '("Time = ",f6.3," milli seconds.")',(finishTime-startTime) * 1000
    end if
    
    write(*,*) 'Choose 1 to continue, 0 to exit'
    read(*,*)quit
    
    end do
    
    write(*,*) 'Exiting .. '

        
end program ackermann



recursive function recursion(m, n) result(result)
 
   integer :: m,n,result

   
   if (m == 0) then
     result = n+1
   else if (n == 0) then
     result = recursion(m-1,1)
   else
     result = recursion(m-1, recursion(m, n-1))
   end if
   
end function recursion


! non recurvive computation of ackermann value
function loops(m,n) result(result)

    integer :: result
    integer :: t,d
    integer :: tsize
    integer :: stack(70001)
    
    tsize = 70000 !stack size/limit
    
    c = 1
    d = 2
    
    stack(1) = m
    stack(2) = n
    
    t = 2
    
    do while(t .NE. 1) !do while stack not empty
        
        if(stack(t-1) == 0 ) then
            m =  0
            t = t-1
            stack(t) = stack(t+1) + 1
        else if(stack(t) == 0) then
            n = 0
            stack(t) = 1
            stack(t-1) = stack(t-1) - 1
        else
            stack(t+1) = stack(t) - 1
            stack(t) = stack(t-1)
            stack(t-1) = stack(t-1) - 1
            t = t + 1
        end if
        if(t>d) then
            d = t
            if(d  > tsize) then
                write(*,*) "failure, not enough memory"
            end if
        end if
        
    end do
        
    result = stack(1)
    
    
end function loops
