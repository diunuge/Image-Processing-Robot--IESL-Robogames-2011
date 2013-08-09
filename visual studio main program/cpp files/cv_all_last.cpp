	//Wijesinghe D.B.
//IESL Robot Competition 2011
#include "stdafx.h"
#include "comport.h"
#include "status.h"


#include "cv.h"
#include "highgui.h"
#include "math.h"
#include <iostream>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <conio.h>
IplImage* g_img_row;
//void set_command();

CvPoint g_ball_centroid,g_ball_head,g_green_triangle_centroid,g_green_triangle_head,g_blue_triangle_centroid,g_blue_triangle_head;
CvSeq* g_ball_countour,g_green_triangle_countour,g_blue_triangle_countour;

CvPoint centroid(CvSeq* contour);
double distance(CvPoint* p1,CvPoint p2);
CvPoint getTriangleHead(CvSeq* contour, CvPoint centroid);
void update_contours(IplImage* img_row);
bool isDerectedToPoint(CvPoint point);
void turnToPoint(CvPoint point);
bool isCloseToPoint(CvPoint point1,CvPoint point2);

void set_com();
void set_command();

int _tmain(int argc, _TCHAR* argv[])
{
	initialize();
	showInitialStatus();
	initialize_connection();
	cvNamedWindow( "Contours 2", 1 );
	//cvNamedWindow( "Threshold" );

	CvCapture* capture = cvCaptureFromFile("sample2.avi");

	g_img_row = cvQueryFrame(capture);

	//IplImage* img_row = cvLoadImage( "3.jpg" );        //IplImage* cvLoadImage(const char* filename,int iscolor=CV LOAD IMAGE COLOR );    CV_LOAD_IMAGE_GRAYSCALE ,	CV_LOAD_IMAGE_UNCHANGED	
	

	while(true){
		g_img_row = cvQueryFrame(capture);
		update_contours(g_img_row);
		statusUpdate();
		//set_com();
		set_command();
		cvWaitKey(30);   // c = cvWaitKey(0);  if(c==10) break;
	}

	printf( "Finished all contours.\n");

	cvDestroyWindow( "Contours 2" );


	return 0;
}


