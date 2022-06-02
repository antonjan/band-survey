# Source: http://superkuh.com/rtlsdr.html#keenerdappnote

# rtl_power output format
# 2013-08-19, 20:53:16, 55000000, 57000000, 1000000, 4096, -29.60, -29.60,

# An hour is 3600 seconds
hour = 3600

# The time on the PI is set to UTC+1 and we're UTC+8
utc_offset = 7

# MHz is 1000000 Hz
mhz = 1000000

set timefmt '%Y-%m-%d, %H:%M:%S'
set view map

# Load a color palette
load 'default.plt'

set output '%NAME%-waterfall.png'
set term png size 1920, 1080

set key off
set title "Band survey: 0 - 1766 MHz"

set xlabel 'Frequency (Hz)'
# Label every 100 MHz
set xtics 100 * mhz
set format x "%.1s %cHz"

set ylabel 'Time'
# Label every 3 Hours
set ytics 3 * hour
set ydata time
set format y "%d/%m %H:%M"
# Show time backwards
set yrange [*:*] reverse

set cbrange [-25:25]
unset colorbox

plot '%NAME%.csv' using 3:(timecolumn(1)+utc_offset*hour):7 with points ps 0.1 pt 5 palette
