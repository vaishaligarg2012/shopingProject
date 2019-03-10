package com.frontend.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.Daos.CartDao;
import com.MVCStart.Daos.OrderDao;
import com.MVCStart.Daos.PaymentDao;
import com.MVCStart.Daos.UserDao;
import com.MVCStart.Models.Order;
import com.MVCStart.Models.Payment;
import com.MVCStart.Models.User;
import com.MVCStart.Models.UserAddress;

@Controller
public class PaymentController {
	@Autowired
	OrderDao orderDao;
	@Autowired
	CartDao cartDao;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session; 

	@Autowired 
	UserDao userDao;
	@Autowired
	PaymentDao paymentDao;
	@RequestMapping(value="Reciept", method=RequestMethod.POST)
	public ModelAndView reciept(@Valid @ModelAttribute("key1")UserAddress userAddress,
			BindingResult result,HttpServletRequest request,HttpSession session) {

		if(result.hasErrors()) {
			System.out.println("I am here please check here");
			ModelAndView mv = new ModelAndView("Address");
			return mv;	
		}else {
			System.out.println("I nooooooooo"); 
			User user=(User)session.getAttribute("user");
			userAddress.setUserObj(user); 
			userDao.addNewAddress(userAddress); 
			ModelAndView mv= new ModelAndView("Reciept");

			return mv;
		}

	}



	@RequestMapping(value="proccedToPay", method=RequestMethod.POST)
	public ModelAndView proccedToPay(@Valid @ModelAttribute("key2")Payment payment,
			BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("77777777777");
			ModelAndView mv= new ModelAndView("Payment");

			return mv;   
		}else {
			ModelAndView mv= new ModelAndView("Payment");
			Order order= new Order();
			Principal p = request.getUserPrincipal();
			String userEmail = p.getName();
			User user= userDao.getUserById(userEmail);
			UserAddress useradd= userDao.getAllAddressByUserId(userEmail);
			double grandTotal = new CartController().getGrandTotal();
			//user address id is not set in db orderTable
		    order.setAddress(useradd);
		    order.setUser(user);
		    //similarly grand total
			order.setTotalAmountPaid(new CartController().getGrandTotal());
			mv.addObject("grandTotal",grandTotal);
			//session.setAttribute("grandTotal", grandTotal);
			orderDao.addOrder(order);
			paymentDao.addPayments(payment);	   
			return mv;
		}
	} 

} 
