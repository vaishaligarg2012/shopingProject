package com.frontend.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.CustomValidations.PasswordValidation;
import com.MVCStart.CustomValidations.PhoneValidation;
import com.MVCStart.Daos.CategoryDao;
import com.MVCStart.Daos.UserDao;
import com.MVCStart.Models.Category;
import com.MVCStart.Models.User;

@Controller
public class UserController {
   
	     @Autowired
	     UserDao userDao;
	     @Autowired
	     PhoneValidation phonevalidation;
	     @Autowired
	     PasswordValidation passwordValidation;
	     @Autowired
	     CategoryDao categoryDao;

	     @RequestMapping(value = "/login", method = RequestMethod.GET)
	     public ModelAndView loginUser() {
	    	 System.out.println("I m  here");
	    	 ModelAndView mv = new ModelAndView("Login");
	    	 List<Category> categories=categoryDao.viewAllCategory();
	 		 mv.addObject("categoryList",categories);

	    	 return mv; 
	     }
	     
	     @RequestMapping(value="register", method=RequestMethod.GET)
	     public ModelAndView registerUser() {
	    	 User user = new User();
	    	 ModelAndView mv = new ModelAndView("Register");
	    	 List<Category> categories=categoryDao.viewAllCategory();
	 		 mv.addObject("categoryList",categories);

	    	 mv.addObject("userKey",user);
	    	 return mv;
	    }
	     
	     @RequestMapping(value="access-denied", method=RequestMethod.GET)
	     public ModelAndView AccessDeniedPage() {
	    	 
	    	 ModelAndView mv = new ModelAndView("AccessDeniedPage");
	    	 return mv;
	    }
	     
	     @RequestMapping(value="logout", method=RequestMethod.GET)
	     public String Logout(HttpServletRequest request,HttpServletResponse response) {
	    	 Authentication auth=SecurityContextHolder.getContext().getAuthentication();
	    	 if(auth!=null) {
	    		 new SecurityContextLogoutHandler().logout(request, response, auth);
	    	 }
	    	 
	    	 return "redirect:/login?logout";
	    } 
	     
	     @RequestMapping(value="submitRegister", method = RequestMethod.POST)
	     public ModelAndView saveRegister(@Valid @ModelAttribute("userKey") User user ,BindingResult result) {
	    	//Custom Validation by using bean method
	    	phonevalidation.validate(user,result);
	        passwordValidation.validate(user,result);
	    	 if(result.hasErrors()) {
	    		 ModelAndView mv = new ModelAndView("Register");
		    	 return mv;
	    	 }else {
	    	 userDao.addUsers(user);
	    	 ModelAndView mv = new ModelAndView("Register");
	    	 mv.addObject("msg","User Added successfully");
	    	 return mv;
	    	 }
	     }
	  
}
