#!/bin/bash


inc=1000

#outroot=candy_"$inc"
#
#date > $outroot.out 
#th train.lua \
# -h5_file images/hd5s/coco2014-all.h5 \
# -num_iterations $inc \
# -checkpoint_every $inc \
# -checkpoint_name $outroot >> $outroot.out 
#date >> $outroot.out


for (( i = 29000; i <= 40000; i = i + $inc ));
do 

outroot=candy_"$i"
j=`expr $i - $inc`
chkpnt=candy_"$j"
date > $outroot.out 
th train.lua \
 -resume_from_checkpoint $chkpnt.t7 \
 -h5_file images/hd5s/coco2014-all.h5 \
 -num_iterations $inc \
 -checkpoint_every $inc \
 -checkpoint_name $outroot >> $outroot.out 
date >> $outroot.out

done
