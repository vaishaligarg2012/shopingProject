package com.MVCStart.CustomValidations.Products;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.MVCStart.Models.Product;

@Component
public class ProductSuppllierDropDown implements Validator{

	
	@Override
	public boolean supports(Class obj) {
		return Product.class.isAssignableFrom(obj);
	}
	
	@Override
	public void validate(Object target,Errors error) {
		Product product = (Product)target;
		
		ValidationUtils.rejectIfEmpty(error, "supplierId", "required.selectSupplier");
		
		if(product.getSupplierId()==0) {
		error.rejectValue("supplierId", "required.selectSupplier");
		}
	}
}
