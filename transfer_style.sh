#!/bin/bash

th fast_neural_style.lua \
   -model bacon_style-16-23-30_feat-30-40000.t7 \
   -image_size 768 \
   -median_filter 3 \
   -timing 0 \
   -input_image images/content/rea.jpg \
   -output_image out.png \
   -gpu -1 \
   -backend cuda \
   -use_cudnn 1 \
   -cudnn_benchmark 0 
