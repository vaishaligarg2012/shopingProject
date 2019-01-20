package com.MVCStart.CustomValidations.Products;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.MVCStart.Models.Product;

@Component
public class ProductImageValidator implements Validator{
     
	
	   public boolean supports(Class img) {
		   return Product.class.isAssignableFrom(img);
		}
	   
	   public void validate(Object target, Errors error) {
		   Product product = (Product)target;
		   //ValidationUtils.rejectIfEmpty(error, "pimage1", "required.image");
		  // System.out.println("image check"+product.getPimage1());
		
		   if(product.getPimage1()!=null && product.getPimage1().isEmpty()) {
			   error.rejectValue("pimage1","required.image" );
		   }
	   }
}
