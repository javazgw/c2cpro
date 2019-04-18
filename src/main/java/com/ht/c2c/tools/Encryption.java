package com.ht.c2c.tools;

public class Encryption {
    /**
     * 加密和解密,
     * @param str
     * @return
     * encryption.sampleEncodeAndDecode(request.getParameter("pnum"))
     */
    public static String    sampleEncodeAndDecode(String str)
    {
        byte[] b = str.getBytes();

        for(int i=0;i<b.length;i++)
        {


            b[i]=(byte)(b[i]^1);

        }
        return new String(b)   ;
    }
}
