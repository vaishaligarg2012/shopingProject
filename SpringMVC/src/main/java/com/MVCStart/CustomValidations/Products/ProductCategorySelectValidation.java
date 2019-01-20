package com.MVCStart.CustomValidations.Products;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.MVCStart.Models.Product;


@Component
public class ProductCategorySelectValidation implements Validator{

	@Override
	public boolean supports(Class categorySelect) {
		// TODO Auto-generated method stub
		return Product.class.isAssignableFrom(categorySelect);
				}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Product product =(Product)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "categoryId", "required.selectCategory");
		if(product.getCategoryId()==0) {
			errors.rejectValue("categoryId", "required.selectCategory");
			
		}
	}
	


}
