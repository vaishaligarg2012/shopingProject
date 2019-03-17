package com.frontend.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.CustomValidations.Products.ProductCategorySelectValidation;
import com.MVCStart.CustomValidations.Products.ProductImageValidator;
import com.MVCStart.CustomValidations.Products.ProductSuppllierDropDown;
import com.MVCStart.Daos.CategoryDao;
import com.MVCStart.Daos.ProductDao;
import com.MVCStart.Daos.SupplierDao;
import com.MVCStart.Models.Category;
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
	@Autowired
	ProductCategorySelectValidation categoryDropDownProduct;
	@Autowired
	ProductSuppllierDropDown productSupplier;
	@Autowired
	ProductImageValidator productImageValidator;

	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public ModelAndView getProductPage() {
		Product product = new Product();
		ModelAndView mv=new ModelAndView("addProduct");
		mv.addObject("productObj",product);
		mv.addObject("categories",categoryDao.viewAllCategory());
		mv.addObject("supplier",supplierDao.viewAllSupplier());
		mv.addObject("title","Add Product");
		mv.addObject("saveBtn", "Save");
		return mv;       	 
	}
  
	@RequestMapping(value="submitProduct" , method=RequestMethod.POST)
	public ModelAndView createProduct(@Valid @ModelAttribute("productObj") Product product, BindingResult result) {
		categoryDropDownProduct.validate(product, result);
		productSupplier.validate(product, result);

		if(product.getProductId()==0) {
			productImageValidator.validate(product, result);
		}  

		ModelAndView mv=null;
		if(result.hasErrors()) {
			mv=new ModelAndView("addProduct");
			mv.addObject("productObj",product);
			mv.addObject("saveBtn", "Save");
			mv.addObject("categories",categoryDao.viewAllCategory());
			mv.addObject("supplier",supplierDao.viewAllSupplier());
			return mv;
		}

		mv = new ModelAndView("ViewAllProducts");
		if(product.getProductId()==0) {
			System.out.println("image size "+product.getPimage1().getSize()+"image type "+product.getPimage1().getContentType());
			String filePathString = session.getServletContext().getRealPath("/");
			String fileName= product.getPimage1().getOriginalFilename();
			System.out.println("image name is done"+fileName);
			product.setImgname1(fileName);

			System.out.println(product.getImgname1()+" Hey here is size of file"+product.getPimage1().getContentType()+" "+product.getPimage1().getSize());
			uploadImage(product,filePathString,fileName);
			productDao.addProduct(product);
			mv.addObject("msg","Product Added");
		}
		else {

			//System.out.println("I m in else" +product.getPimage1().getSize());
			if(product.getPimage1().getSize()==0) {
				Product pro=productDao.viewProductById(product.getProductId());
				String img=pro.getImgname1();
				product.setImgname1(img);
				productDao.updateProduct(product);
			}
			else 
			{
				String filePathString = session.getServletContext().getRealPath("/");
				String fileName= product.getPimage1().getOriginalFilename();
				product.setImgname1(fileName);
				productDao.updateProduct(product);
				System.out.println("Hey here is size of file"+product.getPimage1().getContentType()+" "+product.getPimage1().getSize());
				uploadImage(product, filePathString,fileName);
			}
		}
		List<Category> categories=categoryDao.viewAllCategory();
		mv.addObject("categoryList",categories);
		mv.addObject("title","Update Product");
		mv.addObject("saveBtn", "Update");
		List<Product> list = productDao.viewAllProduct();
		mv.addObject("listOfProduct", list);
		return mv;

	}

	public void uploadImage(Product product,String filePathString,String fileName) {
		try{
			byte[] imageBytes=product.getPimage1().getBytes();
			String str=filePathString+"resources\\images\\";
			System.out.println(str);
			File file=new File(str);
			if(!file.exists()) {
				file.mkdirs();
			}
			FileOutputStream fos=new FileOutputStream(filePathString+"resources\\images\\"+fileName);
			BufferedOutputStream bos= new BufferedOutputStream(fos);
			bos.write(imageBytes);
			bos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	@RequestMapping(value="updateProduct/{productId}", method= RequestMethod.GET)
	public ModelAndView getUpdateCategoryForm(@PathVariable("productId") int pro) {
		Product p = productDao.viewProductById(pro);
		ModelAndView mv=new ModelAndView("addProduct");
		mv.addObject("categories",categoryDao.viewAllCategory());
		mv.addObject("supplier",supplierDao.viewAllSupplier());
		mv.addObject("title","Update Product");
		mv.addObject("saveBtn", "Update");
		mv.addObject("productObj",p);
		mv.addObject("op","Edit");
		return mv;
	}

	@RequestMapping(value="viewProducts", method=RequestMethod.GET)
	public ModelAndView viewAllProduct() {

		ModelAndView mv = new ModelAndView("ViewAllProducts");
		List<Product> list = productDao.viewAllProduct();
		List<Category> categories=categoryDao.viewAllCategory();
		mv.addObject("categoryList",categories);
		mv.addObject("listOfProduct", list);
		System.out.println(list);
		return mv;
	}
	//	@RequestMapping(value="getJsonProduct", method=RequestMethod.GET, produces = "application/json")
	//	public @ResponseBody  Product getAllProducts() {
	//		Product list = (Product) productDao.viewAllProduct();
	//		System.out.println(list);
	//		return list;
	//	}


	@RequestMapping(value="deleteProduct/{productId}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("productId") int id) {

		System.out.println("PRoduct Id : "+id);
		Product product = productDao.viewProductById(id);
		System.out.println("Product Object : "+product);
		productDao.deleteProduct(product);
		ModelAndView mv= new ModelAndView("ViewAllProducts");
		List<Category> categories=categoryDao.viewAllCategory();
		mv.addObject("categoryList",categories);
		mv.addObject("listOfProduct", productDao.viewAllProduct());
		mv.addObject("msg","Product Deleted");
		return mv;
	}

	@RequestMapping(value="viewProductsById/{cId}", method=RequestMethod.GET)
	public ModelAndView viewAllProductsById(@PathVariable("cId")int categoryId) {
		ModelAndView mv = new ModelAndView("ViewAllProducts");
		
		
		List<Product> list=productDao.viewAllProductByCategoryId(categoryId);
		List<Category> categories=categoryDao.viewAllCategory();
		mv.addObject("categoryList",categories);
		mv.addObject("listOfProduct", list);
		mv.addObject("nameToDisplay",categoryDao.viewCategoryById(categoryId).getCatName());
		
		System.out.println(list);
		return mv;
	}

	@RequestMapping(value="productDetail/{productId}", method=RequestMethod.GET)
	public ModelAndView viewProductDetail(@PathVariable("productId")int id) {
		ModelAndView mv = new ModelAndView("ProductDetails");
		List<Category> categories=categoryDao.viewAllCategory();
		mv.addObject("categoryList",categories);
		Product list=productDao.viewProductById(id);
		mv.addObject("productDetails", list);

		return mv;
	}
}