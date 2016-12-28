#!/bin/bash

infile=$1

outfile=${infile/.out}_val.out
echo 'iter loss' > $outfile
awk 'BEGIN{i = 1000;} { if ( $1 ~ "val" ) {print i, $4; i = i + 1000}}' $infile >> $outfile
 
outfile=${infile/.out}_train.out
echo 'iter loss' > $outfile
awk '{ if ( $1 == "Epoch" && $4 % 1000 == 0 ) print $4, $9}' $infile >> $outfile

outfile=${infile/.out}_train_all.out
echo 'iter loss' > $outfile
awk '{ if ( $1 == "Epoch" ) print $4, $9}' $infile >> $outfile
