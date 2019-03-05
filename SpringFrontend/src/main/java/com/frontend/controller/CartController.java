package com.frontend.controller;

import java.security.Principal;
import java.text.NumberFormat;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.Daos.CartDao;
import com.MVCStart.Daos.CategoryDao;
import com.MVCStart.Daos.ItemDao;
import com.MVCStart.Daos.ProductDao;
import com.MVCStart.Daos.SupplierDao;
import com.MVCStart.Daos.UserDao;
import com.MVCStart.Models.Cart;
import com.MVCStart.Models.Category;
import com.MVCStart.Models.Item;
import com.MVCStart.Models.Product;
import com.MVCStart.Models.User;



@Controller
public class CartController {
  
	@Autowired
	HttpServletRequest request;

	@Autowired
	CartDao cartDao;

	@Autowired
	HttpSession session; 

	@Autowired 
	ProductDao productDao;

	@Autowired
	ItemDao itemDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	SupplierDao supplierDao;

	@Autowired
	UserDao userDao;

	@RequestMapping(value="addToCart/{productId}", method=RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable int productId) {
		ModelAndView mv = new ModelAndView("ViewAllProducts");
		int categoryId=0;
		try {
			Principal p = request.getUserPrincipal();
			String userEmail = p.getName();
			System.out.println("Here i have user email"+userEmail);
			Cart cartObj = cartDao.getCartByCustomer(userEmail);
			int size=0;
			int grandTotal;

			if(cartObj==null) {	
				System.out.println("Cart empty");
				cartObj =new Cart();
				cartObj.setCustomerId(userEmail);
				System.out.println("I am here "+cartObj);
				cartDao.addCart(cartObj);
				System.out.println("Cart Created");
			} 
			System.out.println("Cart already created");
			Product product = productDao.viewProductById(productId);
			categoryId= product.getCategoryId();

			Item itemObj= itemDao.getItemByProductIdAndCustomerId(product.getProductId(), userEmail);

			if(itemObj==null) {
				System.out.println("I am null");
				itemObj = new Item();
				itemObj.setCart(cartObj);
				itemObj.setCustomerId(userEmail);
				itemObj.setPrice(product.getPrice());
				itemObj.setProduct(product);
				itemObj.setQunatity(1); 
				itemDao.addItem(itemObj);
				System.out.println("Item Added in the Cart");
			}
			else {
				itemDao.increaseQuantity(itemObj.getItemId());
			}
			List<Product> list=productDao.viewAllProductByCategoryId(categoryId);
			List<Category> categories=categoryDao.viewAllCategory();
			mv.addObject("categoryList",categories);
			mv.addObject("listOfProduct", list);
			Cart cartObjAfter = cartDao.getCartByCustomer(userEmail);

			if(cartObjAfter!=null){
				Collection<Item> items=cartObjAfter.getItems();
				for(Item item:items){
					size=size+item.getQunatity();

				}
			}
			System.out.println("Item added"+size);
			session.setAttribute("items",size);

		}catch(Exception e) {
			e.printStackTrace();
		}

		return  mv;
	}

	@RequestMapping(value="/addToCart/viewCart", method= RequestMethod.GET)
	public ModelAndView viewCart() {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();

		Principal p = request.getUserPrincipal();
		String userEmail = p.getName();
		Cart cartObj =cartDao.getCartByCustomer(userEmail);
		ModelAndView mv= new ModelAndView("ViewCart");
		mv.addObject("categoryList",categories);
		mv.addObject("productList",product);
		int grandTotal=0;
		if((cartObj==null) || (cartObj.getItems().size()==0)) {
			mv.addObject("itemsList","Cart Empty");
			return mv;
		}
		Collection<Item>  items= cartObj.getItems();
		System.out.println("someitems "+items);
		mv.addObject("itemsList",items);
		for(Item items12: items) {
			grandTotal+=(int) (items12.getPrice()*items12.getQunatity());

		}

		session.setAttribute("grandTotal",NumberFormat.getCurrencyInstance(new Locale("en", "US"))
				.format(grandTotal));


		return mv;
	}
	@RequestMapping(value="/deleteCartItem/{itemId}", method=RequestMethod.GET)
	public ModelAndView deleteCartItem(@PathVariable int itemId) {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();
		Principal p = request.getUserPrincipal();
		String userEmail = p.getName();
		ModelAndView mv = new ModelAndView("ViewCart");
		mv.addObject("categoryList",categories);
		mv.addObject("productList",product);
		itemDao.deleteItem(itemId);
		int size=0;
		int grandTotal=0;
		Cart cartObj=cartDao.getCartByCustomer(userEmail);

		if(cartObj!=null){
			Collection<Item> items=cartObj.getItems();
			for(Item item:items){
				size=size+item.getQunatity();
			}
			mv.addObject("itemsList",items);
			for(Item items12: items) {
				grandTotal+=(int) (items12.getPrice()*items12.getQunatity());

			}

			session.setAttribute("grandTotal",NumberFormat.getCurrencyInstance(new Locale("en", "US"))
					.format(grandTotal));

		}

		session.setAttribute("items",size);
		mv.addObject("msg","Successfully Deleted!!");
		return mv;

	}

