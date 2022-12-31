      program cycloid
      implicit none
c------------------------------------------------------------      
      doubleprecision a,ydot,tmp,xdot,t,dy,dt,eps,ur,tmp0,pi,g,
     $c,kb,hbar,kappa,gstar,gf,alpha,hstar,hnf,a0,x,y,dx 
      integer n,i
c------------------------------------------------------------
      a0=10000.0
      n=10
      
      t=0.0
      eps=-1.0
      pi=3.14159
      g=6.672e-11
      c=2.998e8
      dt=a0/c*0.001
      kb=1.381e-23
      hbar=6.626e-34/(2*pi)
      kappa=(8.0*pi*g)/(c**4)
      gstar=28.0+0.875*90.0
      gf=90.0
      alpha=kappa*(hbar*c)**2/32.0
      hstar=pi**2/30.0*gstar*kb**4/(hbar*c)**3
      hnf=1.202/pi**2*(0.75)*gf*kb**3/(hbar*c)**3
      x=0.0
      y=0.001
         
c------------------------------------------------------------
c      print*,'a,dt,n'
c      read(*,*)a,dt,n
c------------------------------------------------------------
      tmp0=(3.0/(kappa*a**2*hstar))**(0.25)
c------------------------------------------------------------
         open(20, file='BlackHoleCycloid.txt',status='old') 
                     
      do 11, i=0,n  
      
      a=a0*dexp(y)
      tmp=tmp0*dexp(x)
       
         t=t+dt*(tmp0/tmp)**0.5
                
      ur=(kappa/3.0)*(hstar*tmp**4-alpha*hnf**2*tmp**6)-1.0/a**2
         
            if(ur.lt.0.0)then
               ur=-ur
               eps=-eps
            endif    
         ydot=eps*c*ur**0.5                  
         dy=ydot*dt*(tmp0/tmp)**0.5     
         y=y+dy
         
         xdot=-ydot   
         dx=xdot*dt*(tmp0/tmp)**0.5     
         x=x+dx                                                                   

         write(*,*) t,'   ',a,'    ',ur,'    ',tmp
         write(20,*)t,'   ',a
11    continue          
         close(20)
      end