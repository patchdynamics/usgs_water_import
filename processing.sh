cut -f 1,2,3,4,5,6,7,8,9,10,15,16,17,18,19,20,21,22 uv.txt > data.tab
cat data.tab |  tr "\\t" "," > data.csv
