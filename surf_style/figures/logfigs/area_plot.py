from pylab import *
from matplotlib import rc, rcParams, pyplot

rc('text',usetex=True)
#rc('font',**{'family':'serif','serif':['Computer Modern']})


#  Import the data from a text file and save as a 2D matrix.
dataMatrix1 = genfromtxt('data.dat')

# Slice out required abscissae and ordinate vectors.

x = dataMatrix1[:,0]
y1 = dataMatrix1[:,1]
#y2 = dataMatrix1[:,2]
pyplot.xscale('log')

plot(x,y1,label=r'area')
#plot(x,y2,label=r'error')

legend(loc='upper right')

xlabel(r'$N$',fontsize=16)
plt.ylabel(r'$I(N)$',fontsize=16)

show()
