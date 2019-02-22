package com.MVCStart.CustomValidations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.MVCStart.Models.User;

@Component
public class PasswordValidation  implements Validator{

	@Override
	public boolean supports(Class obj) {
		// TODO Auto-generated method stub
		return User.class.isAssignableFrom(obj);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required.password");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required.passwordConfirm");
		 
		User user = (User)target;
 
		if(user.getPassword().length()<=4) {  
			errors.rejectValue("password","required.passwordLength");
		}
		if(!(user.getPassword().equals(user.getConfirmPassword()))) {
			errors.rejectValue("confirmPassword", "notmatch.password");
			
			}
	}

	
}
