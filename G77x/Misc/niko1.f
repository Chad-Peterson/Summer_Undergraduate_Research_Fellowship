      program niko1
	  	implicit double precision (a-h,o-z)
	  		print*,'number of divisions '
	  		read(*,*) division 
	  		print*,'lower limit '
	  		read(*,*) p_lower
	  		print*,'upper limit '
	  		read(*,*) p_upper
			dx=(p_upper-p_lower)/division
			  
		surface=0	  
		
c		10 means do until integer # in next number

	  	do 10 i=1,division
	  	surface=surface+dx*cos(p_lower+dx/2+(i-1)*dx)
	    
c		if line is long add $ to 6th line on next line	
	  
10		enddo

c		this integer in first line ends loop
		
		write(*,*) 'answer =', surface
	  end