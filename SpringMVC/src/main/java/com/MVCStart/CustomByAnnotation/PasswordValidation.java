package com.MVCStart.CustomByAnnotation;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.*;


import javax.validation.Constraint;

@Constraint(validatedBy = PasswordConstraintValidator.class)
@Target(value= {ElementType.METHOD, ElementType.FIELD})
@Retention(value=RetentionPolicy.RUNTIME)
public @interface PasswordValidation {

	public String value() default "DUV";
	
	public String message() default "Invalid Password";
	 Class<?>[] groups() default {};
	 Class<?>[] payload() default {};
}
  