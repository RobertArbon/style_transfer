#!/bin/bash
outfile=bacon_style-16-23-30_feat-30

date > $outfile.out
th train.lua \
 -pixel_loss_type L2 \
 -pixel_loss_weight 0.0 \
 -percep_loss_weight 1.0 \
 -tv_strength 1e-6 \
 -content_weights 1.0 \
 -content_layers 30 \
 -loss_network models/vgg16.t7 \
 -style_image images/styles/bacon_leris.jpg \
 -style_image_size 256 \
 -style_weights 5.0 \
 -style_layers 16,23,30 \
 -style_target_type gram \
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
