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

set output '%NAME%-survey.png'
set term png size 1920, 1080

set key off
set title "Band survey: 0 - 1766 MHz"

set xlabel 'Time'
# Label every 3 Hours
set xtics 3 * hour
set xdata time
set format x "%H:%M\n%d/%m"

set ylabel 'Frequency (Hz)'
# Label every 100 MHz
set ytics 100 * mhz
set format y "%.1s %cHz"

# Set the range from -25dB to 25dB
set cbrange [-25:25]
unset colorbox

plot '%NAME%.csv' using (timecolumn(1)+utc_offset*hour):3:7 with points ps 0.1 pt 5 palette
