// ATmega328 source code for TIPS.
// Authors: Charlotte Treffers & Luc van Wietmarschen, TU Delft
// Date: 14 June 2016
//

#ifndef _TRACK_H_
#define _TRACK_H_

#include "helper_3dmath.h"
#include <math.h>
#include "sensor.h"


VectorInt32 gyroReadout;
VectorFloat gyroFilteredF;
VectorInt32 aaReadout;
VectorFloat aaFilteredF;
VectorFloat aaRealF;

VectorFloat gravity;

const float lsbValueGyro = 1 / 1000.0;
const float deg2rad = 3.14159265 / 180;

// Complementary filter variables
float filterconstant = 0.9f;
VectorFloat aaAngle;
VectorFloat gyroAngle;
VectorFloat angle;
VectorFloat oldAngle = {0, 0, 0};

VectorFloat vel = {0, 0, 0};
VectorFloat pos = {0, 0, 0};

float dT;

int sign(float val) {
    return (val > 0) - (val < 0);
}

VectorFloat projectToGlobal(VectorFloat* sensor, VectorFloat* ang) {
	VectorFloat real_z;
	if (abs(ang->x) < 0.1 || abs(ang->y) < 0.1) {
		real_z.x = sensor->z * sin(ang->y);
		real_z.y = sensor->z * -sin(ang->x);
		real_z.z = sensor->z * cos(ang->y) * cos(ang->x);
	} else {
		float z2 = pow(sensor->z, 2);
		float tan2x = pow(tan(ang->x), 2);
		float tan2y = pow(tan(ang->y), 2);
		float someCalc = (1 + 1/tan2x) * (1 + 1/tan2y) - 1;
		real_z.x = sqrt(z2 / (tan2x * someCalc)) * sign(ang->y);
		real_z.y = sqrt(z2 / (tan2y * someCalc)) * -sign(ang->x);
		real_z.z = real_z.x / tan(ang->y); // = -result.y / tan(ang->x)
	}

	VectorFloat real_x;
	real_x.y = 0;
	real_x.x = sensor->x * cos(angle.y);
	real_x.z = sensor->x * -sin(angle.y);

	VectorFloat real_y;
	real_y.x = 0;
	real_y.y = sensor->y * cos(angle.x);
	real_y.z = sensor->y * sin(angle.x);

	VectorFloat result;
	result.x = real_x.x + real_y.x + real_z.x;
	result.y = real_x.y + real_y.y + real_z.y;
	result.z = real_x.z + real_y.z + real_z.z;

	return result;
}

VectorFloat complementaryFilter(VectorFloat *gyroF, VectorFloat *aaF, float dT) {
  //Calculate angles with accelerometer
  aaAngle.x = atan2(aaF->y, sqrt(pow(aaF->x, 2) + pow(aaF->z, 2))); //roll
  aaAngle.y = atan2(-aaF->x, sqrt(pow(aaF->y, 2) + pow(aaF->z, 2))); //pitch

  VectorFloat gyroReal = projectToGlobal(gyroF, &oldAngle);
  //Calculate angles with gyroscope
  gyroAngle.x = gyroReal.x * dT + oldAngle.x;
  gyroAngle.y = gyroReal.y * dT + oldAngle.y;
  gyroAngle.z = gyroReal.z * dT + oldAngle.z;

  angle.x = filterconstant * (gyroAngle.x) + (1.0 - filterconstant) * (aaAngle.x);
  angle.y = filterconstant * (gyroAngle.y) + (1.0 - filterconstant) * (aaAngle.y);
  angle.z = gyroAngle.z;

  return angle;
}

void loop(SensorAxes_t* accel, SensorAxes_t* gyro, SensorAxes_t* mag, VectorFloat* r_pos, VectorFloat* r_angle, uint32_t dTms) {
	  dT = dTms / 1000.0;

	  aaReadout.x = accel->AXIS_X;
	  aaReadout.y = accel->AXIS_Y;
	  aaReadout.z = accel->AXIS_Z;

	  gyroReadout.x = gyro->AXIS_X;
	  gyroReadout.y = gyro->AXIS_Y;
	  gyroReadout.z = gyro->AXIS_Z;

      //Offset accelerometer
      aaReadout.x = aaReadout.x + 0;
      aaReadout.y = aaReadout.y + 0;
      aaReadout.z = aaReadout.z + 0;

      //Offset gyroscopes
      gyroReadout.x = gyroReadout.x + 0;
      gyroReadout.y = gyroReadout.y + 0;
      gyroReadout.z = gyroReadout.z + 0;

      //Nonexistent noise filters
      aaFilteredF.x = aaReadout.x;
      aaFilteredF.y = aaReadout.y;
      aaFilteredF.z = aaReadout.z;
      gyroFilteredF.x = gyroReadout.x;
      gyroFilteredF.y = gyroReadout.y;
      gyroFilteredF.z = gyroReadout.z;

      //applying LSB values to gyro
      gyroFilteredF.x = gyroFilteredF.x * lsbValueGyro * deg2rad;
      gyroFilteredF.y = gyroFilteredF.y * lsbValueGyro * deg2rad;
      gyroFilteredF.z = gyroFilteredF.z * lsbValueGyro * deg2rad;

      // calculate angle
      angle = complementaryFilter(&gyroFilteredF, &aaFilteredF, dT);
      oldAngle = angle;

	  gravity.x = 1000 * -sin(angle.y);
	  gravity.y = 1000 * sin(angle.x);
	  gravity.z = sqrt(pow(1000, 2) - (pow(gravity.y, 2) + pow(gravity.x, 2)));

	  aaFilteredF.x -= gravity.x;
	  aaFilteredF.y -= gravity.y;
	  aaFilteredF.z -= gravity.z;

	  aaRealF = projectToGlobal(&aaFilteredF, &angle);
	  aaRealF.x = aaRealF.x * cos(angle.z) - aaRealF.y * sin(angle.z);
	  aaRealF.y = aaRealF.x * sin(angle.z) + aaRealF.y * cos(angle.z);

	  vel.x += aaRealF.x * dT;
	  vel.y += aaRealF.y * dT;
	  vel.z += aaRealF.z * dT;

	  pos.x += vel.x * dT;
	  pos.y += vel.y * dT;
	  pos.z += vel.z * dT;

	  accel->AXIS_X = round(aaFilteredF.x);
	  accel->AXIS_Y = round(aaFilteredF.y);
	  accel->AXIS_Z = round(aaFilteredF.z);

      r_angle->x = angle.x;
      r_angle->y = angle.y;
      r_angle->z = angle.z;

      r_pos->x = pos.x;
      r_pos->y = pos.y;
      r_pos->z = pos.z;
}

void resetPos()
{
	pos.x = 0;
	pos.y = 0;
	pos.z = 0;
	angle.z = 0;
	oldAngle.z = 0;
}

#endif
