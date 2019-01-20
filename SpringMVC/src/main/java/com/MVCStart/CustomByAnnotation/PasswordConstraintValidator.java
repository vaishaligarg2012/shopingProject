package com.MVCStart.CustomByAnnotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordConstraintValidator implements ConstraintValidator<PasswordValidation,String>{
	public String passwordcheck;
	
	@Override
	public void initialize(PasswordValidation constraintAnnotation) {
		// TODO Auto-generated method stub
		passwordcheck = constraintAnnotation.value();
		
	}
 
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		// TODO Auto-generated method stub
		
		return true;
	}

}
