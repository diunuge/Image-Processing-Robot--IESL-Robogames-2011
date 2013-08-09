//wijesinghe D.B.
//threshold value

#include "stdafx.h"
#include "cvaux.h"
#include "highgui.h"
#include "cxcore.h"
#include <stdio.h>
IplImage* img_gray,*img_threshold;

void set_Threshold(int val){
	cvThreshold( img_gray, img_threshold, val, 255, CV_THRESH_BINARY );

	IplImage* image_background = cvLoadImage("threshold image.jpg",CV_LOAD_IMAGE_GRAYSCALE);
	cvThreshold( image_background, image_background, val, 255, CV_THRESH_BINARY_INV );
	cvAdd(img_threshold,image_background,img_threshold);
	cvSmooth( img_threshold,img_threshold,CV_GAUSSIAN,3,3);
	cvThreshold( img_threshold, img_threshold, 100, 255, CV_THRESH_BINARY );
}

int main(int argc, char argv[]){
	cvNamedWindow("Threshold image");
	cvCreateTrackbar("Threshold value","Threshold image",0,255,set_Threshold);

	cvNamedWindow("row image");
	cvNamedWindow("filtered image");
	IplImage* row_img = cvLoadImage("12.jpg");
	cvShowImage("row image",row_img);
	
	img_gray = cvCreateImage(cvGetSize(row_img),8,1);
	img_threshold = cvCreateImage(cvGetSize(row_img),8,1);
	cvCvtColor(row_img,img_gray,CV_RGB2GRAY);
	cvSmooth( img_gray,img_gray,CV_GAUSSIAN,3,3);

	cvSmooth( img_gray,img_gray,CV_GAUSSIAN,5,5);

	
	
	//int i = 0;
	set_Threshold(0);
	while(true){
	
	//printf("i = %d\n",i);
	cvShowImage("filtered image",img_gray);
	cvWaitKey(100);
	cvShowImage("Threshold image",img_threshold);
	}

	//cvWaitKey(0);
	return 0;
}