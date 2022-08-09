package de.unisaarland.digitalisierung.cologger.sensor;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.sensor
 * Created for the project cologger with the name Event
 */

public class Event {

    private float value;
    private Type type;

    public Event(float value, Type type) {
        this.value = value;
        this.type = type;
    }

    public float getValue() {
        return value;
    }

    public Type getType() {
        return type;
    }

    public enum Type {
        CO2, HUMID, TEMP;
    }
}
