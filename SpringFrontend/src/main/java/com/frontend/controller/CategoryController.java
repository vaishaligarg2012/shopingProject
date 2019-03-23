package com.frontend.controller;

import java.security.Principal;
import java.util.Collection;
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
import com.MVCStart.Daos.ProductDao;
import com.MVCStart.Daos.UserDao;
import com.MVCStart.Models.Cart;
import com.MVCStart.Models.Category;
import com.MVCStart.Models.Item;
import com.MVCStart.Models.Product;
import com.MVCStart.Models.User;

@Controller
public class CategoryController {
	@Autowired
	CategoryDao categoryDao;
 
	@Autowired
	ProductDao productDao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	UserDao userDao;
	
	@Autowired 
	HttpSession session;
	
	@Autowired
	CartDao cartDao;
	
	@RequestMapping(value= {"/","HomePage"}, method=RequestMethod.GET)
	public ModelAndView showPage() {
		
		List<Category> categories=categoryDao.viewAllCategory();
		List<Product> product = productDao.viewAllProduct();
		ModelAndView mv=new ModelAndView("HomePage");
		mv.addObject("categoryList",categories);
		mv.addObject("productList",product);
		
			  
		Principal p=request.getUserPrincipal();
		if(p==null) {
			System.out.println("PRincipal is null");
		}
		else {
			System.out.println("principal is not null");
			
			String email=p.getName();
			
			User userObj=userDao.getUserById(email);
			int size=0;
			Cart cartObj=cartDao.getCartByCustomer(email);
			
			if(cartObj!=null){
			Collection<Item> items=cartObj.getItems();
			for(Item item:items){
				size=size+item.getQunatity();
			}
			}
			
			session.setAttribute("items",size);
			
			session.setAttribute("user",userObj);
			
			
		}
		
		return mv; 
	}

	@RequestMapping(value="AddCategory", method=RequestMethod.GET)
	public ModelAndView categoryForm() {
		Category categoryObj=new Category();
        ModelAndView mv=new ModelAndView("AddCategory");
		mv.addObject("key12",categoryObj);
		mv.addObject("btnLabel","Add Category");
		mv.addObject("formLabel","Add Category Form");
		mv.addObject("submitUpdateOrAdd","submitCategory");

		return mv;

	}

	@RequestMapping(value="submitCategory", method=RequestMethod.POST)
	public ModelAndView addCategory(@Valid @ModelAttribute("key12") Category cat, BindingResult result) {
        if(result.hasErrors()) {
    		ModelAndView mv=new ModelAndView("AddCategory");
    		mv.addObject("btnLabel","Add Category");
    		mv.addObject("formLabel","Add Category Form");
    		mv.addObject("submitUpdateOrAdd","submitCategory");
            return mv;	
        }else {
		categoryDao.addCategory(cat);
		ModelAndView mv=new ModelAndView("ViewAllCategory");
		mv.addObject("categoryList",categoryDao.viewAllCategory());
		mv.addObject("msg","Category Added Successfully");
		return mv;
        }
	}

	@RequestMapping(value="viewAllCategory" , method=RequestMethod.GET)
	public ModelAndView viewAllCategory() {

		ModelAndView mv=new ModelAndView("ViewAllCategory");
		mv.addObject("categoryList",categoryDao.viewAllCategory());
		return mv;
	}

	@RequestMapping(value="deleteCategory/{catId}",method=RequestMethod.GET)
	public ModelAndView deleteCategory(@PathVariable("catId") int id) {
		Category cat= categoryDao.viewCategoryById(id);
		categoryDao.deleteCategory(cat);
		ModelAndView mv= new ModelAndView("ViewAllCategory");
		mv.addObject("categoryList",categoryDao.viewAllCategory());
		mv.addObject("msg", "Successfully Deleted");
		return mv;
	}

	@RequestMapping(value="updateCategory/{catId}", method= RequestMethod.GET)
	public ModelAndView getUpdateCategoryForm(@PathVariable("catId") int cat) {
		Category c=categoryDao.viewCategoryById(cat);
		ModelAndView mv=new ModelAndView("AddCategory");
		mv.addObject("key12", c);
		mv.addObject("btnLabel","Update Category");
		mv.addObject("formLabel","Edit Category Form");
		mv.addObject("op","Edit");
		mv.addObject("submitUpdateOrAdd","update");
		return mv;
	} 

	@RequestMapping(value="update", method=RequestMethod.POST)
	public ModelAndView updateCategory(@ModelAttribute("key12") Category cat) {
		
		System.out.println("Category Object to Update "+cat.getCatId()+" "+cat.getCatName()+" "+cat.getCatDescription());
		categoryDao.updateCategory(cat);
		ModelAndView mv = new ModelAndView("ViewAllCategory");
		mv.addObject("categoryList",categoryDao.viewAllCategory());
		mv.addObject("msg","Category Updated!!");

		return mv;

	}
	
	

}

