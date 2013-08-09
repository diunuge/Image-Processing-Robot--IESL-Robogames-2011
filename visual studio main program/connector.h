//wijesinghe D.B
//data structure connector for openCV and coordinate geometry library

#include "diuCoordinate.h"
#include "cxcore.h"

DiuPoint cvPoint2DiuPoint(CvPoint point);
CvPoint diuPoint2CvPoint(DiuPoint point);

DiuPoint cvPoint2DiuPoint(CvPoint point){
	DiuPoint _point;
	_point.x = point.x;
	_point.y = point.y;
	_point.isValid = true;
	return _point; 
}

CvPoint diuPoint2CvPoint(DiuPoint point){
	CvPoint _point;
	_point.x = point.x;
	_point.y = point.y;
	return _point;
}
