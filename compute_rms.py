#! /usr/bin/env python2
# -*- coding: utf-8 -*-
import cv2.cv as cv
import sys
import math

if( len(sys.argv) < 3 ):
    print "Usage: ", sys.argv[0], "image_reference image_1 [image_2...]"
    exit(-1)


img_a = cv.LoadImage(sys.argv[1])
for n in range(2, len(sys.argv)):
    img_b = cv.LoadImage(sys.argv[n])
    rms = 0.
    for i in range(0, img_a.height):
        for j in range(0, img_a.width):
            pixel_a = img_a[i, j]
            pixel_b = img_b[i, j]
            rms += (pixel_a[0] - pixel_b[0])**2 + (pixel_a[1] - pixel_b[1])**2 + (pixel_a[2] - pixel_b[2])**2
            
    rms /= (img_a.height*img_a.width)

    print "File:", sys.argv[n], "-- RMS Error:", math.sqrt(rms)
