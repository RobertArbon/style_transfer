#!/bin/bash
outfile=candy_default
date > $outfile.out
th train.lua \
 -h5_file images/hd5s/coco2014-all.h5 \
 -num_iterations 40000 \
 -max_train 80000 \
 -batch_size 4 \
 -learning_rate 1e-3 \
 -lr_decay_every -1 \
 -lr_decay_factor 0 \
 -weight_decay 0 \
 -checkpoint_name $outfile >> $outfile.out 

date >> $outfile.out
