// ATmega328 source code for TIPS.
// Authors: Charlotte Treffers & Luc van Wietmarschen, TU Delft
// Date: 14 June 2016
//

#ifndef _TRACK_H_
#define _TRACK_H_

#include "helper_3dmath.h"
#include <math.h>
#include "sensor.h"

extern const int DATA_PERIOD_MS;


// ================================================================
// ===               DECLERATION OF VARIABLES                   ===
// ================================================================


// Offset
VectorFloat magBias = {0, 0, 0}; // Bias offset for magnetometers
VectorFloat magScaleX = {0, 0, 0}; // Scaling offsets for the magnetometers
VectorFloat magScaleY = {0, 0, 0};
VectorFloat magScaleZ = {0, 0, 0};
VectorFloat magBiasF;                                      // Adjusted bias offset for magnetometers

// Orientation/motion variables
Quaternion orientationChip;                         // [w, x, y, z]  quaternion orientation of chip to reference frame
VectorInt16 gyroReadout;                            // [x, y, z]     gyro sensor measurements
VectorFloat gyroFilteredF;                          // [x, y, z]     gyro sensor measurements (Float)
VectorInt16 aaReadout;                              // [x, y, z]     accel sensor measurements
VectorFloat aaReadoutF;                             // [x, y, z]     accel sensor measurements (Float)
VectorInt16 aaFiltered;                             // [x, y, z]     accel sensor measurements noise filtered
VectorFloat aaFilteredF;                            // [x, y, z]     accel sensor measurements noise filtered (Float)
VectorFloat aaNormalizedF;                          // [x, y, z]     accel sensor measurements noise normalized (Float)
VectorInt16 aaReal;                                 // [x, y, z]     gravity-free accel sensor measurements
VectorInt16 aaWorld;                                // [x, y, z]     reference-frame accel sensor measurements
VectorFloat aaWorldF;                               // [x, y, z]     reference-frame accel sensor measurements as floats
VectorFloat aaWorldFiltF;                           // [x, y, z]     reference-frame accel sensor measurements filtered as floats
VectorFloat gravity;                                // [x, y, z]     gravity vector
VectorInt16 magReadout;                             // [x, y, z]     magnetometer Readout
VectorFloat magReadoutF;                            // [x, y, z]     magnetometer Readout in floats
VectorFloat magFilteredF;                           // [x, y, z]     magnetometer filtered in floats
VectorFloat magNormalizedF;                         // [x, y, z]     magnetometer normalized in floats
float magTemp;                                      // Temporary store var for magnetometer calibration

// Position variables
Quaternion oldOrientationChip = {1, 0, 0, 0}; //[w,x,y,z]      of chip orientation
Quaternion quadRotate;                              //[w,x,y,z]      of chip rotation during interval
VectorFloat tip;                                    //[x,y,z]        of probe tip
VectorFloat sensor;                                 //[x,y,z]        of sensor
VectorFloat sensor2tip;                             //[x,y,z]        from sensor to tip
VectorFloat normal;                                 //normal         of probe on surface

// LSB values
float lsbValueAccel = 9.8 / 1000.0;                   // LSB value     accelerometers
float lsbValueGyro = 1 / 1000.0;                      // LSB value     gyrometers
//float lsbValueMag = 0.6;                            // LSB value     magnetometers


// Complementary filter variables
float filterconstant = 0.9;                         // Filtercontant used for complementatry filter
VectorFloat aaAngle;                                // [x, y, z]     angle calculated by value of accel sensors
VectorFloat gyroAngle;                              // [x, y, z]     angle calculated by value of gyro sensors
VectorFloat angle = {0, 0, 0};           // [x, y, z]     angle calculated by combining accel and gyro sensors
VectorFloat oldAngle = {0, 0, 0};        // [x, y, z]     previous angle calculated by combining accel and gyro sensors

