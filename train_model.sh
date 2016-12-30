#!/bin/bash
outfile=chicago_default

#date > $outfile.out
th train.lua \
 -task feat \
 -pixel_loss_type L2 \
 -pixel_loss_weight 0.0 \
 -percep_loss_weight 1.0 \
 -tv_strength 1e-6 \
 -content_weights 1.0 \
 -content_layers 16 \
 -loss_network models/vgg16.t7 \
 -style_image images/content/chicago.jpg \
 -style_image_size 256 \
 -style_weights 5.0 \
 -style_layers 4,9,16,23 \
 -style_target_type gram \
 -h5_file images/hd5s/coco2014-all.h5 \
 -num_iterations 10 \
 -max_train 80000 \
 -batch_size 4 \
 -learning_rate 1e-3 \
 -lr_decay_every -1 \
 -lr_decay_factor 0 \
 -weight_decay 0 \
 -checkpoint_name $outfile 

#date >> $outfile.out
