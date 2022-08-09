package de.unisaarland.digitalisierung.cologger;
/*
 * Created by ian on 08.08.22
 * Location: de.unisaarland.digitalisierung.cologger
 * Created for the project cologger with the name CoLogger
 */

import de.unisaarland.digitalisierung.cologger.i2c.I2CMode;
import de.unisaarland.digitalisierung.cologger.sensor.COSensor;

import java.io.IOException;

public class CoLogger {

    public static void main(String[] args) throws IOException, InterruptedException {
        // small example
        COSensor coSensor = new COSensor(new I2CMode(1));
        System.out.println("SCD30 firmware version: " + coSensor.getFirmwareVersion());

        coSensor.start();
        coSensor.setMeasurementInterval(2);

        int interval = coSensor.getMeasurementInterval() * 1000;
        System.out.println("interval: " + interval + "ms \n~~~");

        for (int i = 0; i < 10; i++) {
            Thread.sleep(interval + 100);
            System.out.println("CO2: " + coSensor.getCo2());
            System.out.println("Temperature: " + coSensor.getTemperature() + " °C");
            System.out.println("Humidity: " + coSensor.getHumidity() + " %\n~~~");
        }

    }


}