void update_contours(IplImage* img_row){

		IplImage* img_8uc1 = cvCreateImage( cvGetSize(img_row), 8, 1 );
		IplImage* img_edge = cvCreateImage( cvGetSize(img_row), 8, 1 );
		IplImage* img_8uc3 = cvCreateImage( cvGetSize(img_row), 8, 3 );

		cvCvtColor(img_row , img_8uc1 , CV_RGB2GRAY );

		cvSmooth( img_8uc1,img_8uc1,CV_GAUSSIAN,3,3);
		cvSmooth( img_8uc1,img_8uc1,CV_GAUSSIAN,5,5);
		cvThreshold( img_8uc1, img_edge, 105, 255, CV_THRESH_BINARY );  
		//double cvThreshold(const CvArr* src,CvArr* dst,double threshold,double maxValue,int thresholdType );      CV_THRESH_BINARY_INV , CV_THRESH_TRUNC , CV_THRESH_TOZERO , CV_THRESH_TOZERO_INV ,  **  CV_THRESH_OTSU
																													// see openCV manual
		//cvShowImage("Threhold",img_edge);

		IplImage* image_background = cvLoadImage("threshold image.jpg",CV_LOAD_IMAGE_GRAYSCALE);
		cvThreshold( image_background, image_background, 100, 255, CV_THRESH_BINARY_INV );
		cvAdd(img_edge,image_background,img_edge);
		cvSmooth( img_edge,img_edge,CV_GAUSSIAN,3,3);
		cvThreshold( img_edge, img_edge, 105, 255, CV_THRESH_BINARY ); 

		//cvShowImage("Threhold",img_edge);
		IplImage* as = cvCloneImage(img_edge);
		IplImage* asd = cvCreateImage(cvGetSize(as),8,3);
		cvCvtColor(as,asd,CV_GRAY2BGR);
		cvDrawRect(asd,cvPoint(25,50),cvPoint(705,520),cvScalar(255),2);
		cvDrawLine(asd,cvPoint(25,200),cvPoint(25,400),cvScalar(0,255),5);
		cvDrawLine(asd,cvPoint(705,185),cvPoint(705,385),cvScalar(0,255),5);

		
	
		CvMemStorage* storage = cvCreateMemStorage();
		CvSeq* first_contour = NULL;

		int Nc = cvFindContours(
			img_edge,             //CvArr* image,                      ;8-bit single channel    from "cvThreshold" , "cvAdaptiveThreshold"  or  " cvCanny"
			storage,              //CvMemStorage* storage,             ;Container of the retrieved contours
			&first_contour,       //CvSeq** first contour,             ;Output parameter, will contain the pointer to the first outer contour
			sizeof(CvContour),    //int header_size=sizeof(CvContour), ;Size of the sequence header,  sizeof(CvChain) if method = CV CHAIN CODE,and  sizeof(CvContour) otherwise
			CV_RETR_LIST );       //int mode=CV_RETR_LIST,             ;Retrieval mode      CV_RETR_EXTERNAL , CV_RETR_LIST , CV_RETR_CCOMP , CV_RETR_TREE
								  //int method=CV_CHAIN_APPROX_SIMPLE, ;Approximation method   CV_CHAIN_CODE , CV_CHAIN_APPROX_NONE , CV_CHAIN_APPROX_SIMPLE , CV_CHAIN_APPROX_TC89_L1 or CV_CHAIN_APPROX_TC89_KCOS , CV_LINK_RUNS
								  //CvPoint offset=cvPoint(0,0) );     ;Offset, by which every contour point is shifted. This is useful if the contours are extracted from the image ROI and then they should be analyzed in the whole image context

		//printf( "Total Contours Detected: %d\n", Nc );
		CvScalar red = CV_RGB(250,0,0);
		CvScalar blue = CV_RGB(0,0,250);
		cvRectangle(img_8uc3,cvPoint(25,60),cvPoint(702,528),CV_RGB(0,255,0));
	
		CvSeq* c=first_contour;
		//CvSeq* test;
		cvCvtColor( img_8uc1, img_8uc3, CV_GRAY2BGR );
		for( CvSeq* c=first_contour; c!=NULL; c=c->h_next )
		{
			//CvPoint* head,centro_temp;
			CvSeq* test = cvApproxPoly(c,sizeof(CvContour),storage,CV_POLY_APPROX_DP,cvContourPerimeter(c)*0.05,0);
			
			if( 20 <cvContourArea(c) &&  cvContourArea(c) < 200.0 ){  //ball
				g_ball_countour = c;

				printf("\ncounter points %d",test->total);

				updateBallPotition(centroid(c));
				updateBallEquation();

				cvDrawContours(img_8uc3, c, red, blue, 0, 2, 8 );  
			}

			else if( test ->total == 3 ){    // triangle
				CvPoint triangle_centroid = centroid(c);
				if(triangle_centroid.x < 360){
					/*
					for( int i=0; i < c->total; ++i ){
						CvPoint* p = CV_GET_SEQ_ELEM( CvPoint, c, i );
						printf(" (%d,%d)\n", p->x, p->y );
					}*/
					
					CvPoint* p[3];

					for( int i=0; i < 3; ++i ){
						p[i] = CV_GET_SEQ_ELEM( CvPoint, test, i );
					}
					//printf("(%d,%d) , (%d,%d) , (%d,%d)",p[0]->x,p[0]->y,p[1]->x,p[1]->y,p[2]->x,p[2]->y);
					
					//diuShowPoint(cvPoint2DiuPoint(*p[0]));
					//diuShowPoint(cvPoint2DiuPoint(*p[1]));
					//diuShowPoint(cvPoint2DiuPoint(*p[2]));

					updateRobotPotition(0,*p[0],*p[1],*p[2]);
					updateRobotEquation(0);

					diuShowTriangle(g_robotPosition[0][0]);

					g_green_triangle_centroid = triangle_centroid;
					cvDrawContours(img_8uc3, c, red, blue, 0, 2, 8 ); 
					g_green_triangle_head = getTriangleHead(c,g_green_triangle_centroid);
				}
				else
				{
					
					CvPoint* p[3];

					for( int i=0; i < 3; ++i ){
						p[i] = CV_GET_SEQ_ELEM( CvPoint, test, i );
					}
					
					updateRobotPotition(1,*p[0],*p[1],*p[2]);
					updateRobotEquation(1);

					diuShowTriangle(g_robotPosition[1][0]);
					
					g_blue_triangle_centroid = triangle_centroid;cvDrawContours(img_8uc3, c, red, blue, 0, 2, 8 );  
					g_blue_triangle_head = getTriangleHead(c,g_blue_triangle_centroid);
				}
			}
		}
		cvCircle(img_8uc3,g_ball_centroid,10,cvScalar(255));
		cvCircle(img_8uc3,g_blue_triangle_centroid,10,cvScalar(0,255));
		cvCircle(img_8uc3,g_green_triangle_centroid,10,cvScalar(255));

		cvShowImage( "Contours 2", img_8uc3 );
		cvShowImage("Threhold",asd);
		cvReleaseImage(&img_8uc1);
		cvReleaseImage(&img_edge);
		cvReleaseImage(&img_8uc3);
}