	@RequestMapping(value="increase/{itemId}", method=RequestMethod.GET)
	public ModelAndView increseQuantity(@PathVariable int itemId) {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();
		/*int totalQuan=0;
		for(Product productQ: product) {
			totalQuan=productQ.getQuantity();
		}*/
		Principal p = request.getUserPrincipal();
		String userEmail = p.getName();
		ModelAndView mv = new ModelAndView("ViewCart");
		mv.addObject("categoryList",categories);
		mv.addObject("productList",product);
		/*Cart cartObjquan=cartDao.getCartByCustomer(userEmail);
		Collection<Item> itemsQuan=cartObjquan.getItems();
		for(Item itemQuan:itemsQuan){
			if(itemQuan.getQunatity()>totalQuan) {
				mv.addObject("msg","you reach ");

			}
		}*/

		boolean itemPlus= itemDao.increaseQuantity(itemId);
		if(itemPlus) {
			mv.addObject("msg","Item added");
			int size=0;
			int grandTotal=0;
			Cart cartObj=cartDao.getCartByCustomer(userEmail);

			if(cartObj!=null){
				Collection<Item> items=cartObj.getItems();
				for(Item item:items){
					size=size+item.getQunatity();

				}
				mv.addObject("itemsList",items);
				for(Item items12: items) {
					grandTotal+=(int) (items12.getPrice()*items12.getQunatity());

				}

				session.setAttribute("grandTotal",NumberFormat.getCurrencyInstance(new Locale("en", "US"))
						.format(grandTotal));

			}

			session.setAttribute("items",size);

			return mv;
		}else {
			mv.addObject("msg","Item Not Added");
			return mv;
		}
	}


	@RequestMapping(value="decrease/{itemId}", method=RequestMethod.GET)
	public ModelAndView decressQuantity(@PathVariable int itemId) {
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();
		Principal p = request.getUserPrincipal();
		String userEmail = p.getName();
		ModelAndView mv = new ModelAndView("ViewCart");
		mv.addObject("categoryList",categories);
		mv.addObject("productList",product);
		boolean itemPlus= itemDao.decreaseQuantity(itemId);
		if(itemPlus) {
			mv.addObject("msg","Item removed");
			int size=0;
			int grandTotal=0;
			Cart cartObj=cartDao.getCartByCustomer(userEmail);

			if(cartObj!=null){
				Collection<Item> items=cartObj.getItems();
				for(Item item:items){
					if(item.getQunatity()==0) {
						itemDao.deleteItem(itemId);

					}
					size=size+item.getQunatity();
				}
				Cart cartObjafterdelete=cartDao.getCartByCustomer(userEmail);
				Collection<Item> itemsDelete=cartObjafterdelete.getItems();

				mv.addObject("itemsList",itemsDelete);
				for(Item items12: items) {
					grandTotal+=(int) (items12.getPrice()*items12.getQunatity());

				}

				session.setAttribute("grandTotal",NumberFormat.getCurrencyInstance(new Locale("en", "US"))
						.format(grandTotal));

			}

			session.setAttribute("items",size);

			return mv;
		}else {
			mv.addObject("msg","Item Not removed");
			return mv;
		}
	}

}
