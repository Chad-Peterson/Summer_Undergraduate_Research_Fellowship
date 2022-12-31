      program universe
      implicit double precision (a-h,o-z)

c.....Parameters
c.....R - scale factor, T - temperature

      common /paramet/ pc,ph,phbar,pG,pkappa,pk,palpha,pbeta,
     $ R0,pgb,pgf,phes,phns,Teq,pdeltat0,plambda

      character(len=20) doc

      pi = 4.d0*datan(1.d0)

      pc = 2.998d8
      ph = 6.626d-34
      phbar = ph/(2.0*pi)
      pG = 6.674d-11
      pkappa = 8.0*pi*pG/pc**4
      palpha = pkappa*(phbar*pc)**2/32.0
      pk = 1.381d-23

      phes = pi**2/30.0*pk**4/(phbar*pc)**3
      phns = 1.202/pi**2*pk**3/(phbar*pc)**3
      pgb = 28.0
      pgf = 90.0
      pg1 = 9.0
      phe = (pgb+(7.0/8.0)*pgf)*phes
      phn = (pgb+(3.0/4.0)*pgf)*phns
      pheb = pgb*phes
      phnb = pgb*phns
      phn1 = pg1*phns
      phef = (7.0/8.0)*pgf*phes
      phnf = (3.0/4.0)*pgf*phns
      Teq = 8816.0
      plambda = 5.24d-10

      R0 = 1.0d4
      T0 = (3.0/pkappa/phe/R0**2)**0.25
      Tcr = (phe/palpha/phnf**2)**0.5
      pdeltat0 = R0/pc*0.01


      time = 0.0
      x = 0.0
      y = 0.001
      peps = -1.0

c     x=ln(T), y=ln(R)

      write(*,*)
      write(*,*) 't - time, R - scale factor, T - temperature'
      write(*,*) 'Initial conditions'
      write(*,*) time,R0,T0
      open (unit=1,file='BlackHoleCycloid.dat',status='old')
      write(*,*) 'Critical coefficient'
      write(*,*) (6.0**0.5/32.0*phn1*phnf**3*(phbar*pc)**3
     $ /phe**3)**(-1)
c.....Loop
      
      print*,'partical production rate'
      read(*,*)pbeta


      k = 0
      do 11 i=1,30000
         T = T0*dexp(x)
         R = R0*dexp(y)

         pnf = phnf*T**3
         pe = phe*T**4
         pp = pe/3.0
         pet = pe-palpha*pnf**2
         ppt = pp-palpha*pnf**2

         under = pkappa/3.0*(pet+plambda)-1.0/R**2
         if (under .le. 0.0) then
            if (peps .le. 0.0) then
               k = k+1
               write(*,*)
               write(*,*) 'Bounce ',k
            endif
            
            write(*,202) time,R,T
            under = -under
            peps = -peps
            page = time
         endif    

         ydot = sqrt(under)*peps*pc
                 
            yy = pc/pbeta/3.0/phn1/T**3*(pkappa*pet)**2
            xdot = yy-ydot
                                                 
         pdeltat = pdeltat0*T0**2/T**2
         time = time + pdeltat
         x = x+xdot*pdeltat
         y = y+ydot*pdeltat
         
         write(*,*) time,'   ',R            
         write(1,*) time,'   ',R
11    enddo

      close (1)

201   format(2x,1i6,2x,d12.6,2x,d12.6)
202   format(2x,' t=',d12.6,'s',2x,' R=',d12.6,'m',2x,
     $       ' T=',d12.6,'K')


      stop
      end