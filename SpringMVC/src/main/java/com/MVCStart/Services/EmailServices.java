package com.MVCStart.Services;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.MVCStart.Models.User;

@Service(value="emailService")
public class EmailServices {

	
	@Autowired
	private JavaMailSender mailSender;
	private static String from ="SkillMapper"; 
	
	
	public void sendThankuMsg(User user , String message) {
	
		MimeMessage mimeMessage  = mailSender.createMimeMessage();
		MimeMessageHelper  helper = null;
		
		try {
			helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
			StringBuilder htmlMsg = new StringBuilder();
			htmlMsg.append("<h1>Welcome " + user.getlName() + " " + user.getlName() + " on SkillMapper!</h1>");
			htmlMsg.append("<p>"+message+"</p><br/>");
			
			mimeMessage.setContent(htmlMsg.toString(),"text/html");
			
			helper.setTo(user.getEmail());
			helper.setSubject("Welcome To NIIT");
			helper.setFrom(from);
			
			mailSender.send(mimeMessage);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