CvPoint getTriangleHead(CvSeq* contour, CvPoint centroid){
	double max_distance = 0;
	CvPoint* temp, head;
	for( int i=0; i < contour->total; ++i ){                             //find the point which have maximun distance to centroid
				CvPoint* temp = CV_GET_SEQ_ELEM( CvPoint, contour, i );
				if(distance(temp,centroid) >max_distance){
					head.x = temp ->x;
					head.y = temp ->y;
				}
			}
	return head;
}

double distance(CvPoint* p1,CvPoint p2){
	return sqrt((double)(square(p1->x - p2.x) + square(p1->y - p2.y)));
}

CvPoint centroid(CvSeq* contour) {
	CvPoint pt, prev_pt, centroid = {0,0};
	CvSeqReader reader;

	cvStartReadSeq( contour, &reader, 0 );

	int count = contour->total;
	count -= !CV_IS_SEQ_CLOSED(contour);

	CV_READ_SEQ_ELEM( prev_pt, reader );
	int area=0;
	for( int i = 0; i < count; ++i ) {
	CV_READ_SEQ_ELEM( pt, reader );

	int moment = prev_pt.x * pt.y - pt.x * prev_pt.y;

	area += moment;
	centroid.x += (pt.x + prev_pt.x) * moment;
	centroid.y += (pt.y + prev_pt.y) * moment;
	prev_pt = pt;
	}

	area *= 0.5;
	centroid.x /= 6.0 * area;
	centroid.y /= 6.0 * area;

	return centroid;
}
 void set_com(){
	 send_command('A');
 }

void set_command(){

	if(g_attackTurn){							// attack turn
		
		if(g_isHaveBall){							//have ball

			if(g_isSetSootPosition){					//set shoot potition
				//shoot
				g_command = SHOOT;
				g_isHaveBall = false;
				g_attackTurn = false;
				g_isSetSootPosition = false;
				g_isDerectedToBall = false;
			}
			else{
				//go to shoot position
				if(isDerectedToPoint(g_shootPoint)){
					//go to point
					g_command = GO_45;
				}
				else{
					//turn to shoot point
					turnToPoint(g_shootPoint);
				}
			}
		}
		else{										//do not have ball                 
			g_isDerectedToBall = isDerectedToPoint(g_ballPosition[0]);
			if(g_isDerectedToBall){
				//go to ball
				g_command = GO_45;
			}
			else{
				//turn to ball
				turnToPoint(g_ballPosition[0]);
				//scanf("%c");
				//printf("hi!");
			}
		}
		send_command(g_command);
	}
	else{										// defence turn

		send_command(g_command);
	}
	send_command(g_command);
}


bool isDerectedToPoint(CvPoint point){
	DiuPoint middlePoint = g_robotPosition[DIU_MY_ROBOT][0].middlePoint;
	DiuPoint mainPoint = g_robotPosition[DIU_MY_ROBOT][0].point[g_robotPosition[DIU_MY_ROBOT][0].mainPoint];
	DiuPoint thePoint = cvPoint2DiuPoint(point);

	if( ( diuDistance2Points(middlePoint,mainPoint) + diuDistance2Points(mainPoint,thePoint) )/ diuDistance2Points(middlePoint,thePoint) < 1.2 )
		return true;

	else
		return false;
}

void turnToPoint(CvPoint point){
	g_command = SERVO_TURN_CLOCKWISE;
	send_command(g_command);
}

bool isCloseToPoint(CvPoint point1,CvPoint point2){
	double distance = diuDistance2Points(cvPoint2DiuPoint(point1),cvPoint2DiuPoint(point2));
	if( distance < 15 )
		return true;
	else 
		return false;
}
//use multi theard for this
/*
void set_command(){
	if(attackTurn){                                               // attack turn
		goToBall();

		g_command = receive_command();
		while(!g_command)                                        // wait until robot have the ball
			g_command = receive_command();

		goShootPosition();

		shoot();

		attackTurn = false;

		goToDefence();
	}
	else{                                                         // defence turn

		while(!g_IsBallMoving){                                    //wait until shoot

			goToDefencePoint();
		}
		goToDefencePoint();

		goTowardBall();
	}
}
*/