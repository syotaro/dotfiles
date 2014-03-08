
perl -nle '$,="\t";$_.=",";s/""/\t/g;print
map{s/^"(.*)"$/$1/g;s/\t/"/g;$_}/("[^"]+"|[^,]+|),/g;' aaa.csv > aaa.tsv
