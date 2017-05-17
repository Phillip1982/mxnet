#!/usr/bin/env bash

LOG=proposal_2017.log

rm -rf ${LOG}

export MXNET_CUDNN_AUTOTUNE_DEFAULT=0
export PYTHONUNBUFFERED=1

nohup python -m rcnn.tools.proposal --network resnet                        \
                                  --dataset imagenet_loc_val_2017           \
                                  --image_set val                           \
                                  --root_path /disk2/data/imagenet_loc_2017 \
                                  --dataset_path ILSVRC                     \
                                  --prefix model/imagenet_loc_2017          \
                                  --gpu 3                                   \
                                  --epoch 2                                 \
                                  >${LOG} 2>&1 &