// Noise filter variables
VectorInt16 noiseParaAccel={200, 200, 250};          //parameter accelerometer
VectorInt16 noiseParaAccelSen={150, 150, 200};       //parameter accelerometer
float noiseParaAccelLow = 0.025 ;                   //parameter accelerometer low pass filter
VectorInt16 noiseParaGyro={35, 35, 35};              //parameter gyroscope
VectorInt16 noiseParaGyroSen={30, 30, 30};           //parameter gyroscope
float noiseParaGyroLow = 0.0;                       //parameter gyroscope low pass filter
VectorInt16 noiseParaMag={6, 6, 6};                  //parameter magnetometer
VectorInt16 noiseParaMagSen={6, 6, 6};               //parameter magnetometer
float noiseParaMagLow = 0.025;                      //parameter magnetometer low pass filter
VectorFloat nullVector = {0, 0, 0};      //null vector for reference

// Low pass filter variables
VectorFloat new_afilt = {0,0,0};
VectorFloat old_afilt;
VectorFloat new_aLP = {0, 0, 0};
VectorFloat old_aLP;
VectorFloat new_vfilt = {0,0,0};
VectorFloat old_vfilt;
VectorFloat new_vLP = {0, 0, 0};
VectorFloat old_vLP;
VectorFloat new_sfilt = {0,0,0};
VectorFloat old_sfilt;
VectorFloat new_sLP = {0, 0, 0};
VectorFloat old_sLP;

// Translation variables
float dT;                                           //secondes       duration of calculation interval
VectorFloat old_a;
VectorFloat new_a;
VectorFloat old_v;
VectorFloat new_v;
VectorFloat old_s;
VectorFloat new_s;

// Set up constants
VectorFloat sensorstart = {0, 0, 0};     //starting position of sensor relative to tip
VectorFloat normalstart = {0, 0, 1};     //startnormal of probe
float deg2rad = 3.14159265 / 180;                     // degree to radian conversion constant

// Calculation variables
//unsigned long timer;                                // timer to measure loop durations


// ================================================================
// ===                  Declaration functions                   ===
// ================================================================
void resetVars();
VectorFloat noiseFilter(VectorFloat *compareValue, VectorInt16 *value, VectorFloat *previousCorrect, float noiseParameterLowPass, VectorInt16 *noiseParameterSen, VectorInt16 *noiseParameter  );
VectorFloat complementaryFilter(VectorFloat *gyroF, VectorFloat *aaF, VectorFloat *magnet, float dT, VectorFloat oldAngle);
VectorFloat getAaWorldFiltF(Quaternion *orientationChip, VectorFloat *aaFilteredF, float dT);
VectorFloat accelAngle(VectorFloat *aaF, VectorFloat *magnet);
float trapezoid(float new_data, float old_data, float old_out, float dT);
int float2int(float flo);
VectorFloat lowpassfilter(VectorFloat *prevX, VectorFloat *newU, VectorFloat *prevU, float alpha);
void getGravity(VectorFloat *v, Quaternion *q);
void getLinearAccel(VectorInt16 *v, VectorInt16 *vRaw, VectorFloat *gravity);


// ================================================================
// ===                    MAIN PROGRAM LOOP                     ===
// ================================================================

