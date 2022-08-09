package de.unisaarland.digitalisierung.cologger.i2c;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.i2c
 * Created for the project cologger with the name I2CMessage
 */

import com.pi4j.io.i2c.I2C;
import de.unisaarland.digitalisierung.cologger.crc.AlgorithmicParams;
import de.unisaarland.digitalisierung.cologger.crc.CrcCalculator;
import de.unisaarland.digitalisierung.cologger.sensor.Mode;
import de.unisaarland.digitalisierung.cologger.sensor.ScdException;

import java.io.IOException;


public class I2CMessage {

    private final CrcCalculator crc8 = new CrcCalculator(new AlgorithmicParams("CRC-8", 8, 0x31, 0xFF, false, false, 0x00, 0xF4));

    private final byte[] write = new byte[5]; //buffer with maximal length
    private int writeLen = 2; //how many bytes will be written into i2c device

    private byte read[] = null; //read buffer

    private final int writeLoad; //parameter
    private final short message; //address

    //index of 'next short' result
    private int resultIndex = 0;

    private I2CMessage(short message, int load, int responseLength) {
        this.message = message;
        this.writeLoad = load;

        if (responseLength > 0) {
            read = new byte[responseLength];
        }
    }

    private I2CMessage(short message) {
        this(message, -1, -1);
    }

    void exec(I2C device) throws IOException {
        write[0] = (byte) (message >> 8);
        write[1] = (byte) message;

        if (read == null) {

            if (writeLoad >= 0) {
                writeLen = 5;
                write[2] = (byte) (writeLoad >> 8);
                write[3] = (byte) (writeLoad);
                write[4] = (byte) crc8.calc(write, 2, 2);
            }
            device.write(write, 0, writeLen);
        } else {
            device.write(write, 0, writeLen);
            device.read(read, 0, read.length);
            crcCheck(read);
        }
    }

    /**
     * Return next short from read buffer.
     * @return If no next short, -1 is returned
     */
    short getNextShort() {
        return getShortResult(read);
    }

    private void crcCheck(byte[] buffer) {

        for (int i = 0; i < buffer.length; i+=3) {
            if (!(crc8.calc(buffer, i, 2) == (buffer[i+2] & 0xFF))) {
                String input = Mode.getHumanMessage(buffer, i, 2);
                String expected = Integer.toHexString((int) crc8.calc(buffer, i, 2));
                String was = Integer.toHexString(buffer[i+2] & 0xFF);

                throw new ScdException("CRC is not correct! Data: ["+input+"]. Expected crc8: "+expected+", Was crc8:"+was);
            }
        }
    }

    private short getShortResult(byte[] buffer) {

        if (resultIndex < buffer.length) {
            int r = (buffer[resultIndex] & 0xFF) << 8;
            r = r | (buffer[resultIndex+1] & 0xFF);
            resultIndex+=3;

            return (short) r;
        }

        return -1;
    }

    /**
     * Factory message builder. Use this instead constructor.
     */
    static class Factory {

        static I2CMessage writeMessage(short message, int load) {
            return new I2CMessage(message, load, -1);
        }

        static I2CMessage writeMessage(short message) {
            return new I2CMessage(message);
        }

        static I2CMessage readMessage(short message) {
            return new I2CMessage(message, -1, 3);
        }

        static I2CMessage readDataMessage(short message) {
            return new I2CMessage(message, -1, 18);
        }
    }

}
