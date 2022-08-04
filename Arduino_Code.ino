
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Wire.h"
#define BUFFER_LENGTH 64
#define scd_debug 0
#include "paulvha_SCD30.h"

SCD30 airSensor;

void setup() {
  Wire.begin();
  Serial.begin(57600);
  airSensor.setDebug(scd_debug);
  airSensor.begin(Wire);
}

float co2 = 0;
float t_scd = 0;
float h_scd = 0;


void loop() {
  

  if (airSensor.dataAvailable())  {
    co2 = float(airSensor.getCO2());
    t_scd = float(airSensor.getTemperature());
    h_scd = float(airSensor.getHumidity());
  }
 

  Serial.print(t_scd);
  Serial.print(";");
  Serial.print(h_scd);
  Serial.print(";");
  Serial.print(co2);
  Serial.println(";");
  delay(200);



  if (Serial.available() > 0) {
    int incomingByte = 0;
    incomingByte = Serial.read();
    if (incomingByte != 0) {
      // sgp.set_iaq_baseline();

    }
  }
}
