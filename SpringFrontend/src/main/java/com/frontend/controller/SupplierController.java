package com.frontend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.MVCStart.Daos.SupplierDao;
import com.MVCStart.Models.Address;
import com.MVCStart.Models.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDao supplierDao;
    @RequestMapping(value="addSupplier", method=RequestMethod.GET)
	public ModelAndView showSupplierPage() {
		
    	Supplier supplier=new Supplier();
		Address address = new Address();   
		
		supplier.setAddress(address);
		
		ModelAndView mv= new ModelAndView("addSupplier");
		mv.addObject("key123",supplier );
		mv.addObject("btnLabel","Add");
		mv.addObject("formLabel","Add Supplier");
		mv.addObject("submitUpdateOrAdd","submitSupplier");
    	return mv; 
	}

	@RequestMapping(value="submitSupplier", method=RequestMethod.POST)
	public ModelAndView addSupplier(@Valid @ModelAttribute("key123") Supplier sp, BindingResult result) {
		if(result.hasErrors()) {
			ModelAndView mv = new ModelAndView("addSupplier");
			mv.addObject("btnLabel","Add");
			mv.addObject("formLabel","Add Supplier");
			mv.addObject("submitUpdateOrAdd","submitSupplier");

			return mv;
		}else {
		supplierDao.addSupplier(sp, sp.getAddress());
		ModelAndView mv= new ModelAndView("viewAllSuppliers");
		mv.addObject("allSupplier", supplierDao.viewAllSupplier());
		return mv;
		}
	}


	@RequestMapping(value="viewSuppplier", method=RequestMethod.GET)
	public ModelAndView viewAllSupplier() {
		ModelAndView mv = new ModelAndView("viewAllSuppliers");
		mv.addObject("allSupplier", supplierDao.viewAllSupplier());
		return mv;
	}
    @RequestMapping(value="deleteSupplier/{supplierId}", method=RequestMethod.GET)
	public ModelAndView deleteSupplier(@PathVariable("supplierId") int id) {
		Supplier supplier = supplierDao.viewAllSupplierById(id);
		supplierDao.deleteSupplier(supplier); 
		ModelAndView mv = new ModelAndView("viewAllSuppliers");
		mv.addObject("allSupplier", supplierDao.viewAllSupplier());
		return mv;
	}

	@RequestMapping(value="updateSupplierDetails/{supplierId}", method= RequestMethod.GET)
	public ModelAndView getUpdateSupplierForm(@PathVariable("supplierId") int sup) {
		Supplier supplier = supplierDao.viewAllSupplierById(sup);
		ModelAndView mv=new ModelAndView("addSupplier");
		mv.addObject("key123", supplier);
		mv.addObject("btnLabel","Update Supplier");
		mv.addObject("formLabel","Edit Supplier");
		mv.addObject("op","Edit");
		mv.addObject("submitUpdateOrAdd","updateSupplier");
		return mv;
	}

	@RequestMapping(value="updateSupplier", method=RequestMethod.POST)
	public ModelAndView updateSupplierDetails(@ModelAttribute("key123") Supplier sup) {
		supplierDao.updateSupplier(sup, sup.getAddress());
		ModelAndView mv = new ModelAndView("viewAllSuppliers");
		mv.addObject("allSupplier",supplierDao.viewAllSupplier());
		mv.addObject("msg","Supplier Details Updated!!");
    	return mv;

	}


} 
