package de.unisaarland.digitalisierung.sensor;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.sensor
 * Created for the project cologger with the name COSensor
 */

import de.unisaarland.digitalisierung.ScdException;

public class COSensor {

    public static int MAX_ATTEMPTS = 3;

    private COEventListener eventListener = null;

    private float co2Theshold = 0.1f;
    private float humidityThreshold = 0.1f;
    private float temperatureThreshold = 0.1f;

    private int pressureCompensation = 0;

    private Mode mode;

    private Thread thread;

    private volatile float co2;
    private volatile float humidity;
    private volatile float temperature;

    public COSensor(Mode mode) {
        this.mode = mode;
    }

    public void setEventListener(COEventListener eventListener) {
        this.eventListener = eventListener;
    }

    public float getCo2() {
        return co2;
    }

    public float getHumidity() {
        return humidity;
    }

    public float getTemperature() {
        return temperature;
    }

    public void start() {

        if (thread != null) {
            System.out.println("thread isn't null!");
            return;
        }

        thread = new Thread(() -> {
            mode.start(pressureCompensation);
            int interval = (getMeasurementInterval() * 1000) + 100;

            main:
            while (!Thread.interrupted()) {
                try {
                    Thread.sleep(interval);
                } catch (InterruptedException e) {
                    return;
                }

                for (int i = 0; i < MAX_ATTEMPTS; i++) {
                    try {
                        if (!mode.isDataReady()) {
                            continue main;
                        }

                        measurement();
                        continue main;
                    } catch (ScdException e) {
                        if (i == MAX_ATTEMPTS) {
                            e.printStackTrace();
                        }
                        try {
                            Thread.sleep(200);
                        } catch (InterruptedException e1) {
                            e1.printStackTrace();
                        }
                    }
                }
            }

        });

        thread.setDaemon(true);
        thread.setName("scd30-measure-thread");
        thread.start();

    }

    public void stop() {
        if (thread != null) {
            thread.interrupt();
        }

        mode.stop();
    }

    /**
     * Set ambient pressure compensation.
     *
     * @param pressureCompensation 700 to 1400 mBar or 0 as disabled
     */
    public void setPressureCompensation(int pressureCompensation) {
        this.pressureCompensation = pressureCompensation;
    }

    public void setMeasurementInterval(int interval) {

        ScdException exception = null;

        for (int i = 0; i < MAX_ATTEMPTS; i++) {

            try {
                mode.setInterval(interval);

                int getInterval = mode.getInterval();
                if (getInterval == interval) {
                    return; //OK
                } else {
                    throw new ScdException("Set interval: " + interval + " but SCD30 return " + getInterval + " interval.");
                }

            } catch (ScdException e) {
                exception = e;
            }
        }

        if (exception != null) {
            throw exception;
        }
    }

    public int getMeasurementInterval() {

        ScdException exception = null;

        for (int i = 0; i < MAX_ATTEMPTS; i++) {

            try {

                int interval = mode.getInterval();
                return interval;

            } catch (ScdException e) {
                exception = e;
            }
        }

        if (exception != null) {
            throw exception;
        }
        return -1;
    }

    public String getFirmwareVersion() {
        return mode.getFirmwareVersion();
    }

    public void measurement() {
        float[] load = mode.getMeasurement();

        //event handle
        if (eventListener != null) {
            if (Math.abs(load[0] - co2) > co2Theshold) {
                eventListener.event(new Event(load[0], Event.Type.CO2));
            }

            if (Math.abs(load[2] - humidity) > humidityThreshold) {
                eventListener.event(new Event(load[2], Event.Type.HUMID));
            }

            if (Math.abs(load[1] - temperature) > temperatureThreshold) {
                eventListener.event(new Event(load[1], Event.Type.TEMP));
            }
        }

        co2 = load[0];
        temperature = load[1];
        humidity = load[2];
    }

    public float getCo2Threshold() {
        return co2Theshold;
    }

    public void setCo2Threshold(float co2Threshold) {
        this.co2Theshold = co2Threshold;
    }

    public void setHumidityThreshold(float humidityThreshold) {
        this.humidityThreshold = humidityThreshold;
    }

    public void setTemperatureThreshold(float temperatureThreshold) {
        this.temperatureThreshold = temperatureThreshold;
    }

}
