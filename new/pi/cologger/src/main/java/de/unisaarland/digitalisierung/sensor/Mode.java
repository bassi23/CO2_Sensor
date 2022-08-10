package de.unisaarland.digitalisierung.sensor;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.sensor
 * Created for the project cologger with the name Mode
 */

public interface Mode {

    void setInterval(int interval);

    int getInterval();

    boolean isDataReady();

    float[] getMeasurement();

    String getFirmwareVersion();

    void start(int pressureCompensation);

    void stop();

    void selfCalibration(boolean active);

    boolean isSelfCalibration();

    void setRecalibrationValue(int value);

    void setTemperatureOffset(int offset);

    int getTemperatureOffset();

    void setAltitudeCompensation(int altitudeLevel)  ;

    int getAltitudeCompensation();

    void softReset();

    static String getHumanMessage(byte[] bytes) {
        return getHumanMessage(bytes, 0, bytes.length);
    }

    static String getHumanMessage(byte[] bytes, int offset, int length) {

        if(bytes==null) {
            return "null";
        }

        StringBuilder sb = new StringBuilder();

        for (int i = offset; i < Math.min(bytes.length, length); i++) {
            String hex = Integer.toHexString(bytes[i] & 0xFF).toUpperCase().trim();
            sb.append(new String(new char[2 - hex.length()]).replace('\0', '0'))
                    .append(hex)
                    .append(" ");
        }

        if (sb.length() > 0) {
            return (sb.subSequence(0, sb.length() - 1)).toString();
        }

        return sb.append(" (").append(bytes.length).append(")").toString();
    }

}
