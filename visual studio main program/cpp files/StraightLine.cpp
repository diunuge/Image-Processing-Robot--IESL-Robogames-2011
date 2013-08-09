//Diunuge Buddhika wijesinghe 
//University Of Moratuwa
//Department of Computer Science and Engineering
//Coordinate geometry for computer vision programming  v1.1
//100606N
//2011-10-22

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define INFINIT 999999999999.9
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
	bool isValid;
	
}DiuTriangle;

typedef struct _DiuStraightLine{    // this for both y = mx + c and ax + by + c = 0 type equations

	int a;
	int b;
	int c;
	double m;
	double c0;
	bool isValid;
	bool definedGradient;
	bool equals(_DiuStraightLine line){
		if(a==line.a && b==line.b && c==line.c ){
			return true;
		}
		if(line.a*line.b*line.c==0){
			if(line.c*c==0 && line.c+c!=0)                             // one of c's equal to 0 :: c=0 or line.c=0
				return false;
			else{
				if(line.a*a==0 && line.a+a!=0)                         // one of a's equal to 0 :: a=0 or line.a=0
					return false;
				else{
					if(line.b*b==0 && line.b+b!=0)                     // one of b's equal to 0 :: b=0 or line.b=0
						return false;
					else{                                              // constants can be 0, but both 
						if(isValid==false || line.isValid==false )	   //not a valid equation
							return false;
						//if valid equation
						if(a==0){
							if(c==0){                                  //ex:  3y = 0  and 4y = 0
								return true;                           
							}
							else{                                      //ex:  3y + 5 = 0  and 4y + 6 = 0
								if(b/(double)line.b == c/line.c)     
									return true;
								else	
									return false;
							}
						}
						else if(b==0){
							if(c==0){                                  //ex:  3x = 0  and 4x = 0
								return true;
							}
							else{                                      //ex:  3x + 5 = 0  and 4x + 6 = 0
								if(a/(double)line.a == c/line.c)     
									return true;
								else	
									return false;
							}
						}
						else{                                          //ex:  ax+by = 0
							if( a/(double)line.a == b/(double)line.b )
								return true;
							else
								return false;
						}
					}
				}
			}
		}
		
		if(a/(double)line.a == b/(double)line.b && b/(double)line.b == c/line.c)
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
void diuShowTriangle(DiuTriangle triangle);








/*********************************3****************************************/
int main(){
	
	DiuPoint point1 = diuPoint(0,0);
	DiuPoint point2 = diuPoint(1,6);
	DiuPoint point3 = diuPoint(7,3);
	
	DiuStraightLine line = diuGetLine(point1,point2);
	DiuStraightLine line_parallel = diuParallelLineTo(line,diuPoint(1,2));
	DiuStraightLine line_normal = diuNormalLineTo(line,diuPoint(1,2));
	
	DiuTriangle triangle = diuTriangle(point1,point2,point3);
	diuShowTriangle(triangle);
	diuShowPoint(triangle.point[triangle.mainPoint]);
	
	diuShowLine(line);
	if(line.equals(diuStraightLine(12,-2,0))){
		printf("equal!\n");
	}
	else
		printf("not equal!\n");
	
}







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
	
	if(!point.isValid){
		return (double)null;
	}
	
	else
		return sqrt( (double)(square(point.x) + square(point.y)) );
}

//return distance between two points
double diuDistance2Points(DiuPoint point1, DiuPoint point2){
	
	if(point1.isValid==false || point2.isValid==false){
		return (double)null;
	}
	
	else
		return sqrt( (double)(square(point1.x - point2.x) + square(point1.y - point2.y)) );
}

//return approximate middle point
//since we use pixels for points floating values make no sence 
DiuPoint diuGetMiddlePoint(DiuPoint point1, DiuPoint point2){
	
	if(point1.isValid==false || point2.isValid==false){
		DiuPoint _point;
		_point.isValid = false;
		return _point;
	}
	
	else
		return diuPoint((point1.x + point2.x)/2 , (point1.y + point2.y)/2);
}

//return approximate ratio point
DiuPoint diuGetApproxRatioPoint(DiuPoint point1, DiuPoint point2, int m, int n){
	
	if(point1.isValid==false || point2.isValid==false || m <= 0 || n <= 0 ){
		DiuPoint _point;
		_point.isValid = false;
		return _point;
	}
	
	else
		return diuPoint( (int)(point1.x * n + point2.x * m)/(m + n) , (int)(point1.y * n + point2.y * m)/(m + n));
}

//return approximate external ratio point
DiuPoint diuGetApproxExtRatioPoint(DiuPoint point1, DiuPoint point2, int m, int n){
	
	DiuPoint _point;
	
	if(point1.isValid==false || point2.isValid==false || m <= 0 || n <= 0 ){
		_point.isValid = false;
		return _point;
	}
	else
		_point.isValid = true;
		
	//not implemented yet
	//
	
	return _point;
}

/******************** Straight Line  **************************************/

//construct DiuStraightLine data type line from a,b,c (ax + by + c = 0)
DiuStraightLine diuStraightLine(int a,int b,int c){
	
	DiuStraightLine _line;
	
	if(a==0 && b==0){                    //check validity
		_line.isValid = false;
		return _line;
	}
	else{
		_line.isValid = true;
	}
	
	if(a < 0){                     //rearrange for readable manner
		_line.a = - a;
		_line.b = - b;
		_line.c = - c;
	}
	else{
		_line.a = a;
		_line.b = b;
		_line.c = c;
	}
	
	if(_line.b != 0)                     //check that gradient is defined
		_line.definedGradient = true;
	
	else if(_line.b == 0)
		_line.definedGradient = false;
	
	if(_line.definedGradient){
		_line.m = - _line.a / (double)_line.b;        // m = -a/b
		_line.c0 = - _line.c /(double)_line.b;        // c = -c/b
	}
	else if(!_line.definedGradient){
		_line.m = INFINIT;                           // m undefined
		_line.c0 = - _line.c /(double)_line.a;        // c = -c/a   for x = k
	}
	return _line;
}

//return line from 2 points
DiuStraightLine diuGetLine(DiuPoint point1, DiuPoint point2){
	
	DiuStraightLine _line;
	
	_line.a = point1.y - point2.y;
	_line.b = point2.x - point1.x;
	_line.c = point1.y * ( point1.x - point2.x ) - point1.x * (point1.y - point2.y );
	
	if(_line.a==0 && _line.b==0){           //check validity
		_line.isValid = false;
		return _line;
	}
	else{
		_line.isValid = true;
	}
	
	if(_line.b != 0)                        //check that gradient is defined
		_line.definedGradient = true;
	
	else if(_line.b == 0)
		_line.definedGradient = false;
	
	if(_line.a < 0){                        //rearrange for readable manner
		_line.a = - _line.a;
		_line.b = - _line.b;
		_line.c = - _line.c;
	}
	
	if(_line.definedGradient){
		_line.m = - _line.a / (double)_line.b;               // m = -a/b
		_line.c0 = - _line.c / (double)_line.b;              // c = -c/b
	}
	else if(!_line.definedGradient){
		_line.m = INFINIT;                                  // m = -a/b
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
	
	if(!line.isValid)
		printf("invalid line!\n");
	
	else if(line.definedGradient)
		printf("%dx + %dy + %d = 0  or  y = %.2lfx + %.2lf\n",line.a,line.b,line.c,line.m,line.c0);
	
	else
		printf("%dx + %dy + %d = 0  or  x = %.2lf\n",line.a,line.b,line.c,line.c0);
}

//angle between lines in radians
double diuAngleBetweenLines(DiuStraightLine line1,DiuStraightLine line2){
	
	if(line1.isValid == false || line2.isValid == false){   // check validity
		return (double)null;
	}
	
	if((line1.b*line2.b)/(line1.a*line2.a) == -1) {  // if m1*m2 == -1
		return PI/4;
	}  
	
	if(line1.definedGradient & line2.definedGradient)                   //check that gradient is defined
		return atan(fabs((line1.m - line2.m)/(1 + line1.m*line2.m)));
		
	else
		return (double)null;
}

//gives parallel line which go through given point
DiuStraightLine diuParallelLineTo(DiuStraightLine line, DiuPoint point){
	
	DiuStraightLine _line;
	
	if(line.isValid == false || point.isValid == false){   // check validity
		_line.isValid = false;
		return _line;
	}
	
	int c = -1 * (line.a * point.x + line.b * point.y);
	return diuStraightLine(line.a,line.b,c);
}

//gives normal line which go through given point
DiuStraightLine diuNormalLineTo(DiuStraightLine line, DiuPoint point){
	
	DiuStraightLine _line;
	
	if(line.isValid == false || point.isValid == false){   // check validity
		_line.isValid = false;
		return _line;
	}
	
	int a = line.b;
	int b = - line.a;
	int c = -1 * (a * point.x + b * point.y);
	return diuStraightLine(a,b,c);
}

//gives intersect point of 2 lines
DiuPoint diuIntersectPoint(DiuStraightLine line1,DiuStraightLine line2){
	
	DiuPoint _point;
	
	if(line1.isValid == false || line2.isValid == false ){   // check validity
		_point.isValid = false;
		return _point;
	}
	else
		_point.isValid = true;
		
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
	
	if(line.isValid == false || point1.isValid == false || point2.isValid == false ){   // check validity
		return false;
	}
	
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
	
	if( point1.isValid == false || point2.isValid == false || point3.isValid == false ){   // check validity
		_triangle.isValid = false;
		return _triangle;
	}
	else
		_triangle.isValid = true;
	
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
	
	if( triangle.isValid == false ){   // check validity
		return (double)null;
	}
	
	DiuTriangle tri = triangle;
	return fabs(( tri.point[0].x*(tri.point[1].y - tri.point[2].y) + tri.point[1].x*(tri.point[2].y - tri.point[0].y) +tri.point[2].x*(tri.point[0].y - tri.point[1].y))/2.0);
}

void diuShowTriangle(DiuTriangle triangle){

	if(triangle.isValid)
		printf("(%d,%d) , (%d,%d) , (%d,%d)",triangle.point[0].x, triangle.point[0].y, triangle.point[1].x, triangle.point[1].y, triangle.point[2].x, triangle.point[2].y);

	else
		printf("Invalid triangle");
}
