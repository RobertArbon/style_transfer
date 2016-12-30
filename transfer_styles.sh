#!/bin/bash
style=candy_style16_feat16

for (( i = 1000; i <= 40000; i = i + 1000 ))
do
   filepath=rea_models/$style-"$i".t7
   if [ -f "$filepath" ] 
   then
       outpath=rea_images/chicago-$style-"$i".png
       if [ -f "$outpath" ] 
       then
           echo "$outpath exists, skipping"
       else 
           echo "Transferring style from $filepath"
           th fast_neural_style.lua \
              -model $filepath \
              -image_size 768 \
              -median_filter 3 \
              -timing 0 \
              -input_image images/content/chicago.jpg \
              -output_image $outpath \
              -gpu 0 \
              -backend cuda \
              -use_cudnn 1 \
              -cudnn_benchmark 0 
       fi
   else
       echo "Model $filepath doesn't exist"
   fi
done

