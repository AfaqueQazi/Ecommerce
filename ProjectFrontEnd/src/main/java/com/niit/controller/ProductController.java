package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.dao.CartItemDao;
import com.niit.dao.CustomerDao;
import com.niit.dao.ProductDao;
import com.niit.models.CartItem;
import com.niit.models.Category;
import com.niit.models.Product;

@Controller
public class ProductController {
	@Autowired
private ProductDao productDao;//automatically wire a bean of type ProductDao (ProductDaoImpl)
	
	public ProductController(){
		System.out.println("ProductController bean is created");
	}
	@RequestMapping(value="/all/getallproducts")
	public String getAllProducts(Model model)	{
		
		List<Product> products=productDao.getAllProducts();
		model.addAttribute("products",products);
		return "productslist";
	}
	@RequestMapping(value="/all/getproduct")
	public String getProduct(@RequestParam int id,Model model){
		Product product=productDao.getProduct(id);
		model.addAttribute("productAttr",product);
		return "viewproduct";
	}
	
	@RequestMapping(value="/admin/deleteproduct/{id}")
	public String deleteProduct(@PathVariable int id,HttpServletRequest request){
		
		productDao.deleteProduct(id);
		
		Path paths=
		Paths.get(request.getServletContext().getRealPath("/")+"/WEB-INF/resources/images/"+id+".png");
		if(Files.exists(paths)){
			try {
				Files.delete(paths);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		return "redirect:/all/getallproducts"; 
	}
	
	@RequestMapping(value="/admin/getproductform")
	public String getProductform(Model model){
		Product p=new Product();
		model.addAttribute("product",p);
		List<Category> categories=productDao.getAllCategories();
		model.addAttribute("categories",categories);
		return "productform";
	}
	
	@RequestMapping(value="/admin/getupdateform")
	public String getupdateform(@RequestParam int id,Model model){
		Product product=productDao.getProduct(id);
		model.addAttribute("product",product);
		System.out.println("BEFORE GETTING FORM " +product.getId());
		List<Category> categories=productDao.getAllCategories();
		model.addAttribute("categories",categories);
		return "updateproduct";
	}
     
	@RequestMapping(value="/admin/addproduct")
    public String addProduct(@ModelAttribute @Valid Product product,BindingResult result,Model model,HttpServletRequest request){
		if(result.hasErrors())//if values are incorrect, if it violates the hibernate validator constraints
		{
			model.addAttribute("categories",productDao.getAllCategories());
			return "productform";
		}
		productDao.saveOrUpdate(product);
		System.out.println(request.getServletContext().getRealPath("/"));
		
		Path path=Paths.get(request.getServletContext().getRealPath("/")+ "/WEB-INF/resources/images/"+product.getId()+".png");
		
		MultipartFile img=product.getImage();//image uploaded by the user
		if(img!=null && !img.isEmpty()){
			File file=new File(path.toString());
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/all/getallproducts";
    }
	
	@RequestMapping(value="/admin/updateproduct")
	public String updateProduct(@ModelAttribute @Valid Product product,BindingResult result,Model model,HttpServletRequest request){
		if(result.hasErrors()){
			model.addAttribute("categories",productDao.getAllCategories());
			return "updateproduct";
		}
		
		System.out.println("AFTER FORM SUBMIT" + product.getId());
		productDao.saveOrUpdate(product);
		
		Path path=Paths.get(request.getServletContext().getRealPath("/")+ "/WEB-INF/resources/images/"+product.getId()+".png");
		
		MultipartFile img=product.getImage();
		if(img!=null && !img.isEmpty()){
			File file=new File(path.toString());
			try {
				img.transferTo(file);
			} catch (IllegalStateException e) 
			{
				e.printStackTrace();
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		
		return "redirect:/all/getallproducts";
		
	}
	
	@RequestMapping("/all/searchbycategory")
	public String searchByCategory(@RequestParam String searchCondition,Model model){
		if(searchCondition.equals("All"))
			model.addAttribute("searchCondition","");
		else
			model.addAttribute("searchCondition",searchCondition);
		List<Product> products=productDao.getAllProducts();
		model.addAttribute("products",products);
		return "productslist";
	}
///////////////////////////////////////////////////////
@RequestMapping(value="/admin/addcategory")
public String addCategory(Model model){
Category category=new Category();
model.addAttribute("category",category);
return "managecategory";
}

@RequestMapping(value="/admin/savecategory")
public String saveCategory(@ModelAttribute Category category,Model model) {
productDao.addCategory(category);
return "redirect:/";
}

@RequestMapping(value="/admin/deletecategory/{id}")
public String deleteCategory(@PathVariable int id){
	productDao.deleteCategory(id);
	return "redirect:/";
}
///////////////////////////////////////////////////////
	
	
}

