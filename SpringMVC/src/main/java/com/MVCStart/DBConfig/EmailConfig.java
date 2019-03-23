package com.MVCStart.DBConfig;

import java.util.Properties;

import javax.mail.Transport;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
@ComponentScan("com.MVCStart")
public class EmailConfig {
 
	@Bean("mailSender")
	public JavaMailSender getMailSender() {
		System.out.println("I m get Mail Sender");
	
		JavaMailSenderImpl  mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(465);
		mailSender.setUsername("vaishaliniit2019@gmail.com");
		mailSender.setPassword("vaishali12@");
		mailSender.setJavaMailProperties(getMailProperties());
		
		System.out.println("I m get Mail Sender ends....");
		
		return mailSender;
		
	} 

	private Properties getMailProperties() {
		
		System.out.println("I m get Mail Properties");
		// TODO Auto-generated method stub
	    Properties mailProperties = new Properties();
		mailProperties.put("mail.transport.protocol", "smtp");
		mailProperties.put("mail.smtp.auth", "true");
		mailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		mailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		mailProperties.put("mail.smtp.starttls.required", "true");
		mailProperties.put("mail.debug", "true");
		mailProperties.put("mail.smtp.port", 465);

		System.out.println("I m get Mail Properties ends.........");
		return mailProperties;
		
	}
}
