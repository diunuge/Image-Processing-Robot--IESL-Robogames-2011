#include "stdafx.h"
#include "cvaux.h"
#include "highgui.h"
#include "cxcore.h"
#include <stdio.h>


#define IN_RANG_FILTER

void in_rang_filter();
void Allocate_imgs();


IplImage *img = NULL,*test,*imgHsv,*imgResult;
int mR_val=19,mG_val=13,mB_val=18,MAR_val=154,MAG_val=256,MAB_val=79;//default green .ctrl BLUE to find color


void set_RGB(int pos)
{
	#ifdef IN_RANG_FILTER
	in_rang_filter();
	#endif
}


int main(int argc, char** argv)
{

	CvSeq* find_contour = NULL;
	bool isStop = false;
	img = cvLoadImage("test.jpg");
	if(img == NULL)
	{
		printf("capture device not found!!");
		return -1;
	}


	Allocate_imgs();

	// creat windows
	cvNamedWindow("Capture", CV_WINDOW_AUTOSIZE);
	cvNamedWindow("Result", CV_WINDOW_AUTOSIZE);


	//To in_rang_filter() MIN , MAX RGB value set
	cvCreateTrackbar( "minR","Result",&mR_val, 256,set_RGB);
	cvCreateTrackbar( "minG","Result",&mG_val, 256,set_RGB);
	cvCreateTrackbar( "minB","Result",&mB_val, 256,set_RGB);

	cvCreateTrackbar( "maxR","Result",&MAR_val, 256,set_RGB);
	cvCreateTrackbar( "maxG","Result",&MAG_val, 256,set_RGB);
	cvCreateTrackbar( "maxB","Result",&MAB_val, 256,set_RGB);
	//


	cvCvtColor( img, imgHsv, CV_BGR2HSV);//convert the color space
	in_rang_filter();


	cvShowImage("Capture", img);
	cvShowImage("Result", test);
	cvWaitKey(0);
	cvReleaseImage(&imgResult);
	cvReleaseImage(&imgHsv);
	cvDestroyAllWindows();

}


void in_rang_filter()
{
	IplImage* test=cvCreateImage(cvGetSize(img), IPL_DEPTH_8U, 3);
	CvScalar min_color = CV_RGB(mR_val,mG_val,mB_val);
	CvScalar max_color = CV_RGB(MAR_val,MAG_val,MAB_val);
	cvInRangeS(imgHsv, min_color,max_color, imgResult);//search for the color in image

	cvCvtColor( imgResult, test,CV_GRAY2RGB);
	cvShowImage("Result", test);
	cvReleaseImage(&test);
}

void Allocate_imgs()
{
	const int w = img->width;
	const int h = img->height;
	imgResult = cvCreateImage(cvSize(w, h), IPL_DEPTH_8U,1);
	imgHsv=cvCreateImage(cvSize(w, h), IPL_DEPTH_8U, 3);
}
