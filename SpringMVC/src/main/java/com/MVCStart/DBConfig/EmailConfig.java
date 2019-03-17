package com.MVCStart.DBConfig;

import java.util.Properties;

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
		JavaMailSenderImpl  mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smpt.gmail.com");
		mailSender.setPort(567);
		mailSender.setUsername("vaishaligarg2012@gmail.com");
		mailSender.setPassword("sonali12@");
		mailSender.setJavaMailProperties(getMailProperties());
		
		return mailSender;
		
	}

	private Properties getMailProperties() {
		// TODO Auto-generated method stub
	 Properties mailProperties = new Properties();
	

		mailProperties.put("mail.transport.protocol", "smtp");
		mailProperties.put("mail.smtp.auth", "true");
		mailProperties.put("mail.smtp.starttls.enable", "true");
		mailProperties.put("mail.smtp.starttls.required", "true");
		mailProperties.put("mail.debug", "true");
		return mailProperties;
		
	}
}
