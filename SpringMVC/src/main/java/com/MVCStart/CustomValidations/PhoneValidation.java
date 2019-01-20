package com.MVCStart.CustomValidations;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.MVCStart.Models.User;

@Component
public class PhoneValidation  implements Validator{
             
	
	   @Override
	   public boolean supports(Class obj) {
		return User.class.isAssignableFrom(obj);
		}
	   
	  
	@Override
	public void validate(Object target, Errors errors) {
		
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "required.phone");
		
		User user =(User)target;
		if(user.getPhone().length()>10 ||  user.getPhone().length()<10) {
			errors.rejectValue("phone", "notvalid.phone");
		}
		
		}
}
