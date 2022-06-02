#!/bin/bash

# There is no checking to see if this file exists
#output=$(date --utc --rfc-3339=sec | cut -d+ -f1 | tr -dc '[:digit:]').csv
output =date +"%d-%m-%Y".csv
# Log 0 - 1766 MHz at 1MHz interval every minute for 240 hours
#rtl_power -f 144M:146M:1K -i 1m -g 50 -1 >> "${output}.csv"
rtl_power -d0 -f 144M:146M:10K -1 -g 50 >> "vhf_monitoring_`date '+%d-%m-%Y'`.csv"
# There is an assumption that the datafile ends in ".csv"
name=$output

# gnuplot doesn't do parameters very well, but we can dynamcally insert them
for plot in *.plot ; do
	sed "s|%NAME%|${name}|g" "${plot}" | gnuplot
done

