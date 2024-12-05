#include "Wire.h"
#include <MPU6050_light.h>
#include <Servo.h>

MPU6050 mpu(Wire);
Servo servo;

int target_pos = 0;
int imu_angle;
int error=0;
int curr_pos;
int angle;

int t_new; //milliseconds
int t_old; //milliseconds
int dt;

int error_old=0;
float error_change=0;
float error_slope=0;
float error_area=0;

float Kp = 0.35;
float Kd = 25; 
float Ki = 0.0001;

void setup() 
{ 
  Wire.begin(); 
  mpu.begin();
  servo.attach(9); 
  Serial.begin(9600);
  servo.write(90);
  delay(2000);
  t_new = millis();
  delay(20);
}


void loop() 
{ mpu.update(); //update imu values
  imu_angle = mpu.getAngleX();

  curr_pos = servo.read();
  
  //----- PID control starts here -----//
  t_old = t_new;
  t_new = millis();
  dt = t_new - t_old;

  error_old = error;
  error = target_pos - imu_angle;

  error_change = error-error_old;
  error_slope = error_change/dt;

  error_area = error_area + error*dt;

  angle = curr_pos - (Kp*error + Kd*error_slope + Ki*error_area);  
  if (angle > 180){
    angle = 180;
  }
  if (angle < 0){
    angle = 0;
  }
  Serial.println(error);
  servo.write(angle);
  delay(20);
}
