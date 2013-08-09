//wijesinghe D.B.
//get points

#include "stdafx.h"
#include "cvaux.h"
#include "highgui.h"
#include "cxcore.h"
#include <stdio.h>
IplImage* img_gray,*img_threshold;
int x = 0 , y = 0 ;
IplImage* img_row;
IplImage* img_edit;
CvScalar red;

void set_point(int val){
	cvReleaseImage(&img_edit);
	img_edit = cvCloneImage(img_row);

	x = cvGetTrackbarPos("x_value","row image");
	y = cvGetTrackbarPos("y_value","row image");

	cvDrawLine(img_edit,cvPoint(x-10,y),cvPoint(x+10,y),red);
	cvDrawLine(img_edit,cvPoint(x,y-10),cvPoint(x,y+10),red);
}
void show_point(){

}

int main(int argc, char argv[]){
	

	cvNamedWindow("row image");
	img_row = cvLoadImage("3.jpg");
	img_edit = cvCloneImage(img_row);

	cvCreateTrackbar("x_value","row image",0,cvGetSize(img_row).width,set_point);
	cvCreateTrackbar("y_value","row image",0,cvGetSize(img_row).height,set_point);
	//cvCreateTrackbar("x_value","row image",0,256,set_point);
	//cvCreateTrackbar("y_value","row image",0,256,set_point);

	red = cvScalar(255);
	
	//show_point();
	while(true){
		cvShowImage("row image",img_edit);
		cvWaitKey(100);
	}

	return 0;
}