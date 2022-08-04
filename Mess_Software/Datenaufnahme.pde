float[][] tutorial_data = new float[10][1000];
int index_tutorial = 0;
float start_time_tutorial = 0;

String[] time_String = new String[999999];
float[] scd_temperature_data = new float[999999];
float[] scd_humidity_data =new float[999999];
float[] scd_co2_data = new float[999999];
float[] sgp_tvoc_data = new float[999999];
float[] sgp_eco2_data =new float[999999];
float[] sps_pm25_data = new float[999999];
float[] sps_pm4_data = new float[999999];
float[] sps_pm10_data = new float[999999];
float[] sps_pm1_data = new float[999999];
float[] zeit = new float[999999];

float[] zwischenSpeicher_SGP_eCO2 = new float[999];
float[] zwischenSpeicher_SGP_TVOC = new float[999];
float[] zwischenSpeicher_SCD_T = new float[999];
float[] zwischenSpeicher_SCD_H = new float[999];
float[] zwischenSpeicher_SCD_CO2 = new float[999];
float[] zwischenSpeicher_SPS_PM1 = new float[999];
float[] zwischenSpeicher_SPS_PM25 = new float[999];
float[] zwischenSpeicher_SPS_PM4 = new float[999];
float[] zwischenSpeicher_SPS_PM10 = new float[999];



float[] Station1_PM1 = new float[500];
float[] Station1_PM25 = new float[500];
float[] Station1_PM4 = new float[500];
float[] Station1_PM10 = new float[500];
float[] Station1_zeit = new float[500];


float[] Station1_PM1_trocken = new float[9999];
float[] Station1_PM25_trocken = new float[9999];
float[] Station1_PM4_trocken = new float[9999];
float[] Station1_PM10_trocken = new float[9999];
float[] Station1_zeit_trocken = new float[9999];

float[] Station1_PM1_nass = new float[999999];
float[] Station1_PM25_nass = new float[999999];
float[] Station1_PM4_nass= new float[999999];
float[] Station1_PM10_nass = new float[999999];
float[] Station1_zeit_nass = new float[999999];

String Daten = null;
int index = 0;
int indexStation1 = 0;
int indexStation1_trocken = 0;
int indexStation1_nass = 0;
float time = 0;
float zeroTime = 0;
int indexZwischenSpeicher = 0;


boolean Station1Start = false;

float del = 1;

String[] BaselineString = {"nicht gesetzt", "nicht gesetzt", "00", "00", "0000", "00", "00"};


float aktuellerTag = 0;
float letzterTag = 0;

boolean savedDay = false;

