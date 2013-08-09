//Diunuge Buddhika wijesinghe 
//University Of Moratuwa
//Department of Computer Science and Engineering
//Coordinate geometry for computer vision programming   v.0
//100606N
//2011-10-22

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define INFINITY 999999999999.9
#define PI 3.141592654
#define null -1

typedef struct _DiuPoint{
	int x;
	int y;
	bool isValid;
}DiuPoint;

typedef struct _DiuTriangle{
	DiuPoint point[3];
	int mainPoint;
	DiuPoint middlePoint;
}DiuTriangle;

typedef struct _DiuStraightLine{    // this for both y = mx + c and ax + by + c = 0 type equations
	int a;
	int b;
	int c;
	double m;
	double c0;
	bool definedGradient;
	bool equals(_DiuStraightLine line){
		if(a/line.a == b/line.b && b/line.b == c/line.c)
			return true;
		else
			return false;
	}
	bool onLine(DiuPoint point){
		if( (a*point.x + b*point.y + c) == 0 )
			return true;
		else 
			return false;
	}
	int val(DiuPoint point){
		return (a*point.x + b*point.y + c);
	}
}DiuStraightLine;

/*******************  Functions  prototypes ******************************/
/*
int square(int x);
double diuRad2Deg(double value);
double diuDeg2Rad(double value);

DiuPoint diuPoint(int x,int y);
DiuPoint diuClonePoint(DiuPoint point);
void diuShowPoint(DiuPoint point);
double diuDistanceToOrigin(DiuPoint point);
double diuDistance2Points(DiuPoint point1, DiuPoint point2); 
DiuPoint diuGetMiddlePoint(DiuPoint point1, DiuPoint point2);
DiuPoint diuGetApproxRatioPoint(DiuPoint point1, DiuPoint point2, int x, int y);
DiuPoint diuGetApproxExtRatioPoint(DiuPoint point1, DiuPoint point2, int x, int y);  //___


DiuStraightLine diuStraightLine(int a, int b, int c);
//DiuStraightLine diuStraightLine(double m, double c0);
DiuStraightLine diuGetLine(DiuPoint point1, DiuPoint point2);
DiuStraightLine diuCloneLine(DiuStraightLine line);
//char[] diuLineToString(DiuStraightLine line);
void diuShowLine(DiuStraightLine line);
double diuAngleBetweenLines(DiuStraightLine line1,DiuStraightLine line2);
DiuStraightLine diuParallelLineTo(DiuStraightLine line, DiuPoint point);
DiuStraightLine diuNormalLineTo(DiuStraightLine line, DiuPoint point);
DiuPoint diuIntersectPoint(DiuStraightLine line1,DiuStraightLine line2);
bool diuIsSameSide(DiuStraightLine line, DiuPoint point1, DiuPoint point2);


DiuTriangle diuTriangle(DiuPoint point1,DiuPoint point2,DiuPoint point3);
double diuTriangleArea(DiuTriangle triangle);


*/
/********************       other    **************************************/

//return square value
int square(int x){
	return x*x;
}

//convert radians value to degree value
double diuRad2Deg(double value){
	return value*180/PI;
}

//convert degree value to radians value
double diuDeg2Rad(double value){
	return value*PI/180;
}

/********************       Point    **************************************/	

//return point from 2 cordinates
DiuPoint diuPoint(int x,int y){
	DiuPoint _point;
	_point.x = x;
	_point.y = y;
	_point.isValid = true;
	return _point;
}

//clone point 
DiuPoint diuClonePoint(DiuPoint point){
	return point;
}

//show point
void diuShowPoint(DiuPoint point){
	if(point.isValid)
		printf("( %d,%d )",point.x,point.y);
	else
		printf("Invalid point!\n");
}

//return distance to origin
double diuDistanceToOrigin(DiuPoint point){
	return sqrt( (double)(square(point.x) + square(point.y)) );
}

//return distance between two points
double diuDistance2Points(DiuPoint point1, DiuPoint point2){
	return sqrt( (double)(square(point1.x - point2.x) + square(point1.y - point2.y)) );
}

//return approximate middle point
//since we use pixels for points floating values make no sence 
DiuPoint diuGetMiddlePoint(DiuPoint point1, DiuPoint point2){
	return diuPoint((point1.x + point2.x)/2 , (point1.y + point2.y)/2);
}

//return approximate ratio point
DiuPoint diuGetApproxRatioPoint(DiuPoint point1, DiuPoint point2, int m, int n){
	return diuPoint( (int)(point1.x * n + point2.x * m)/(m + n) , (int)(point1.y * n + point2.y * m)/(m + n));
}

//return approximate external ratio point
DiuPoint diuGetApproxExtRatioPoint(DiuPoint point1, DiuPoint point2, int x, int y){
	DiuPoint _point;
	return _point;
}

/******************** Straight Line  **************************************/

