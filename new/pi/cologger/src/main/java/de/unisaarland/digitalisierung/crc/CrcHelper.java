package de.unisaarland.digitalisierung.crc;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.crc
 * Created for the project cologger with the name CrcHelper
 */

public class CrcHelper {
    static long ReverseBits(long ul, int valueLength) {
        long newValue = 0;
        for (int i = 0; i < valueLength - 1; i++) {
            newValue |= (ul & 1) << i;
            ul >>= 1;
        }
        return newValue;
    }
}
