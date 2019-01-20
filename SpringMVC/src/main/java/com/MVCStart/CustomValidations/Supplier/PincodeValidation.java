package com.MVCStart.CustomValidations.Supplier;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.MVCStart.Models.Address;


@Component
public class PincodeValidation {

	
	public boolean supports(Class pincode){
		return Address.class.isAssignableFrom(pincode);
	}
	
	public void validate(Object target,Errors error) {
		Address address = (Address)target;
		if(address.getPincode()>4 && address.getPincode()<4) {
			
		}
	}
}
