### horizontal bar graph
reset session

set title "Option -d1 : Nb routes =f(Driver)"
set xlabel "NB ROUTES"
set ylabel "DRIVER NAMES"
set terminal qt font "Arial,9"
set datafile separator ";"
set yrange [0:*]      # start at zero, find max from the data
set style fill solid  # solid color boxes

myBoxWidth = 0.7
set offsets 0,0,0.5-myBoxWidth/2.,0.5
set term pngcairo size 1000,1000
set output 'images/Option-d1.png'
set yrange [:] reverse
myColor(col) = column(col)<0 ? 0x78e5ae : column(col)==0 ? 0xcccccc : 0x78e5ae


plot 'temp/Option-d1.txt' using (0.5*$2):0:(0.5*$2):(myBoxWidth/2.):(myColor(2)):ytic(1) notitle w boxxy lc rgb var
### end of script