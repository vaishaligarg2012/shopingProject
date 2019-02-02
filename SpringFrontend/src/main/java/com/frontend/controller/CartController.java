package com.frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class CartController {
   
	
	@RequestMapping(value="addToCart/{productId}", method=RequestMethod.GET)
	public String addToCart() {
		
		System.out.println("I m Add to Cart");
		return "redirect:/"; 
	}
}
