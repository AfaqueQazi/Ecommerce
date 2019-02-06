package com.niit.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.CartItemDao;
import com.niit.dao.CustomerDao;
import com.niit.dao.ProductDao;
import com.niit.models.CartItem;
import com.niit.models.Category;
import com.niit.models.Customer;

@Controller
public class HomeController {
	public HomeController(){
		System.out.println("homeController bean is created..");
	}
@Autowired
private CartItemDao cartItemDao;
@Autowired
private ProductDao productDao;
    @RequestMapping("/")
   	public String homePage(@AuthenticationPrincipal Principal principal, HttpSession session){
           List<CartItem> cartItems=null;
       	if(principal!=null){
            cartItems=cartItemDao.getCartItems(principal.getName());
       	session.setAttribute("cartSize",cartItems.size());
       	
       	}
       	List<Category> categories=productDao.getAllCategories();
       	session.setAttribute("categories", categories);
     
   		return "homePage";
   	}
    @RequestMapping("/aboutus")
    public String aboutUs()
    {
    	return "aboutus";
    }
    @RequestMapping("/login")
    public String login(){
    	return "login";
    }
    @RequestMapping("/loginerror")
    public String loginError(Model model){
    	model.addAttribute("loginError","Invalid Email/password");
    	return "login";
    }
    @RequestMapping("/logoutsuccess")
    public String logoutSuccess(Model model){
    	model.addAttribute("logoutSuccess","Loggedout Successfully, Please Come Back Soon!");
    	return "login";
    }
}