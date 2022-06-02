#!/bin/bash

# There is no checking to see if this file exists
#20220602072329.csv-survey.png
#20220602072329.csv-waterfall.png
output=$(date --utc --rfc-3339=sec | cut -d+ -f1 | tr -dc '[:digit:]').csv-survey.png
output2=$(date --utc --rfc-3339=sec | cut -d+ -f1 | tr -dc '[:digit:]').csv-waterfall.png
sudo cp $output  /var/www/html/plot/
sudo cp $output2 /var/www/html/plot/
echo "copy " $output 
echo "copy " $output2

