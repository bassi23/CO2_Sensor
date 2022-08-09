package de.unisaarland.digitalisierung.cologger.crc;
/*
 * Created by ian on 09.08.22
 * Location: de.unisaarland.digitalisierung.cologger.crc
 * Created for the project cologger with the name CrcCalculator
 */

public class CrcCalculator {

    public AlgorithmicParams params;
    public byte HashSize = 8;
    private long _mask = 0xFFFFFFFFFFFFFFFFL;
    private long[] _table = new long[256];

    public static final byte[] testBytes = new byte[]{49,50,51,52,53,54,55,56,57};

    public CrcCalculator(AlgorithmicParams p) {
        params = p;
        HashSize = (byte) params.HashSize;
        if (HashSize < 64) {
            _mask = (1L << HashSize) - 1;
        }
        CreateTable();
    }

    public long calc(byte[] data, int offset, int length)
    {
        long init = params.RefOut ? CrcHelper.ReverseBits(params.Init, HashSize) : params.Init;
        long hash = computeCrc(init, data, offset, length);
        return (hash ^ params.XorOut) & _mask;
    }

    private long computeCrc(long init, byte[] data, int offset, int length) {
        long crc = init;

        if (params.RefOut)
        {
            for (int i = offset; i < offset + length; i++)
            {
                crc = (_table[(int)((crc ^ data[i]) & 0xFF)] ^ (crc >>> 8));
                crc &= _mask;
            }
        }
        else
        {
            int toRight = (HashSize - 8);
            toRight = Math.max(toRight, 0);
            for (int i = offset; i < offset + length; i++)
            {
                crc = (_table[(int)(((crc >> toRight) ^ data[i]) & 0xFF)] ^ (crc << 8));
                crc &= _mask;
            }
        }
        return crc;
    }

    private void CreateTable()
    {
        for (int i = 0; i < _table.length; i++)
            _table[i] = CreateTableEntry(i);
    }

    private long CreateTableEntry(int index)
    {
        long r = (long)index;

        if (params.RefIn)
            r = CrcHelper.ReverseBits(r, HashSize);
        else if (HashSize > 8)
            r <<= (HashSize - 8);

        long lastBit = (1L << (HashSize - 1));

        for (int i = 0; i < 8; i++)
        {
            if ((r & lastBit) != 0)
                r = ((r << 1) ^ params.Poly);
            else
                r <<= 1;
        }

        if (params.RefOut)
            r = CrcHelper.ReverseBits(r, HashSize);

        return r & _mask;
    }



}