void loop(SensorAxes_t* accel, SensorAxes_t* gyro, SensorAxes_t* mag, VectorFloat* r_pos, VectorFloat* r_angle, uint32_t dTms) {
	  dT = dTms / 1000.0;

	  aaReadout.x = accel->AXIS_X;
	  aaReadout.y = accel->AXIS_Y;
	  aaReadout.z = accel->AXIS_Z;

	  gyroReadout.x = gyro->AXIS_X;
	  gyroReadout.y = gyro->AXIS_Y;
	  gyroReadout.z = gyro->AXIS_Z;

	  magReadout.x = mag->AXIS_X;
	  magReadout.y = mag->AXIS_Y;
	  magReadout.z = mag->AXIS_Z;

      //Offset magnetometer
      magBiasF.x = magReadout.x - magBias.x;
      magBiasF.y = magReadout.y - magBias.y;
      magBiasF.z = magReadout.z - magBias.z;
      magReadoutF.x = (magBiasF.x * magScaleX.x + magBiasF.y * magScaleX.y + magBiasF.z * magScaleX.z);
      magReadoutF.y = (magBiasF.x * magScaleY.x + magBiasF.y * magScaleY.y + magBiasF.z * magScaleY.z);
      magReadoutF.z = (magBiasF.x * magScaleZ.x + magBiasF.y * magScaleZ.y + magBiasF.z * magScaleZ.z);
      //Set magneto axis to our axis
      magTemp = magReadoutF.x;
      magReadoutF.x = magReadoutF.y;
      magReadoutF.y = magTemp;
      magReadoutF.z = -magReadoutF.z;

      //Offset accelerometer
      aaReadout.x = aaReadout.x + 0;
      aaReadout.y = aaReadout.y - 0;
      aaReadout.z = aaReadout.z + 0;

      //Offset gyroscopes
      gyroReadout.x = gyroReadout.x + 0;
      gyroReadout.y = gyroReadout.y - 0;
      gyroReadout.z = gyroReadout.z + 0;

      //noise filtering inputs
      magReadout.x = float2int(magReadoutF.x);
      magReadout.y = float2int(magReadoutF.y);
      magReadout.z = float2int(magReadoutF.z);

//      aaFilteredF   = noiseFilter(&aaFilteredF,   &aaReadout,   &aaFilteredF,  noiseParaAccelLow, &noiseParaAccelSen, &noiseParaAccel);
//      gyroFilteredF = noiseFilter(&gyroFilteredF, &gyroReadout, &nullVector,   noiseParaGyroLow,  &noiseParaGyroSen,  &noiseParaGyro);
//      magFilteredF  = noiseFilter(&magFilteredF,  &magReadout,  &magFilteredF, noiseParaMagLow,   &noiseParaMagSen,   &noiseParaMag);
      aaFilteredF.x = aaReadout.x;
      aaFilteredF.y = aaReadout.y;
      aaFilteredF.z = aaReadout.z;
      gyroFilteredF.x = gyroReadout.x;
      gyroFilteredF.y = gyroReadout.y;
      gyroFilteredF.z = gyroReadout.z;
      magFilteredF.x = magReadout.x;
      magFilteredF.y = magReadout.y;
      magFilteredF.z = magReadout.z;

      //applying LSB values to gyros
      gyroFilteredF.x = gyroFilteredF.x * lsbValueGyro * deg2rad;
      gyroFilteredF.y = gyroFilteredF.y * lsbValueGyro * deg2rad;
      gyroFilteredF.z = gyroFilteredF.z * lsbValueGyro * deg2rad;
      //normalise magnetometers and accelerometers
      magNormalizedF = getNormalizedFloat(&magFilteredF); //only ratio is used, so LSB doenst matter
      aaNormalizedF = getNormalizedFloat(&aaFilteredF);

      // calculate angle
      angle = complementaryFilter(&gyroFilteredF, &aaNormalizedF, &magNormalizedF, dT, oldAngle);    //calculate new angle of sensor
      oldAngle = angle;             //make oldangle the previous calculated angle
      //yaw doesn't work properly, this sets them for reference to use in other functions
//      angle.x = 0;
//      angle.y = 0;
//      angle.z = 180;              //yaw doesn't work properly

      // Calculate Quaternion //TODO check if this is right
//      float roll = angle.x;
//      float pitch = angle.y;
//      float yaw = angle.z;
//      orientationChip.w = cos(pitch/2) * cos(yaw/2) * cos(roll/2) + sin(pitch/2) * sin(yaw/2) * sin(roll/2);
//      orientationChip.x = sin(pitch/2) /** cos(yaw/2)*/ * cos(roll/2);// - cos(pitch/2) * sin(yaw/2) * sin(roll/2);
//      orientationChip.y = /*cos(pitch/2) * sin(yaw/2) * cos(roll/2)*/ + sin(pitch/2) * /*cos(yaw/2) **/ sin(roll/2);
//      orientationChip.z = cos(pitch/2) * /*cos(yaw/2) **/ sin(roll/2); /*- sin(pitch/2) * sin(yaw/2) * cos(roll/2)*/;
//
//      //rotating
//      quadRotate = getProduct(&orientationChip, getConjugate(&oldOrientationChip)); // finding the rotation shift during the interval, disp * q1 = q2 --> disp = q2*inv(q1)
//      rotateFloat(&sensor2tip, &quadRotate);         //rotate the sensor to tip translation vector with the new rotation
//      rotateFloat(&normal, &quadRotate);             //rotate the normal with the new rotation
//      oldOrientationChip = orientationChip;   //store the orientation
//
//      //translating
//      aaWorldFiltF = getAaWorldFiltF(&orientationChip, &aaFilteredF, dT);
////      aaFilteredF.z = aaFilteredF.z - 16384; //used when angle is not active and chip is positioned with z facing up
//
//      // updating acceleration
//      old_a = new_a;                    // storing old data
//      new_a = aaWorldFiltF;             // reading out new data
////      new_a = aaFilterdF;                    //used when angle is not active and chip is positioned with z facing up
//      // filtering aceleration
//      old_aLP = new_aLP;                // storing old drift offset
//      old_afilt = new_afilt;            // storing old filtered data
//      new_aLP = lowpassfilter(&old_aLP, &new_a , &old_a, 0.05); // calculate new drift offset
//      new_afilt.x = new_a.x - new_aLP.x;// subtract drift from data
//      new_afilt.y = new_a.y - new_aLP.y;
//      new_afilt.z = new_a.z - new_aLP.z;
//
//      // updating velocity
//      old_v = new_v;                    // storing old data
//      new_v.x = trapezoid(new_afilt.x, old_afilt.x, old_v.x, dT); // reading out new data
//      new_v.y = trapezoid(new_afilt.y, old_afilt.y, old_v.y, dT);
//      new_v.z = trapezoid(new_afilt.z, old_afilt.z, old_v.z, dT);
//      // filtering v
//      old_vLP = new_vLP;                // storing old drift offset
//      old_vfilt = new_vfilt;            // storing old filtered data
//      new_vLP = lowpassfilter(&old_vLP, &new_v , &old_v, 0.05); // calculate new drift offset
//      new_vfilt.x = new_v.x - new_vLP.x;// subtract drift from data
//      new_vfilt.y = new_v.y - new_vLP.y;
//      new_vfilt.z = new_v.z - new_vLP.z;
//
//      // updating displacement
//      old_s = new_s;                    // storing old data
//      new_s.x = trapezoid(new_vfilt.x, old_vfilt.x, old_s.x, dT); // reading out new data
//      new_s.y = trapezoid(new_vfilt.y, old_vfilt.y, old_s.y, dT);
//      new_s.z = trapezoid(new_vfilt.z, old_vfilt.z, old_s.z, dT);
//      //filtering s
//      old_sLP = new_sLP;                // storing old drift offset
//      old_sfilt = new_sfilt;            // storing old filtered data
//      new_sLP = lowpassfilter(&old_sLP, &new_s , &old_s, 0.05); // calculate new drift offset
//      new_sfilt.x = new_s.x - new_sLP.x;// subtract drift from data
//      new_sfilt.y = new_s.y - new_sLP.y;
//      new_sfilt.z = new_s.z - new_sLP.z;
//
//      sensor = getAddition(&sensor, new_s);      //translate the sensor in the reference frame
//      tip = getAddition(&sensor, sensor2tip);    //translate from sensor to tip position

      r_pos->x = 0;//tip.x;
      r_pos->y = 0;//tip.y;
      r_pos->z = 0;//tip.z;
      r_angle->x = angle.x;
      r_angle->y = angle.y;
      r_angle->z = angle.z;

      // printing to computer
//      Serial.print(F("xpos:"));
//      Serial.println(tip.x, DEC);
//      Serial.print(F("ypos:"));
//      Serial.println(tip.y, DEC);
//      Serial.print(F("zpos:"));
//      Serial.println(tip.z, DEC);
//      Serial.print(F("xnor:"));
//      Serial.println(normal.x, DEC);
//      Serial.print(F("ynor:"));
//      Serial.println(normal.y, DEC);
//      Serial.print(F("znor:"));
//      Serial.println(normal.z, DEC);

//      dT = (micros() - timer) / 1000000.0;         // update dT, division to convert from micro to seconds
//      timer = micros();                            // update timer
}


