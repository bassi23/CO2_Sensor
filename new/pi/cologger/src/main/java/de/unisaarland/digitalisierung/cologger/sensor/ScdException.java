package de.unisaarland.digitalisierung.cologger.sensor;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.sensor
 * Created for the project cologger with the name ScdException
 */

public class ScdException extends RuntimeException {

    public ScdException(Exception e) {
        super(e);
    }

    public ScdException(String message) {
        super(message);
    }

}
