package com.MVCStart;


import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.MVCStart.DBConfig.EmailConfig;


public class AppTest2 
{
     
     @BeforeClass
     public static void myInit() {
    	 @SuppressWarnings("resource")
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
    	 context.register(EmailConfig.class);
    	 context.refresh();
    	 
     }
     
     @Test
     public void hello() {
    	 
     }
     
   }