void Datenaufnahme() {
  // tutorial

  if (tutorial_Start) {
    //if(round(millis()) % 2 == 0){
    //  tutorial_data[9][index_tutorial] = millis() - start_time_tutorial;
    //  index_tutorial += 1;
    //}
  }



  boolean received = false;
  try {
    if (myPort.available() > 0) {
      Daten = myPort.readStringUntil('\n');
      received = true;
      //println(Daten);
    }
  } 
  catch(Exception e) {
    println("Keine Daten");
  }
  if (Daten != null && received) {
    if (index == 0) {
      zeroTime = millis();
    }
    String[] data = split(Daten, ';');
    if (data.length > 8) {

      zwischenSpeicher_SCD_T[indexZwischenSpeicher] = float(data[0]);
      zwischenSpeicher_SCD_H[indexZwischenSpeicher] = float(data[1]);
      zwischenSpeicher_SCD_CO2[indexZwischenSpeicher] = float(data[2]);

      zwischenSpeicher_SPS_PM1[indexZwischenSpeicher] = float(data[3]);
      zwischenSpeicher_SPS_PM25[indexZwischenSpeicher] = float(data[4]);
      zwischenSpeicher_SPS_PM4[indexZwischenSpeicher] = float(data[5]);
      zwischenSpeicher_SPS_PM10[indexZwischenSpeicher] = float(data[6]);

      zwischenSpeicher_SGP_eCO2[indexZwischenSpeicher] = float(data[7]);
      zwischenSpeicher_SGP_TVOC[indexZwischenSpeicher] = float(data[8]);  


      indexZwischenSpeicher += 1;
      //myPort.clear();
      zeit[index] = (millis() - zeroTime)/1000;
      if ( millis() - time > 1000*del) {
        ////
        scd_temperature_data[index] =0;
        scd_humidity_data[index] = 0;
        scd_co2_data[index] = 0;
        ////
        sgp_eco2_data[index] = 0;
        sgp_tvoc_data[index] = 0;
        ///
        sps_pm1_data[index] = 0;
        sps_pm25_data[index] =0;
        sps_pm4_data[index] = 0;
        sps_pm10_data[index] = 0;

        for (int i = 0; i < indexZwischenSpeicher; i++) {
          ////
          scd_temperature_data[index] += zwischenSpeicher_SCD_T[i];
          scd_humidity_data[index] += zwischenSpeicher_SCD_H[i];
          scd_co2_data[index] += zwischenSpeicher_SCD_CO2[i];
          ////
          sgp_eco2_data[index] += zwischenSpeicher_SGP_eCO2[i];
          sgp_tvoc_data[index] += zwischenSpeicher_SGP_TVOC[i];
          ///
          sps_pm1_data[index] += zwischenSpeicher_SPS_PM1[i];
          sps_pm25_data[index] +=zwischenSpeicher_SPS_PM25[i];
          sps_pm4_data[index] += zwischenSpeicher_SPS_PM4[i];
          sps_pm10_data[index] += zwischenSpeicher_SPS_PM10[i];
        }
        scd_temperature_data[index] = scd_temperature_data[index]/(indexZwischenSpeicher);
        scd_humidity_data[index] = scd_humidity_data[index]/(indexZwischenSpeicher);
        scd_co2_data[index] = scd_co2_data[index]/(indexZwischenSpeicher);

        sgp_eco2_data[index] = sgp_eco2_data[index]/(indexZwischenSpeicher);
        sgp_tvoc_data[index] = sgp_tvoc_data[index]/(indexZwischenSpeicher);

        sps_pm1_data[index] = sps_pm1_data[index]/(indexZwischenSpeicher);
        sps_pm25_data[index] = sps_pm25_data[index]/(indexZwischenSpeicher);
        sps_pm4_data[index] = sps_pm4_data[index]/(indexZwischenSpeicher);
        sps_pm10_data[index] = sps_pm10_data[index]/(indexZwischenSpeicher);

        indexZwischenSpeicher = 0;
        if (measure) {
          index += 1;
          tagesIndex += 1;
        }

        if (MenschSensorMessen && page == 2.2 && messen_Station2) {
          if (index > 2 && prob > 0) {
            MenschSensorMesswerte[prob-1][indexMenschSensor] = sgp_tvoc_data[index-2];
            // Zeit 1.
            if (prob == 1) {
              MenschSensorMesswerte[5][indexMenschSensor] = zeit[index - 1];
            }
            // Zeit 2.
            if (prob == 2) {
              MenschSensorMesswerte[6][indexMenschSensor] = zeit[index - 1];
            }
            // Zeit 3.
            if (prob == 3) {
              MenschSensorMesswerte[7][indexMenschSensor] = zeit[index - 1];
            }
            // Zeit 4.
            if (prob == 4) {
              MenschSensorMesswerte[8][indexMenschSensor] = zeit[index - 1];
            }
            // Zeit 5.
            if (prob == 5) {
              MenschSensorMesswerte[9][indexMenschSensor] = zeit[index - 1];
            }
            indexMenschSensor += 1;
          }
        }

        if (Station4agestartet) {
          if (index > 1 && (millis() - currentTime4a)/1000 < (time_Station4+2*del + 0.5)) {
            Innenraumlufta[0][indexInnenraumlufta] =  scd_temperature_data[index-1];
            Innenraumlufta[1][indexInnenraumlufta] =  scd_humidity_data[index-1];
            Innenraumlufta[2][indexInnenraumlufta] =  scd_co2_data[index-1];
            Innenraumlufta[3][indexInnenraumlufta] =  sgp_tvoc_data[index-1];
            Innenraumlufta[4][indexInnenraumlufta] =  sgp_eco2_data[index-1];
            Innenraumlufta[6][indexInnenraumlufta] = zeit[index - 1]- currentTime4a/1000;
            indexInnenraumlufta += 1;
          }
        }

        if (Station4bgestartet) {
          if (index > 1 && (millis() - currentTime4b)/1000 < ((time_Station4+2*del + 0.5))) {
            Innenraumluftb[0][indexInnenraumluftb] =  scd_temperature_data[index-1];
            Innenraumluftb[1][indexInnenraumluftb] =  scd_humidity_data[index-1];
            Innenraumluftb[2][indexInnenraumluftb] =  scd_co2_data[index-1];
            Innenraumluftb[3][indexInnenraumluftb] =  sgp_tvoc_data[index-1];
            Innenraumluftb[4][indexInnenraumluftb] =  sgp_eco2_data[index-1];
            Innenraumluftb[6][indexInnenraumluftb] = zeit[index - 1]- currentTime4b/1000;
            indexInnenraumluftb += 1;
          }
        }
        if (Station4cgestartet) {
          if (index > 1 && (millis() - currentTime4c)/1000  < (time_Station4+2*del + 0.5)) {
            Innenraumluftc[0][indexInnenraumluftc] =  scd_temperature_data[index-2];
            Innenraumluftc[1][indexInnenraumluftc] =  scd_humidity_data[index-2];
            Innenraumluftc[2][indexInnenraumluftc] =  scd_co2_data[index-2];
            Innenraumluftc[3][indexInnenraumluftc] =  sgp_tvoc_data[index-2];
            Innenraumluftc[4][indexInnenraumluftc] =  sgp_eco2_data[index-2];
            Innenraumluftc[6][indexInnenraumluftc] = zeit[index - 1]- currentTime4c/1000;
            indexInnenraumluftc += 1;
          }
        }


        if (Station1Start) {
          if (page == 1.9) {// Kreide A
            Station1_PM1[indexStation1] = sps_pm1_data[index-2];
            Station1_PM25[indexStation1] = sps_pm25_data[index-2];
            Station1_PM4[indexStation1] = sps_pm4_data[index-2];
            Station1_PM10[indexStation1] = sps_pm10_data[index-2];
            Station1_zeit[indexStation1] = (millis())/1000;
            if (Station1_zeit[indexStation1] - Station1_zeit[0] > gesamtzeit_station1) {
              Station1Start = false;
            }
            if (indexStation1 < 499) {
              indexStation1 += 1;
            }
          }
        }
        if (Station1_trocken_Start) {
          if (page == 1.911) { // KreideB

            Station1_PM1_trocken[indexStation1_trocken] = sps_pm1_data[index-2];
            Station1_PM25_trocken[indexStation1_trocken] = sps_pm25_data[index-2];
            Station1_PM4_trocken[indexStation1_trocken] = sps_pm4_data[index-2];
            Station1_PM10_trocken[indexStation1_trocken] = sps_pm10_data[index-2];
            Station1_zeit_trocken[indexStation1_trocken] = (millis())/1000;
            if (Station1_zeit[indexStation1_trocken] - Station1_zeit_trocken[0] > gesamtzeit_station1) {
              Station1_trocken_Start = false;
            }
            if (indexStation1_trocken < 499) {
              indexStation1_trocken += 1;
            }
          }
        }

        time = millis();
        myPort.clear();
        zeit[index] = (millis() - zeroTime2)/1000;
        time_String[index] = str(day()) + "." + str(month())+ "." + str(year()) + " " + str(hour()) + ":" + str(minute()) + ":" + str(second());
      }
    } else if (data.length == 3) {
      BaselineString[0] = data[0];
      BaselineString[1] = data[1];
      BaselineString[2] = nf(day(), 2, 0).toString();
      BaselineString[3] = nf(month(), 2, 0).toString();
      BaselineString[4] = nf(year(), 4, 0).toString();
      BaselineString[5] = nf(hour(), 2, 0).toString();
      BaselineString[6] = nf(minute(), 2, 0).toString();
      myPort.clear();
      Daten = null;
    } else {
      myPort.clear();
      Daten = null;
    }
  }
}
