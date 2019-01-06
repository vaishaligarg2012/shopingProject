package com.frontend.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

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
import com.MVCStart.Daos.CategoryDao;
import com.MVCStart.Daos.ProductDao;
import com.MVCStart.Daos.SupplierDao;
import com.MVCStart.Models.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDao productDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SupplierDao supplierDao;
	@Autowired
	HttpSession session;

	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public ModelAndView getProductPage() {
		Product product = new Product();
		ModelAndView mv=new ModelAndView("addProduct");
		mv.addObject("productObj",product);
		mv.addObject("categories",categoryDao.viewAllCategory());
		mv.addObject("supplier",supplierDao.viewAllSupplier());
		return mv;       	 
	}

	@RequestMapping(value="submitProduct" , method=RequestMethod.POST)
	public ModelAndView createProduct(@Valid @ModelAttribute("productObj") Product product, BindingResult result) {

		if(result.hasErrors()) {
			ModelAndView mv=new ModelAndView("addProduct");
			mv.addObject("productObj",product);
			mv.addObject("categories",categoryDao.viewAllCategory());
			mv.addObject("supplier",supplierDao.viewAllSupplier());
			return mv;
		}else {

		}
		
		ModelAndView mv = new ModelAndView("ViewAllProducts");
		mv.addObject("categories",categoryDao.viewAllCategory());
		mv.addObject("supplier",supplierDao.viewAllSupplier());
		String filePathString = session.getServletContext().getRealPath("/");
		String fileName= product.getPimage1().getOriginalFilename();
		product.setImgname1(fileName);
		productDao.addProduct(product);
		
		System.out.println("hello1 ");
		mv.addObject("msg","Product Added");
		
		System.out.println("hello2 ");
		try{
			byte[] imageBytes=product.getPimage1().getBytes();
			System.out.println("hello3");
			
			FileOutputStream fos=new FileOutputStream(filePathString+"/resources/images/"+fileName);
			BufferedOutputStream bos= new BufferedOutputStream(fos);
			
			System.out.println("hello4");
			
			bos.write(imageBytes);
			System.out.println("hello5");
			
			bos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		

		System.out.println("hello6");
		
		List<Product> list = productDao.viewAllProduct();
		mv.addObject("listOfProduct", list);
		
		System.out.println("I m here"+mv.getViewName());
		
		System.out.println("hello7");
		
		return mv;
	}
	@RequestMapping(value="updateProduct/{productId}", method= RequestMethod.GET)
	public ModelAndView getUpdateCategoryForm(@PathVariable("productId") int pro) {
		Product p = productDao.viewProductById(pro);
		ModelAndView mv=new ModelAndView("addProduct");
		mv.addObject("categories",categoryDao.viewAllCategory());
		mv.addObject("supplier",supplierDao.viewAllSupplier());
		System.out.println("I m here 1");
		mv.addObject("productObj",p);
		System.out.println("I m here 2");
		return mv;
	}


	
	@RequestMapping(value="viewProducts", method=RequestMethod.GET)
	public ModelAndView viewAllProduct() {
		ModelAndView mv = new ModelAndView("ViewAllProducts");
		List<Product> list = productDao.viewAllProduct();
		mv.addObject("listOfProduct", list);
		System.out.println(list);
		return mv;
	}
	@RequestMapping(value="deleteProduct/{productId}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("productId") int id) {
		
		System.out.println("PRoduct Id : "+id);
		Product product = productDao.viewProductById(id);
		
		System.out.println("Product Object : "+product);
		productDao.deleteProduct(product);
		
		ModelAndView mv= new ModelAndView("ViewAllProducts");
		mv.addObject("listOfProduct", productDao.viewAllProduct());
		mv.addObject("msg","Product Deleted");
		return mv;
	}
}