package com.frontend.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.Daos.CartDao;
import com.MVCStart.Daos.CategoryDao;
import com.MVCStart.Daos.OrderDao;
import com.MVCStart.Daos.PaymentDao;
import com.MVCStart.Daos.ProductDao;
import com.MVCStart.Daos.UserDao;
import com.MVCStart.Models.Category;
import com.MVCStart.Models.Order;
import com.MVCStart.Models.Payment;
import com.MVCStart.Models.Product;
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
	
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@RequestMapping(value="Reciept/{addrId}", method=RequestMethod.GET)
	public ModelAndView reciept(@PathVariable("addrId")int addressId,HttpServletRequest request,HttpSession session) {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();

			ModelAndView mv= new ModelAndView("Reciept");
			mv.addObject("categoryList",categories);
			mv.addObject("productList",product);

			Principal p=request.getUserPrincipal();
			String email=p.getName();
			
			User userObj=userDao.getUserById(email);
			UserAddress addressObj=userDao.getAddressById(addressId);
			session.setAttribute("addressToDeliver",addressObj);
			
			//Order orderObj=cartDao.getCartByCustomer(email);
			
			
			mv.addObject("userObj",userObj);
			mv.addObject("addressObj",addressObj);
			return mv;
		
	}



	@RequestMapping(value="proccedToPay", method=RequestMethod.POST)
	public ModelAndView proccedToPay(@Valid @ModelAttribute("key2")Payment payment,
			BindingResult result) {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();

		if(result.hasErrors()) {
			System.out.println("77777777777");
			ModelAndView mv= new ModelAndView("Payment");
			mv.addObject("categoryList",categories);
			mv.addObject("productList",product);

			return mv;   
		}else {
			
			ModelAndView mv= new ModelAndView("OrderPlaced");
			mv.addObject("categoryList",categories);
			mv.addObject("productList",product);

			Order order= new Order();
			
			Principal p = request.getUserPrincipal();
			String userEmail = p.getName();
			
			User user= userDao.getUserById(userEmail);
			List<UserAddress> useradd= userDao.getAllAddressByUserId(userEmail);
			
			System.out.println("check address id");
			
			double grandTotal = new CartController().getGrandTotal(userEmail,cartDao.getCartByCustomer(userEmail));
			//user address id is not set in db orderTable
			order.setAddress((UserAddress)session.getAttribute("addressToDeliver"));
			order.setUser(user);  
			//similarly grand total
			order.setTotalAmountPaid(new CartController().getGrandTotal(userEmail,cartDao.getCartByCustomer(userEmail)));
			mv.addObject("grandTotal",grandTotal);
			//session.setAttribute("grandTotal", grandTotal);
			
			
			payment.setOrderId(order);
			
			
			paymentDao.addPayments(payment);	   
			
			return mv;
		}
	} 

} 
