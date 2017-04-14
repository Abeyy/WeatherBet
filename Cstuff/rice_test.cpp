#include "rice/Class.hpp"
#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"
#include <iostream>
#include <math.h>
using namespace Rice;
// using namespace std;


int rice_fibonacci(int n) {
  int a = 1, b = 1, c, i;
  if (n == 0) {
    return 0;
  }
  for (i = 3; i <= n; i++) {
    c = a + b;
    a = b;
    b = c;
  }
  return b;
}
int rice_factorial(int max) {
  int i=max, result=1;
  while (i >= 2) { result *= i--; }
  return result;
}
int rice_pow(int a, int n) {
  return pow(a, n);
}

float rice_laplace(float x, float n) {
  return (x+1)/(n+2);
}

#include <cmath> 
#define pi 3.14159265358979323846
#define earthRadiusKm 6371.0

// This function converts decimal degrees to radians
double deg2rad(double deg) {
  return (deg * pi / 180);
}

//  This function converts radians to decimal degrees
double rad2deg(double rad) {
  return (rad * 180 / pi);
}

/**
 * Returns the distance between two points on the Earth.
 * Direct translation from http://en.wikipedia.org/wiki/Haversine_formula
 * @param lat1d Latitude of the first point in degrees
 * @param lon1d Longitude of the first point in degrees
 * @param lat2d Latitude of the second point in degrees
 * @param lon2d Longitude of the second point in degrees
 * @return The distance between the two points in kilometers
 */
#define pi 3.14159265358979323846
#define earthRadiusKm 6371.0

double rice_distanceEarth(double lat1d, double lon1d, double lat2d, double lon2d) {
  double lat1r, lon1r, lat2r, lon2r, u, v;
  lat1r = deg2rad(lat1d);
  lon1r = deg2rad(lon1d);
  lat2r = deg2rad(lat2d);
  lon2r = deg2rad(lon2d);
  u = sin((lat2r - lat1r)/2);
  v = sin((lon2r - lon1r)/2);
  return 2.0 * earthRadiusKm * asin(sqrt(u * u + cos(lat1r) * cos(lat2r) * v * v));
}

String rice_hello() {
  return "hello";
}

class WbStat {
  public:
    float rice_laplacee(float x, float n) { return (x+1) / (n+2); }
    float rice_laplace() { return rice_laplacee(numCorrect, total); }
   
    float rice_jeffreyss(float x, float n) { return (x+0.5) / (n+1); }
    float rice_jeffreys() { return rice_jeffreyss(numCorrect, total); }
   
    float rice_mlee(float x, float n) { return x / n; } 
    float rice_mle() { return rice_mlee(numCorrect, total); }

    float rice_zscore(float x, float mean, float std_div) {
      return (x - mean) / std_div;
    }

    void setCorrect(int correct) { numCorrect = correct; }
    int getCorrect() { return numCorrect; }
    void setTotal(int numtotal) { total = numtotal; }
    int getTotal() { return total; }

  private:
    int numCorrect;
    int total;
};


extern "C"

void Init_rice_test()
{
  Data_Type<WbStat> rb_cWbStat = define_class<WbStat>("WbStat").
    define_constructor(Constructor<WbStat>()).
    define_method("laplace", &WbStat::rice_laplace).
    define_method("jeffreys", &WbStat::rice_jeffreys).
    define_method("mle", &WbStat::rice_mle).
    define_method("zscore", &WbStat::rice_zscore).
    define_method("total=", &WbStat::setTotal).
    define_method("correct=", &WbStat::setCorrect).
    define_method("correct", &WbStat::getCorrect).
    define_method("total", &WbStat::getTotal);

  Class rb_cRiceTest = define_class("RiceTest")
    .define_method("fibonacci", &rice_fibonacci)
    .define_method("factorial", &rice_factorial)
    .define_method("pow", &rice_pow)
    .define_method("hello", &rice_hello)
    .define_method("distanceEarth", &rice_distanceEarth)
    .define_method("laplace", &rice_laplace);
}
