
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.awt.*,
java.awt.image.*,java.util.*,javax.imageio.*" %>


<%!
Color getRandColor(int fc,int bc){
          Random random = new Random();
          if(fc>255) fc=255;
          if(bc>255) bc=255;
          int r=fc+random.nextInt(bc-fc);
          int g=fc+random.nextInt(bc-fc);
          int b=fc+random.nextInt(bc-fc);
          return new Color(r,g,b);
          }
%>
<%

response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
response.setContentType("image/jpeg");

int width=80, height=40;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);


Graphics g = image.getGraphics();


Random random = new Random();


g.setColor(getRandColor(188,250));
g.fillRect(0, 0, width, height);

g.setFont(new Font("Times New Roman",Font.PLAIN,18));


g.setColor(getRandColor(160,200));
for (int i=0;i<50;i++)
{
int x = random.nextInt(width);
int y = random.nextInt(height);
          int xl = random.nextInt(20);
          int yl = random.nextInt(12);
g.drawLine(x,y,x+xl,y+yl);
}


String sRand="";
String rand="";
String[] strarray = {"s","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","j","k","m","n","p","q","r","s","t","u","v","w","x","y","z"};
for (int i=0;i<4;i++){
      rand=strarray[random.nextInt(32)];
      sRand+=rand;

      g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
       Graphics2D g2d = (Graphics2D)g.create();
      g2d.scale(1+(random.nextDouble()+0.01)/2,1+random.nextDouble());

      g2d.drawString(rand,13*i,16);
}
System.out.println(sRand);

g.dispose();


session.setAttribute("checkvalue",sRand);

ImageIO.write(image, "JPEG", response.getOutputStream());
out.clear();
out = pageContext.pushBody();
%>