// ================================================================
// ===                      FUNCTIONS                           ===
// ================================================================
void resetVars() {
  dT = DATA_PERIOD_MS/1000.0f;
  sensor = sensorstart;                        // sensor starting position
  sensor2tip = sensorstart;
  normal = normalstart;                        // normal starting position
  setQuaternion(&oldOrientationChip, 1, 0, 0, 0); // reset orientation
  //find starting angle
  aaReadoutF = getVectorFloat(&aaReadout);     // make acceleration float
  aaNormalizedF = getNormalizedFloat(&aaReadoutF);  // normalize acceleration
  magReadoutF = getVectorFloat(&magReadout);   // make magnetometer float
  magNormalizedF = getNormalizedFloat(&magReadoutF);// normalise magnetometer
  setVectorFloat(&oldAngle, 0, 0, 0);//accelAngle(&aaNormalizedF, &magNormalizedF); //store old angle
  aaFiltered = aaReadout;                      // set starting aaAngle to readout value
  //reset filter values
  setVectorFloat(&new_a, 0.0, 0.0, 0.0);
  setVectorFloat(&new_v, 0.0, 0.0, 0.0);
  setVectorFloat(&new_s, 0.0, 0.0, 0.0);
  setVectorFloat(&new_aLP, 0, 0, 0);
  setVectorFloat(&new_vLP, 0, 0, 0);
  setVectorFloat(&new_sLP, 0, 0, 0);
  new_afilt = getVectorFloat(&aaFiltered);
  setVectorFloat(&new_vfilt, 0, 0, 0);
  setVectorFloat(&new_sfilt, 0, 0, 0);
}

