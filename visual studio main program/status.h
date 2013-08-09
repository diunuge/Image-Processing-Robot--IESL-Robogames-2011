//wijesinghe D.B.
//status variables for IESL robot

#define DIU_FIRST_HALF   0
#define DIU_SECOND_HALF  1

#define DIU_MY_ROBOT 0
#define DIU_COUNTER_ROBOT 1

#include <iostream>
#include "connector.h"
#include "commands.h"
#include "cxcore.h"
#include "stdlib.h"

using namespace std;

CvPoint g_Coners[4];
CvPoint g_middlePoints[2];
CvPoint g_gallCordinates[2][2];

CvPoint g_shootPoint;

int g_mySide;

bool g_IsRobotMoving[2];
bool g_IsBallMoving;

DiuTriangle g_robotPosition[2][20];
CvPoint g_ballPosition[20];

DiuStraightLine g_lineOfBall;
DiuStraightLine g_lineOfRobot[2];

char g_command;
char g_recieveCommand;
char g_lastCommand;
//bool g_isCommandCompleted;

bool g_attackTurn;

bool g_isHaveBall;
bool g_isSetSootPosition;
bool g_isDerectedToBall;



void initialize(){
	cout<<"Initializing Starting.....\n";
	
	g_Coners[0].x =  17;	g_Coners[0].y=  68;
	g_Coners[1].x =  37;	g_Coners[1].y= 527;
	g_Coners[2].x = 702;	g_Coners[2].y= 521;
	g_Coners[3].x = 701;	g_Coners[3].y=  44;
	
	g_middlePoints[0].x = 350;     g_middlePoints[0].y =  40;
	g_middlePoints[1].x = 362;     g_middlePoints[1].y = 530;

	g_gallCordinates[0][0].x =   0;    g_gallCordinates[0][0].y =   0;
	g_gallCordinates[0][1].x =   0;    g_gallCordinates[0][1].y =   0;
	g_gallCordinates[1][0].x =   0;    g_gallCordinates[1][0].y =   0;
	g_gallCordinates[1][1].x =   0;    g_gallCordinates[1][1].y =   0;

	g_shootPoint.x = 0;     g_shootPoint.y = 0;

	#define DIU_MY_ROBOT 1
	#define DIU_COUNTER_ROBOT 0
	g_mySide = 1;

	g_command = NULL;
	g_recieveCommand = NULL;
	g_lastCommand = NULL;

	g_IsRobotMoving[0] = false;     g_IsRobotMoving[1] = false;
	g_IsBallMoving = false;

	g_attackTurn = true;

	g_isHaveBall = false;
	g_isSetSootPosition = false;
	g_isDerectedToBall = false;

	cout<<"Initializing done.....\n";
}

void statusUpdate(){

	g_recieveCommand = receive_command();
	if(g_recieveCommand == 'h'){
		g_isHaveBall = true;
		g_recieveCommand = NULL;
	}
	g_lastCommand = g_command;
	g_command = NULL;

	for(int i=0; i<2; i++){
		if(diuDistance2Points(g_robotPosition[i][0].middlePoint,g_robotPosition[i][1].middlePoint) < 2.0)
			g_IsRobotMoving[i] = false;

		else
			g_IsRobotMoving[i] = true;
	}

	if(diuDistance2Points(cvPoint2DiuPoint(g_ballPosition[0]),cvPoint2DiuPoint(g_ballPosition[1])) < 2.0)
			g_IsBallMoving = false;

		else
			g_IsBallMoving = true;

	g_lineOfBall = diuGetLine(cvPoint2DiuPoint(g_ballPosition[0]),cvPoint2DiuPoint(g_ballPosition[4]));
	for(int i=0; i<2; i++)
		g_lineOfRobot[i] = diuGetLine( g_robotPosition[i][0].middlePoint , g_robotPosition[i][4].middlePoint );

	if(g_mySide == 0){
		int avarageCoordinateX = 0;
		for(int i=0; i<20; i++){
			avarageCoordinateX += g_middlePoints[i].x;
		}
		avarageCoordinateX /=20;

		if(avarageCoordinateX < ( g_middlePoints[0].x + g_middlePoints[1].x - 20)/2 )
			g_attackTurn = true;
		else
			g_attackTurn = false;
	}
	else if(g_mySide == 1 ){
		int avarageCoordinateX = 0;
		for(int i=0; i<20; i++){
			avarageCoordinateX += g_middlePoints[i].x;
		}
		avarageCoordinateX /=20;

		if(avarageCoordinateX > ( g_middlePoints[0].x + g_middlePoints[1].x +20 )/2 )
			g_attackTurn = true;
		else
			g_attackTurn = false;
	}
	g_attackTurn = true;


}

void showInitialStatus(){
	cout<<"\n*********************    status        ************************\n\n";

	printf("Coners:\t");
	for(int i=0; i<4; i++)
		printf("(%3d,%3d)\t",g_Coners[i].x,g_Coners[i].y);
	cout<<"\n\n";

	cout<<"Middle Points:\t";
	for(int i=0; i<2; i++)
		printf("(%3d,%3d)\t",g_middlePoints[i].x,g_middlePoints[i].y);
	cout<<"\n\n";

	for(int i=0; i<2; i++){
		cout<<"goal "<<i<<":\t";
		for(int j=0; j<2; j++)
			printf("(%3d,%3d)\t",g_gallCordinates[i][j].x,g_gallCordinates[i][j].y);
		cout<<"\n";
	}
	cout<<"\n";

	cout<<"#define DIU_MY_ROBOT "<<DIU_MY_ROBOT;
	cout<<"\n\n";
	cout<<"*************************************************************\n\n";
}

void updateRobotPotition(int robot,CvPoint point1,CvPoint point2,CvPoint point3){

	for(int i=9; i>0; i--){
		g_robotPosition[robot][i] = g_robotPosition[robot][i-1];
	}
	g_robotPosition[robot][0] = diuTriangle(cvPoint2DiuPoint(point1),cvPoint2DiuPoint(point2),cvPoint2DiuPoint(point3));
}

void updateBallPotition(CvPoint point){

	for(int i=9; i>0; i--){
		g_ballPosition[i] = g_ballPosition[i-1];
	}
	g_ballPosition[0] = point;
}

void updateRobotEquation(int robot){
	
	g_lineOfRobot[robot] = diuGetLine(g_robotPosition[robot][0].middlePoint, g_robotPosition[robot][2].middlePoint);
}

void updateBallEquation(){
	
	g_lineOfBall = diuGetLine(cvPoint2DiuPoint(g_ballPosition[0]), cvPoint2DiuPoint(g_ballPosition[2]));
}

 


