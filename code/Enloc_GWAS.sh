#! /bin/bash

zless $1 | awk '{print $1}' | awk -F: '{print "chr"$1":"$2}' > ~/tmp/tmp1.zscore.gz

zless $1 | awk '{print "Loc"$2"\t"$3}' > ~/tmp/tmp2.zscore.gz

paste ~/tmp/tmp1.zscore.gz ~/tmp/tmp2.zscore.gz | column -s '\t' -t > $2

gzip -f $2

rm ~/tmp/tmp1.zscore.gz ; rm ~/tmp/tmp2.zscore.gz

