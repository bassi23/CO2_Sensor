void checkConnection() {

  //Kommt auf das Aktualisierungsintervall an. Wenn del == 0 --> vergleiche 10 Werte. Ansonsten 1-3
  if (del == 0) {
    if (index > 10) {
      //SCD30
      boolean scd_connected = false;
      if (scd_co2_data[index - 10] != scd_co2_data[index-1] ||scd_co2_data[index - 10] != scd_co2_data[index-2] ||scd_co2_data[index - 10] != scd_co2_data[index-4] ||scd_co2_data[index - 10] != scd_co2_data[index-6] ||scd_co2_data[index - 10] != scd_co2_data[index-3] ||scd_co2_data[index - 10] != scd_co2_data[index-8] ||scd_co2_data[index - 10] != scd_co2_data[index-9] || scd_co2_data[index - 10] != scd_co2_data[index-7] ||  scd_co2_data[index - 10] != scd_co2_data[index - 5]) {
        scd_connected = true;
      }

      connected[0] = scd_connected;

      //SGP
      boolean sgp_connected = false;

      if (sgp_tvoc_data[index - 10] != sgp_tvoc_data[index-1] || sgp_tvoc_data[index - 10] != sgp_tvoc_data[index-3] ||sgp_tvoc_data[index - 10] != sgp_tvoc_data[index-7] ||sgp_tvoc_data[index - 10] != sgp_tvoc_data[index - 5]) {
        sgp_connected = true;
      }
      connected[1] = sgp_connected;

      //SPS
      boolean sps_connected = false;

      if (sps_pm10_data[index - 10] != sps_pm10_data[index-1] || sps_pm10_data[index - 10] != sps_pm10_data[index-3] ||sps_pm10_data[index - 10] != sps_pm10_data[index-7] ||sps_pm10_data[index - 10] != sps_pm10_data[index - 5]) {
        sps_connected = true;
      }
      connected[2] = sps_connected;
    }
  } else {
    if (index > 3) {
      // Vergleiche die letzten 3 Messwerte. Wenn sie sich nicht ändern, ist der Sensor nicht verbunden
      //SCD30
      if (scd_temperature_data[index - 3] == scd_temperature_data[index - 2] && scd_temperature_data[index - 3] == scd_temperature_data[index - 1] 
        && scd_humidity_data[index - 3] == scd_humidity_data[index - 2] && scd_humidity_data[index - 3] == scd_humidity_data[index - 1]
        && scd_co2_data[index - 3] == scd_co2_data[index - 2] && scd_co2_data[index - 3] == scd_co2_data[index - 1]) {
        connected[0] = false;
      } else {
        connected[0] = true;
      }
      //SPS30
      if (sps_pm1_data[index - 3] == sps_pm1_data[index - 2] && sps_pm1_data[index - 3] == sps_pm1_data[index - 1]
        && sps_pm25_data[index - 3] == sps_pm25_data[index - 2] && sps_pm25_data[index - 3] == sps_pm25_data[index - 1]
        && sps_pm4_data[index - 3] == sps_pm4_data[index - 2] && sps_pm4_data[index - 3] == sps_pm4_data[index - 1]
        && sps_pm10_data[index - 3] == sps_pm10_data[index - 2] && sps_pm10_data[index - 3] == sps_pm10_data[index - 1]) {
        connected[1] = false;
      } else {
        connected[1] = true;
      }
      //SGP
      if (sgp_eco2_data[index - 3] == sgp_eco2_data[index - 2] && sgp_eco2_data[index - 3] == sgp_eco2_data[index - 1]
        && sgp_tvoc_data[index - 3] == sgp_tvoc_data[index - 2] && sgp_tvoc_data[index - 3] == sgp_tvoc_data[index - 1]) {
        connected[2] = false;
      } else {
        connected[2] = true;
      }
    }
  }

  if (page == -2) {
    textAlign(CENTER);
    textSize(26);
    if (connected[0]) {
      fill(0, 255, 0);
      text("verbunden", 210, 210);
    } else {
      fill(255, 0, 0);
      text("nicht verbunden", 210, 210);
    }


    if (connected[2]) {
      fill(0, 255, 0);
      text("verbunden", 210, 425);
    } else {
      fill(255, 0, 0);
      text("nicht verbunden", 210, 425);
    }

    if (connected[1]) {
      fill(0, 255, 0);
      text("verbunden", 210, 630);
    } else {
      fill(255, 0, 0);
      text("nicht verbunden", 210, 630);
    }
  } else {
    if (connected[0]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    ellipse(80, 380, 50, 50);

    if (connected[2]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    ellipse(420, 80, 50, 50);

    if (connected[1]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    ellipse(820, 80, 50, 50);
  }
}
