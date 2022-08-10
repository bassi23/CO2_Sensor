package de.unisaarland.digitalisierung;

import de.unisaarland.digitalisierung.i2c.I2CMode;
import de.unisaarland.digitalisierung.sensor.COSensor;

import java.io.IOException;

/**
 * Hello world!
 */
public class App {
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