//construct DiuStraightLine data type line from a,b,c (ax + by + c = 0)
DiuStraightLine diuStraightLine(int a,int b,int c){
	DiuStraightLine _line;
	
	if(_line.a < 0){
		_line.a = - a;
		_line.b = - b;
		_line.c = - c;
	}
	else{
		_line.a = a;
		_line.b = b;
		_line.c = c;
	}
	
	if(_line.b != 0)                                //check that gradient is defined
		_line.definedGradient = true;
	
	else if(_line.b == 0)
		_line.definedGradient = false;
	
	if(_line.definedGradient){
		_line.m = - _line.a / (double)_line.b;               // m = -a/b
		_line.c0 = - _line.c /(double)_line.b;              // c = -c/b
	}
	else if(!_line.definedGradient){
		_line.m = INFINITY;                              // m undefined
		_line.c0 = - _line.c /(double)_line.a;              // c = -c/a   for x = k
	}
	return _line;
}

//return line from 2 points
DiuStraightLine diuGetLine(DiuPoint point1, DiuPoint point2){
	DiuStraightLine _line;
	
	_line.a = point1.y - point2.y;
	_line.b = point2.x - point1.x;
	_line.c = point1.y * ( point1.x - point2.x ) - point1.x * (point1.y - point2.y );
	
	if(_line.b != 0)                                //check that gradient is defined
		_line.definedGradient = true;
	
	else if(_line.b == 0)
		_line.definedGradient = false;
	
	if(_line.a < 0){
		_line.a = - _line.a;
		_line.b = - _line.b;
		_line.c = - _line.c;
	}
	
	if(_line.definedGradient){
		_line.m = - _line.a / (double)_line.b;               // m = -a/b
		_line.c0 = - _line.c / (double)_line.b;              // c = -c/b
	}
	else if(!_line.definedGradient){
		_line.m = INFINITY;               // m = -a/b
		_line.c0 = - _line.c / (double)_line.a;              // c = -c/b
	}
	return _line;
}

//clone line
DiuStraightLine diuCloneLine(DiuStraightLine line){
	return line;
}

//show line
void diuShowLine(DiuStraightLine line){
	if(line.definedGradient)
		printf("%dx + %dy + %d = 0  or  y = %.2lfx + %.2lf\n",line.a,line.b,line.c,line.m,line.c0);
	
	else
		printf("%dx + %dy + %d = 0  or  x = %.2lf\n",line.a,line.b,line.c,line.c0);
}

//angle between lines in radians
double diuAngleBetweenLines(DiuStraightLine line1,DiuStraightLine line2){
	
	if((line1.b*line2.b)/(line1.a*line2.a) == -1) {  // if m1*m2 == -1
		printf("hi");
		return PI/4;
	}  
	
	if(line1.definedGradient & line2.definedGradient)                   //check that gradient is defined
		return atan(fabs((line1.m - line2.m)/(1 + line1.m*line2.m)));
		
	else
		return (double)null;
}

//gives parallel line which go through given point
DiuStraightLine diuParallelLineTo(DiuStraightLine line, DiuPoint point){
	int c = -1 * (line.a * point.x + line.b * point.y);
	return diuStraightLine(line.a,line.b,c);
}

//gives normal line which go through given point
DiuStraightLine diuNormalLineTo(DiuStraightLine line, DiuPoint point){
	int a = line.b;
	int b = - line.a;
	int c = -1 * (a * point.x + b * point.y);
	return diuStraightLine(a,b,c);
}

//gives intersect point of 2 lines
DiuPoint diuIntersectPoint(DiuStraightLine line1,DiuStraightLine line2){
	DiuPoint _point;
	int a1 = line1.a;		int b1 = line1.b;		int c1 = line1.c;
	int a2 = line2.a;		int b2 = line2.b;		int c2 = line2.c;
	
	if(a1*b2 - a2*b1 == 0){
		_point.isValid = false;
		return _point;
	}
	
	int x = (b1*c2 - b2*c1)/(a1*b2 - a2*b1);
	int y = (c1*a2 - c2*a1)/(a1*b2 - a2*b1);
	return diuPoint(x,y);
}

bool diuIsSameSide(DiuStraightLine line, DiuPoint point1, DiuPoint point2){
	int value = line.val(point1)*line.val(point2);
	if(value > 0)
		return true;
	else
		return false;
}


/************    Triangle    **************************************************/

//return DiuTriangle type datastructure from 3 points
DiuTriangle diuTriangle(DiuPoint point1,DiuPoint point2,DiuPoint point3){
	DiuTriangle _triangle;
	_triangle.point[0] = point1;
	_triangle.point[1] = point2;
	_triangle.point[2] = point3;
	double min_dis = diuDistance2Points(_triangle.point[0],_triangle.point[2]);
	_triangle.mainPoint = 1;
	for(int i=0 ; i<2; i++){
		if(min_dis>diuDistance2Points(_triangle.point[i],_triangle.point[i+1])){
			min_dis = diuDistance2Points(_triangle.point[i],_triangle.point[i+1]);
			_triangle.mainPoint = i+2<3 ? 2 : 0;
		}	
	}
	_triangle.middlePoint = diuPoint( (point1.x + point2.x + point3.x)/3, (point1.y + point2.y + point3.y)/3);
	return _triangle;
}

//return area of triangle
double diuTriangleArea(DiuTriangle triangle){
	DiuTriangle tri = triangle;
	return fabs(( tri.point[0].x*(tri.point[1].y - tri.point[2].y) + tri.point[1].x*(tri.point[2].y - tri.point[0].y) +tri.point[2].x*(tri.point[0].y - tri.point[1].y))/2.0);
}
