#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#DOCUMENT:      GnuPlot.com
#REV:           0 
#DATE:          31/01/2015
#DEPENDENCIES:  data.dat
#ORIGINATOR:    Joseph Kolibal
#USAGE:         gnuplot < GnuPlot.com
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#SETUP AXIS LABELS.
#set title "Plot Function" 0.0,0.5
#set xlabel "x" 
#set ylabel "f(x)" 0.0,0
#set noclabel
#set noborder
# THE COMMAND noxzeroaxis AND noyzeroaxis TURNS OF AXES IN A PLOT.
#set noxzeroaxis
#set noyzeroaxis
#set nolog
#set nolabel
#
#SETUP THE PLOT SIZE.
set size 1.1, 1.0
#set function style lines 
#
#
#SETUP THE TERMINAL AND ORIENTATION.
set terminal pdf  color solid enhanced font "Helvetica, 10"

#
#SETUP THE FILENAME.
set output 'integral.pdf'
# THE COMMAND notitle AFTER THE FILENAME TURNS OFF THE LEGEND.
# THE SAMPLES COMMAND SETS THE NUMBER OF POINTS USED TO DRAW A LINE. YOU NEED
set samples 5000
#
# CONSTRUCT THE PLOT USING LOG SCALE
set logscale x
set logscale y2
# THE PLOT SETTING LINE TYPE AND WIDTH AND MARKERS
set key right top
#set key 100 100
set key spacing 1.8
set format y2 "10^{%L}"
set format x "%2.0t{/Symbol \327}10^{%L}"
#set format x "%2.0t{x}10^{%L}"
#set format x "%2.0t{x}10^{%L}"
#set format y  "%2.0t{x}10^{%L}"
set format y  "%4.2f"
set rmargin 15
set lmargin 12
# OPTIONS FOR TIC MARKS
set ytics out
set y2tics out
set my2tics 10
set xtics (2,10,100,1000,10000,100000,1000000,10000000,100000000)
#set xtics 10
#set xtics 100,200
#set mxtics 10
set ytics nomirror
set y2tics
plot 'data.dat' using 1:2 with lines linecolor rgb "#1919AA" lw 2 title "(left y-axis)", '' using 1:3 with lines linecolor rgb "#9ACD32" lw 2 axes x1y2 title "(right y-axis)", 0.7468241328 w l linecolor rgb "#FF8888" title "Exact"


# CLEAN UP:
#
set nolog
set auto
#set title "" 0,0
#set xlabel "" 0,0
#set ylabel "" 0,0
#set zlabel "" 0,0
#
#
#
#
#
#
 

