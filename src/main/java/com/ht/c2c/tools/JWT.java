package com.ht.c2c.tools;



import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;


import java.security.Key;
import java.util.Date;

/**
 * JwtToken生成的工具类
 * JWT token的格式：header.payload.signature
 * header的格式（算法、token的类型）：
 * {"alg": "HS512","typ": "JWT"}
 * payload的格式（用户名、创建时间、生成时间）：
 * {"sub":"wang","created":1489079981393,"exp":1489684781}
 * signature的生成算法：
 * HMACSHA512(base64UrlEncode(header) + "." +base64UrlEncode(payload),secret)
 *
 */
/*


Header

{
  "alg": "HS256",
  "typ": "JWT"
}

Payload

iss (issuer)：签发人
        exp (expiration time)：过期时间
        sub (subject)：主题
        aud (audience)：受众
        nbf (Not Before)：生效时间
        iat (Issued At)：签发时间
        jti (JWT ID)：编号
Signature


 */



public class JWT {

     static final String scretkey = "1212121234567890123456789012345678901234567890123333";
    public static SecretKey generalKey() {

        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary (scretkey);
        SecretKey signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm. getJcaName());

        return signingKey;

    }

    /**
     * 签发JWT
     * @param id
     * @param subject
     * @param ttlMillis
     * @return
     * @throws Exception
     */
    public static String createJWT(String id, String subject, long ttlMillis) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        SecretKey secretKey = generalKey();
        JwtBuilder builder = Jwts.builder()
                .setId(id)
                .setSubject(subject)
                .setIssuedAt(now)
                .signWith(signatureAlgorithm, secretKey);
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date expDate = new Date(expMillis);
            builder.setExpiration(expDate);
        }
        return builder.compact();
    }

    /**
     * 验证JWT
     * @param jwtStr
     * @return
     */
    public static void validateJWT(String jwtStr) {

        Claims claims = null;

        try {
            claims = parseJWT(jwtStr);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    /**
     *
     * 解析JWT字符串
     * @param jwt
     * @return
     * @throws Exception
     */
    public static Claims parseJWT(String jwt) throws Exception {
        SecretKey secretKey = generalKey();
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(jwt)
                .getBody();
    }


    public static void main(String[] argc) throws Exception {
//        JWT jwt = new JWT();
//        String str = createJWT("","",11111);
//        System.out.println(str);
        long nowMillis = System.currentTimeMillis();
        long ttlMillis =36000;
        Date now = new Date(nowMillis);
//        Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
        Key key =generalKey();
        JwtBuilder builder = Jwts.builder();
         builder.setSubject("Joe")
                .setIssuedAt(now)
                 .signWith(key);
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date expDate = new Date(expMillis);
            builder.setExpiration(expDate);
        }
        String jws = builder.compact();
        System.out.println(jws);

        System.out.println(parseJWT(jws));

         String str = "random_secret_key";
        String base64Key = DatatypeConverter.printBase64Binary(str.getBytes());
        byte[] secretBytes = DatatypeConverter.parseBase64Binary(base64Key);
        System.out.println(base64Key);

        System.out.println(secretBytes);

        String jwt  = createJWT("zgw","zgwname",10000);
        System.out.println(jwt);
        System.out.println(parseJWT(jwt));


    }

}
