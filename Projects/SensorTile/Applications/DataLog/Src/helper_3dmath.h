// I2C device class (I2Cdev) demonstration Arduino sketch for MPU6050 class, 3D math helper
// 6/5/2012 by Jeff Rowberg <jeff@rowberg.net>
// Updates should (hopefully) always be available at https://github.com/jrowberg/i2cdevlib
//
// Changelog:
//     2012-06-05 - add 3D math helper file to DMP6 example sketch

/* ============================================
I2Cdev device library code is placed under the MIT license
Copyright (c) 2012 Jeff Rowberg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
===============================================
*/

#ifndef _HELPER_3DMATH_H_
#define _HELPER_3DMATH_H_

struct Quaternion {
	float w;
	float x;
	float y;
	float z;
};
typedef struct Quaternion Quaternion;

Quaternion getProductQuaternion(Quaternion* qi, Quaternion q) {
    // Quaternion multiplication is defined by:
    //     (Q1 * Q2).w = (w1w2 - x1x2 - y1y2 - z1z2)
    //     (Q1 * Q2).x = (w1x2 + x1w2 + y1z2 - z1y2)
    //     (Q1 * Q2).y = (w1y2 - x1z2 + y1w2 + z1x2)
    //     (Q1 * Q2).z = (w1z2 + x1y2 - y1x2 + z1w2
	Quaternion r={
		qi->w*q.w - qi->x*q.x - qi->y*q.y - qi->z*q.z,  // new w
		qi->w*q.x + qi->x*q.w + qi->y*q.z - qi->z*q.y,  // new x
		qi->w*q.y - qi->x*q.z + qi->y*q.w + qi->z*q.x,  // new y
		qi->w*q.z + qi->x*q.y - qi->y*q.x + qi->z*q.w}; // new z
    return r;
}

Quaternion getConjugateQuaternion(Quaternion* q) {
	Quaternion r={q->w, -q->x, -q->y, -q->z};
    return r;
}

float getMagnitudeQuaternion(Quaternion* q) {
    return sqrt(q->w*q->w + q->x*q->x + q->y*q->y + q->z*q->z);
}

void normalizeQuaternion(Quaternion* q) {
    float m = getMagnitude(q);
    q->w /= m;
    q->x /= m;
    q->y /= m;
    q->z /= m;
}

Quaternion getNormalizedQuaternion(Quaternion* q) {
    Quaternion r={q->w, q->x, q->y, q->z};
    normalize(&r);
    return r;
}


struct VectorInt32 {
	int32_t x;
	int32_t y;
	int32_t z;
};
typedef struct VectorInt32 VectorInt32;

float getMagnitudeVectorInt32(VectorInt32* v) {
	return sqrt(v->x*v->x + v->y*v->y + v->z*v->z);
}

void normalizeVectorInt32(VectorInt32* v) {
	float m = getMagnitudeVectorInt32(v);
	v->x /= m;
	v->y /= m;
	v->z /= m;
}

VectorInt32 getNormalizedVectorInt32(VectorInt32* v) {
	VectorInt32 r={v->x, v->y, v->z};
	normalizeVectorInt32(&r);
	return r;
}

void rotateVectorInt32(VectorInt32* v, Quaternion *q) {
	// http://www.cprogramming.com/tutorial/3d/quaternions.html
	// http://www.euclideanspace.com/maths/algebra/realNormedAlgebra/quaternions/transforms/index.htm
	// http://content.gpwiki.org/index.php/OpenGL:Tutorials:Using_Quaternions_to_represent_rotation
	// ^ or: http://webcache.googleusercontent.com/search?q=cache:xgJAp3bDNhQJ:content.gpwiki.org/index.php/OpenGL:Tutorials:Using_Quaternions_to_represent_rotation&hl=en&gl=us&strip=1

	// P_out = q * P_in * conj(q)
	// - P_out is the output vector
	// - q is the orientation quaternion
	// - P_in is the input vector (a*aReal)
	// - conj(q) is the conjugate of the orientation quaternion (q=[w,x,y,z], q*=[w,-x,-y,-z])
	Quaternion p={0, v->x, v->y, v->z};

	// quaternion multiplication: q * p, stored back in p
	p = getProductQuaternion(q, p);

	// quaternion multiplication: p * conj(q), stored back in p
	p = getProductQuaternion(&p, getConjugateQuaternion(q));

	// p quaternion is now [0, x', y', z']
	v->x = p.x;
	v->y = p.y;
	v->z = p.z;
}

VectorInt32 getRotatedVectorInt32(VectorInt32* v, Quaternion *q) {
	VectorInt32 r={v->x, v->y, v->z};
	rotateVectorInt32(&r, q);
	return r;
}


struct VectorFloat {
	float x;
	float y;
	float z;
};
typedef struct VectorFloat VectorFloat;

VectorFloat getVectorFloatFromVectorInt32(VectorInt32* v) {
	VectorFloat f = {v->x, v->y, v->z};
	return f;
}

float getMagnitudeVectorFloat(VectorFloat* v) {
	return sqrt(v->x*v->x + v->y*v->y + v->z*v->z);
}

void normalizeVectorFloat(VectorFloat* v) {
	float m = getMagnitudeVectorFloat(v);
	v->x /= m;
	v->y /= m;
	v->z /= m;
}

VectorFloat getNormalizedVectorFloat(VectorFloat* v) {
	VectorFloat r={v->x, v->y, v->z};
	normalizeFloat(&r);
	return r;
}

void rotateVectorFloat(VectorFloat* v, Quaternion *q) {
	Quaternion p={0, v->x, v->y, v->z};

	// quaternion multiplication: q * p, stored back in p
	p = getProductQuaternion(q, p);

	// quaternion multiplication: p * conj(q), stored back in p
	p = getProductQuaternion(&p, getConjugateQuaternion(q));

	// p quaternion is now [0, x', y', z']
	v->x = p.x;
	v->y = p.y;
	v->z = p.z;
}

VectorFloat getRotatedVectorFloat(VectorFloat* v, Quaternion *q) {
	VectorFloat r={v->x, v->y, v->z};
	rotateFloat(&r, q);
	return r;
}

VectorFloat getAdditionVectorFloat(VectorFloat* v1, VectorFloat v2) {
	VectorFloat v = {v1->x+v2.x, v1->y+v2.y, v1->z+v2.z};
	return v;
}

#endif /* _HELPER_3DMATH_H_ */
