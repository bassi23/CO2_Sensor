package de.unisaarland.digitalisierung.cologger.sensor;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.sensor
 * Created for the project cologger with the name COSensor
 */

public class COSensor {

    public static int MAX_ATTEMPTS = 3;

    private COEventListener eventListener = null;

    private float co2Theshold = 0.1f;
    private float humidityThreshold = 0.1f;
    private float temperatureThreshold = 0.1f;

    private int pressureCompensation = 0;

    // private Mode mode;

    private Thread thread;

    private volatile float co2;
    private volatile float humidity;
    private volatile float temperature;





}