VectorFloat noiseFilter(VectorFloat *compareValue, VectorInt16 *value, VectorFloat *previousCorrect, float noiseParameterLowPass, VectorInt16 *noiseParameterSen, VectorInt16 *noiseParameter  ) {
  VectorFloat filteredValue;
  if (value->x < compareValue->x - noiseParameter->x | value->x > compareValue->x + noiseParameter->x) {
    filteredValue.x = value->x;
  } else {
    if (value->x < compareValue->x - noiseParameterSen->x | value->x > compareValue->x + noiseParameterSen->x) {
      filteredValue.x = (previousCorrect->x + value->x) / 2;
    } else {
      filteredValue.x = ((float)((1.0 - noiseParameterLowPass) * previousCorrect->x + noiseParameterLowPass * value->x));
    }
  }

  if (value->y < compareValue->y - noiseParameter->y | value->y > compareValue->y + noiseParameter->y) {
    filteredValue.y = value->y;
  } else {
    if (value->y < compareValue->y - noiseParameterSen->y | value->y > compareValue->y + noiseParameterSen->y) {
      filteredValue.y = (previousCorrect->y + value->y) / 2;
    } else {
      filteredValue.y = ((float)((1.0 - noiseParameterLowPass) * previousCorrect->y + noiseParameterLowPass * value->y));
    }
  }

  if (value->z < compareValue->z - noiseParameter->z | value->z > compareValue->z + noiseParameter->z) {
    filteredValue.z = value->z;
  } else {
    if (value->z < compareValue->z - noiseParameterSen->z | value->z > compareValue->z + noiseParameterSen->z) {
      filteredValue.z = (previousCorrect->z + value->z) / 2;
    } else {
      filteredValue.z = ((float)((1.0 - noiseParameterLowPass) * previousCorrect->z + noiseParameterLowPass * value->z));
    }

  }
  return filteredValue;
}


