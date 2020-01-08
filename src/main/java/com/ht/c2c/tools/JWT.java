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
     private static JWT jwt = null;
    SecretKey signingKey = null;

    private Long expiration;
    private  long expmillis=3600*24*365*1000;
     private JWT()
     {

     }

     public static  JWT getInstance()
     {
         if(jwt == null)
             jwt = new JWT();
         return jwt;
     }

    public  SecretKey generalKey() {

         if(  signingKey == null) {
             SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
             byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(scretkey);
             signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());
         }

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
    public  String createJWT(String id, String subject, long ttlMillis) {
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        Key key =generalKey();
        JwtBuilder builder = Jwts.builder();
        builder.setSubject(subject)
                .setId(id)
                .setIssuedAt(now)

                .signWith(key);
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date expDate = new Date(expMillis);
            builder.setExpiration(expDate);
        }
        String jws = builder.compact();
        return jws;

    }

    /**
     * 验证JWT
     * @param jwtStr
     * @return
     */
    public  Claims validateJWT(String jwtStr) {

        Claims claims = null;

        try {
            claims = parseJWT(jwtStr);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return claims ;


    }

    /**
     *
     * 解析JWT字符串
     * @param jwt
     * @return
     * @throws Exception
     */
    public  Claims parseJWT(String jwt) throws Exception {
        SecretKey secretKey = generalKey();
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(jwt)
                .getBody();
    }

    /**
     * 从token中获取登录用户名
     */
    public String getUserNameFromToken(String token) {
        String username;
        try {
            Claims claims = validateJWT(token);
            username = claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }
    /**
     * 验证token是否还有效
     *
     * @param token       客户端传入的token
     * @param name 从数据库中查询出来的用户信息
     */
    public boolean validateToken(String token, String name) {
        String username = getUserNameFromToken(token);
        return username.equals(username) && !isTokenExpired(token);
    }

    /**
     * 判断token是否已经失效
     */
    private boolean isTokenExpired(String token) {
        Date expiredDate = getExpiredDateFromToken(token);
        return expiredDate.before(new Date());
    }
    /**
     * 从token中获取过期时间
     */
    private Date getExpiredDateFromToken(String token) {
        Claims claims = validateJWT(token);
        return claims.getExpiration();
    }

    /**
     * 刷新token 报错说明过期或其他原因，返回null
     * 前端要重新登陆了
     *
     * @param token
     * @return
     */
    public String refreshToken(String token)
    {
        Claims claims  = null;
        try {
            claims = parseJWT(token);
            String id = claims.getId();
            String username = claims.getSubject();
            token = createJWT(id,username,expmillis);
            return token;
        } catch (Exception e) {
            e.printStackTrace();
        }

    return null;

    }
    public static void main(String[] argc) throws Exception {

      /*  long nowMillis = System.currentTimeMillis();
        long ttlMillis =36000;
        Date now = new Date(nowMillis);

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

        String jwt  = createJWT("123322","zgwname",10000);
        System.out.println(jwt);
        System.out.println(parseJWT(jwt));*/

        String jwt =  JWT.getInstance().createJWT("112","zgw",1000000);

        System.out.println(jwt);
        System.out.println(JWT.getInstance().parseJWT(jwt));

        jwt = JWT.getInstance().refreshToken(jwt);

        System.out.println(jwt);
        System.out.println(JWT.getInstance().parseJWT(jwt));
    }

}
