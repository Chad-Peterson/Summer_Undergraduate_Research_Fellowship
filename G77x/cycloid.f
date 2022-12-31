      program cycloid
      implicit none
c------------------------------------------------------------      
      real a,t,da,dt,eps,underroot    
      integer loop,i
c------------------------------------------------------------
      t=0.0
      eps=1.0
c------------------------------------------------------------
      print*,'a,dt,loop'
      read(*,*)a,dt,loop
c------------------------------------------------------------
         open(20, file='BlackHoleCycloid.txt',status='old')             
      do 11, i=0,loop   
         t=t+dt*abs(a)        
            underroot = 1.0/a-1.0-0.001/(a**2)
            if(underroot.lt.0.0)then
               underroot=-underroot
               eps=-eps
            endif                 
         da=eps*sqrt(underroot)*dt*abs(a)         
         a=a+da                 
         write(*,*) t,'   ',a,'    ',da
         write(20,*)t,'   ',a
11    continue          
         close(20)
      end