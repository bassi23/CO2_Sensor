package de.unisaarland.digitalisierung.cologger.i2c;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.i2c
 * Created for the project cologger with the name I2CMode
 */

import com.pi4j.Pi4J;
import com.pi4j.context.Context;
import com.pi4j.io.i2c.I2C;
import com.pi4j.io.i2c.I2CConfig;
import com.pi4j.io.i2c.I2CProvider;
import de.unisaarland.digitalisierung.cologger.sensor.Mode;
import de.unisaarland.digitalisierung.cologger.sensor.ScdException;

import java.io.IOException;

public class I2CMode implements Mode {

    private I2C device;

    public final int DEVICE_ADDRESS = 0x61;

    // messages addresses // headers

    public final short TRIGGER_START = 0x0010;
    public final short TRIGGER_STOP = 0x0104;
    public final short INTERVAL = 0x4600;
    public final short DATA_READY = 0x0202;
    public final short MEASUREMENT = 0x0300;
    public final short FIRMWARE = (short) 0xD100;
    public final short SELF_CALIBRATION = (short) 0x5306;
    public final short RECALIBRATION = (short) 0x5204;
    public final short TEMP_OFFSET = (short) 0x5403;
    public final short ALTITUDE = 0x5102;
    public final short SOFT_RESET = (short) 0xD304;

    public I2CMode(int busIndex) throws IOException {
        Context pi4j = Pi4J.newAutoContext();
        I2CProvider provider = pi4j.provider("linuxfs-i2c");
        I2CConfig i2CConfig = I2C.newConfigBuilder(pi4j).id("SCD30").bus(busIndex).device(DEVICE_ADDRESS).build();
        device = provider.create(i2CConfig);
    }

    @Override
    public void setInterval(int interval) throws ScdException {
        try {
            I2CMessage message = I2CMessage.Factory.writeMessage(INTERVAL, interval);
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public int getInterval() throws ScdException {
        I2CMessage message = I2CMessage.Factory.readMessage(INTERVAL);
        try {
            message.exec(device);
            return message.getNextShort();
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public boolean isDataReady() throws ScdException {
        I2CMessage message = I2CMessage.Factory.readMessage(DATA_READY);
        try {
            message.exec(device);
            return message.getNextShort() == 1;
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public float[] getMeasurement() throws ScdException {
        float[] meas = new float[3];
        I2CMessage message = I2CMessage.Factory.readDataMessage(MEASUREMENT);
        try {
            message.exec(device);

            meas[0] = getAsFloat(message);
            meas[1] = getAsFloat(message);
            meas[2] = getAsFloat(message);
            return meas;
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public String getFirmwareVersion() throws ScdException {
        I2CMessage message = I2CMessage.Factory.readMessage(FIRMWARE);
        try {
            message.exec(device);
            short v = message.getNextShort();
            return ((v >> 2) & 0xFF) + "." + (v & 0x00FF);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void start(int pressureCompensation) throws ScdException {
        I2CMessage message = I2CMessage.Factory.writeMessage(TRIGGER_START, pressureCompensation);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void stop() throws ScdException {
        I2CMessage message = I2CMessage.Factory.writeMessage(TRIGGER_STOP);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void selfCalibration(boolean active) throws ScdException {
        I2CMessage message = I2CMessage.Factory.writeMessage(SELF_CALIBRATION, active ? 1 : 0);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public boolean isSelfCalibration() {
        I2CMessage message = I2CMessage.Factory.readMessage(SELF_CALIBRATION);
        try {
            message.exec(device);
            return message.getNextShort() == 1;
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void setRecalibrationValue(int value) throws ScdException {
        I2CMessage message = I2CMessage.Factory.writeMessage(RECALIBRATION, value);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void setTemperatureOffset(int offset) throws ScdException {
        I2CMessage message = I2CMessage.Factory.writeMessage(TEMP_OFFSET, offset);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public int getTemperatureOffset() {
        I2CMessage message = I2CMessage.Factory.readMessage(TEMP_OFFSET);
        try {
            message.exec(device);
            return message.getNextShort();
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void setAltitudeCompensation(int altitudeLevel) {
        I2CMessage message = I2CMessage.Factory.writeMessage(ALTITUDE, altitudeLevel);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public int getAltitudeCompensation() throws ScdException {
        I2CMessage message = I2CMessage.Factory.readMessage(ALTITUDE);
        try {
            message.exec(device);
            return message.getNextShort();
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    @Override
    public void softReset() {
        I2CMessage message = I2CMessage.Factory.writeMessage(SOFT_RESET);
        try {
            message.exec(device);
        } catch (IOException e) {
            throw new ScdException(e);
        }
    }

    private float getAsFloat(I2CMessage message) {
        short a = message.getNextShort();
        short b = message.getNextShort();

        //System.out.println(Integer.toHexString(a));
        //System.out.println(Integer.toHexString(b));

        int i = a << 16;
        i = i | b & 0xFFFF;
        //System.out.println(Integer.toHexString(i));
        return Float.intBitsToFloat(i);
    }

}
