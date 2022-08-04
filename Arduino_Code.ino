
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Wire.h"
#define BUFFER_LENGTH 64
#define scd_debug 0
#include "paulvha_SCD30.h"
#include "Adafruit_SGP30.h"

Adafruit_SGP30 sgp;
SCD30 airSensor;

byte w1, w2, w3;
byte ND[60];
long tmp;
float measure;
int Address = 0x69;

void setup() {
  Wire.begin();
  Serial.begin(57600);
  airSensor.setDebug(scd_debug);
  if (! sgp.begin()) {
    //Serial.println("Sensor not found :(");
    //while (1);
  }
  airSensor.begin(Wire);
}

float co2 = 0;
float t_scd = 0;
float h_scd = 0;

float pm25 = 0;
float pm10 = 0;
float pm4 = 0;
float pm1 = 0;

int tvoc = 0;
int eco2 = 0;

void loop() {
  Wire.beginTransmission(Address);
  Wire.write(0x00);
  Wire.write(0x10);
  Wire.write(0x03);
  Wire.write(0x00);
  uint8_t data[2] = {0x03, 0x00};
  Wire.write(CalcCrc(data));
  Wire.endTransmission();
  SetPointer(0x02, 0x02);
  Wire.requestFrom(Address, 3);
  w1 = Wire.read();
  w2 = Wire.read();
  w3 = Wire.read();
  float tempo[60];
  for (int i = 0; i < 60; i++) {
    tempo[i] = 0;
  }
  if (w2 == 0x01) {           //0x01: new measurements ready to read
    SetPointer(0x03, 0x00);
    Wire.requestFrom(Address, 60);
    for (int i = 0; i < 60; i++) {
      ND[i] = Wire.read();
    }
    for (int i = 0; i < 60; i++) {
      if ((i + 1) % 3 == 0) {
        byte datax[2] = {ND[i - 2], ND[i - 1]};
        if (tmp == 0) {
          tmp = ND[i - 2];
          tmp = (tmp << 8) + ND[i - 1];
        }
        else {
          tmp = (tmp << 8) + ND[i - 2];
          tmp = (tmp << 8) + ND[i - 1];
          tempo[i] = measure;
          measure = (*(float*) &tmp);
          if (i == 5) {
            pm1 = measure;
          }
          if (i == 11) {
            pm25 = measure;
          }
          if (i == 17) {
            pm4 = measure;
          }
          if (i == 23) {
            pm10 = measure;
          }
          tmp = 0;
        }
      }
    }
  }

  if (airSensor.dataAvailable())  {
    co2 = float(airSensor.getCO2());
    t_scd = float(airSensor.getTemperature());
    h_scd = float(airSensor.getHumidity());
  }
  if (sgp.IAQmeasure()) {
    sgp.setHumidity(getAbsoluteHumidity(t_scd, h_scd));
    tvoc = int(sgp.TVOC);
    eco2 = int(sgp.eCO2);
  }

  Serial.print(t_scd);
  Serial.print(";");
  Serial.print(h_scd);
  Serial.print(";");
  Serial.print(co2);
  Serial.print(";");
  Serial.print(pm1);
  Serial.print(";");
  Serial.print(pm25);
  Serial.print(";");
  Serial.print(pm4);
  Serial.print(";");
  Serial.print(pm10);
  Serial.print(";");
  Serial.print(eco2);
  Serial.print(";");
  Serial.print(tvoc);
  Serial.println(";");
  delay(200);



  if (Serial.available() > 0) {
    int incomingByte = 0;
    incomingByte = Serial.read();
    if (incomingByte != 0) {
      // sgp.set_iaq_baseline();
      uint16_t TVOC_base, eCO2_base;
      sgp.getIAQBaseline(&eCO2_base, &TVOC_base);
      Serial.print("0x");
      Serial.print(eCO2_base, HEX);
      Serial.print(";");
      Serial.print("0x");
      Serial.print(TVOC_base, HEX);
      Serial.println(";");
      sgp.setIAQBaseline(eCO2_base, TVOC_base);
      delay(1000);
    }
  }
}



void SetPointer(byte P1, byte P2) {
  Wire.beginTransmission(Address);
  Wire.write(P1);
  Wire.write(P2);
  Wire.endTransmission();
}

// from datasheet:
byte CalcCrc(byte data[2]) {
  byte crc = 0xFF;
  for (int i = 0; i < 2; i++) {
    crc ^= data[i];
    for (byte bit = 8; bit > 0; --bit) {
      if (crc & 0x80) {
        crc = (crc << 1) ^ 0x31u;
      } else {
        crc = (crc << 1);
      }
    }
  }
  return crc;
}

uint32_t getAbsoluteHumidity(float temperature, float humidity) {
  // approximation formula from Sensirion SGP30 Driver Integration chapter 3.15
  const float absoluteHumidity = 216.7f * ((humidity / 100.0f) * 6.112f * exp((17.62f * temperature) / (243.12f + temperature)) / (273.15f + temperature)); // [g/m^3]
  const uint32_t absoluteHumidityScaled = static_cast<uint32_t>(1000.0f * absoluteHumidity); // [mg/m^3]
  return absoluteHumidityScaled;
}