VectorFloat complementaryFilter(VectorFloat *gyroF, VectorFloat *aaF, VectorFloat *magnet, float dT, VectorFloat oldAngle) {
  //Calculate angles with accelerometers and magnetometer
  aaAngle.x = atan2(aaF->y, sqrt(pow(aaF->x, 2) + pow(aaF->z, 2))); //roll
  aaAngle.y = atan2(-aaF->x, sqrt(pow(aaF->y, 2) + pow(aaF->z, 2))); //pitch

  //Calculate angles with gyroscopes
  gyroAngle.x = gyroF->x * dT + oldAngle.x;
  gyroAngle.y = gyroF->y * dT + oldAngle.y;

  //Calculate new angles
  angle.x = filterconstant * (gyroAngle.x) + (1.0 - filterconstant) * (aaAngle.x);
  angle.y = filterconstant * (gyroAngle.y) + (1.0 - filterconstant) * (aaAngle.y);

  //Calculate yaw
  angle.z = oldAngle.z + (gyroF->z * dT * cos(angle.x) * cos(angle.y)) + (gyroF->x * dT * -sin(angle.y)) + (gyroF->y * dT * sin(angle.x));

//  angle.z = atan2((magnet->x * sin(angle.x) * sin(angle.y) + magnet->y * cos(angle.x) - magnet->z * sin(angle.x) * cos(angle.y)), (magnet->x * cos(angle.y) + magnet->z * sin(angle.y)));
  return angle;
}

VectorFloat accelAngle(VectorFloat *aaF, VectorFloat *magnet) {
  aaAngle.x = atan2(aaF->y, sqrt(pow(aaF->x, 2) + pow(aaF->z, 2))); //roll
  aaAngle.y = atan(aaF->x / sqrt(pow(aaF->y, 2) + pow(aaF->z, 2))); //pitch
  aaAngle.z = atan2((magnet->x * cos(aaAngle.y) + magnet->y * sin(aaAngle.x) * sin(aaAngle.y) + magnet->z * cos(aaAngle.x) * sin(aaAngle.y)), (-magnet->y * cos(aaAngle.x) + magnet->z * sin(aaAngle.x))) ;
  return aaAngle;
}

VectorFloat getAaWorldFiltF(Quaternion *orientationChip, VectorFloat *aaFilteredF, float dT) {
  getGravity(&gravity, orientationChip);         //get gravity in gravity(x,y,z)
  aaFiltered.x = float2int(aaFilteredF->x);             // make floats
  aaFiltered.y = float2int(aaFilteredF->y);
  aaFiltered.z = float2int(aaFilteredF->z);
  getLinearAccel(&aaReal, &aaFiltered, &gravity);//get gravity free acceleration in aaReal(x,y,z)
  aaWorld = getRotatedInt16(&aaReal, orientationChip);         //get gravity free acceleration in world reference frame in aaWorld(x,y,z)
  aaWorldFiltF.x = aaWorld.x * lsbValueAccel;            //convert value of accel sensor to m/s
  aaWorldFiltF.y = aaWorld.y * lsbValueAccel;
  aaWorldFiltF.z = aaWorld.z * lsbValueAccel;
  return aaWorldFiltF;
}

int float2int(float flo) {
  int in;
  if (flo < 0) { // check for negative value
    in = (int)(flo - 0.5); // round to nearest negative value
  }
  else {
    in = (int)(flo + 0.5); // round to nearest positive value
  }
  return in;
}

float trapezoid(float new_data, float old_data, float old_out, float dT) {
  float out;
  out = old_out + dT * 0.5 * (old_data + new_data);
  return out;
}

VectorFloat lowpassfilter(VectorFloat *prevX, VectorFloat *newU, VectorFloat *prevU, float alpha) {
  VectorFloat newX;
  newX.x = ((1 - alpha) * prevX->x + alpha * prevU->x);
  newX.y = ((1 - alpha) * prevX->y + alpha * prevU->y);
  newX.z = ((1 - alpha) * prevX->z + alpha * prevU->z);
  return newX;
}

void getGravity(VectorFloat *v, Quaternion *q) {
    v -> x = 2 * (q -> x*q -> z - q -> w*q -> y);
    v -> y = 2 * (q -> w*q -> x + q -> y*q -> z);
    v -> z = q -> w*q -> w - q -> x*q -> x - q -> y*q -> y + q -> z*q -> z;
}

void getLinearAccel(VectorInt16 *v, VectorInt16 *vRaw, VectorFloat *gravity) {
    // get rid of the gravity component (+1g = +1000)
    v -> x = vRaw -> x - gravity -> x*1000;
    v -> y = vRaw -> y - gravity -> y*1000;
    v -> z = vRaw -> z - gravity -> z*1000;
}

#endif
