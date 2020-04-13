/*
 * Copyright (c) 2020.  javazgw@gmail.com
 *
 *
 */

package com.ht.c2c.tools;

public class test {

    public  static  void main(String[] argc)
    {

        int[][] array = new int[2][3];
        System.out.println(array.length);
        if(1==1)
            return;


       /* int x = 0;
        while(1==1)
        {
            x++;
            if(x %1 ==0 && x%2==1 && x%3==0 && x%4==1

            && x %5 ==4 && x%6==3 && x%7==0 && x%8 ==1 && x%9==0 )
            {
                System.out.println(x);
                break;
            }
        }*/

       int w=0,h=0,f=0,y=0;
       while(true)
       {
           for(w=0;w<10;w++)
           {
               for(h=0;h<10;h++)
               {
                   for(f=0;f<10;f++)
                   {
                       for(y=0;y<10;y++)
                       {
                           if((10*f+y)+(100*h+10*f+y)+(1000*w+100*h+10*f+y)==2001)
                           {
                               System.out.println("cnmb");
                               System.out.println(w+"--"+h+"--"+f+"--"+y);
                               System.out.println(w*h*f*y);
                               break;
                           }
                       }
                   }
               }

           }

       }
    }
}
