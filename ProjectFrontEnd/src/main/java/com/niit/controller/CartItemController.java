package com.niit.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartItemDao;
import com.niit.dao.ProductDao;
import com.niit.models.CartItem;
import com.niit.models.Customer;
import com.niit.models.CustomerOrder;
import com.niit.models.Product;
import com.niit.models.ShippingAddress;
import com.niit.models.User;

@Controller
public class CartItemController {
	@Autowired
private CartItemDao cartItemDao;
@Autowired
private ProductDao productDao;

@RequestMapping(value="/cart/addtocart/{productId}")
public String addToCart(@PathVariable int productId, 
		@RequestParam int requestedQuantity,
		@AuthenticationPrincipal Principal principal) {
	String email="";
	if(principal!=null)
	email=principal.getName();
	Product product=productDao.getProduct(productId);
	User user=cartItemDao.getUser(email);
	
	CartItem cartItem=new CartItem();
	cartItem.setQuantity(requestedQuantity);
	cartItem.setProduct(product);
	cartItem.setTotalPrice(product.getPrice()*requestedQuantity);
	cartItem.setUser(user);
	cartItemDao.addToCart(cartItem);
	return "redirect:/cart/getcartitems";
}
@RequestMapping("/cart/getcartitems")
public String getCartItems(@AuthenticationPrincipal Principal principal,Model model	,HttpSession session	){
	List<CartItem> cartItems=null;
	if(principal!=null)
	cartItems=cartItemDao.getCartItems(principal.getName());
	session.setAttribute("cartSize", cartItems.size());
	model.addAttribute("cartItems",cartItems);
	return "cart";
}
@RequestMapping("/cart/updatecartitem")
public String updateCartItem(@RequestParam int cartItemId,@RequestParam int requestedQuantity,Model model){
	System.out.println(cartItemId + " " + requestedQuantity);
	cartItemDao.updateCartItem(cartItemId,requestedQuantity);
	return "redirect:/cart/getcartitems";
}

@RequestMapping(value="/cart/removecartitem/{cartItemId}")
public String removeCartItem(@PathVariable int cartItemId){
    cartItemDao.removeCartItem(cartItemId);
	return "redirect:/cart/getcartitems";
}

@RequestMapping(value="/cart/clearcart")
public String clearCart(@AuthenticationPrincipal Principal principal){
	List<CartItem> cartItems=cartItemDao.getCartItems(principal.getName());
	for(CartItem cartItem:cartItems){
		cartItemDao.removeCartItem(cartItem.getCartItemId());
	}
	return "redirect:/cart/getcartitems";
}

@RequestMapping(value="/cart/getshippingaddressform")
public String getShippingAddressForm(@AuthenticationPrincipal Principal principal,Model model){
    String email=principal.getName();
    User user=cartItemDao.getUser(email);
    Customer customer=user.getCustomer();
    ShippingAddress shippingAddress=customer.getShippingAddress();
    model.addAttribute("shippingaddress",shippingAddress);
	return "shippingaddressform";
}

@RequestMapping(value="/cart/createorder")
public String createCustomerOrder(@ModelAttribute ShippingAddress shippingAddress,
		Model model,
		@AuthenticationPrincipal Principal principal,HttpSession session){
	String email=principal.getName();
	User user=cartItemDao.getUser(email);
	Customer customer=user.getCustomer();
	customer.setShippingAddress(shippingAddress);
	
	user.setCustomer(customer);
	customer.setUser(user);
	
	CustomerOrder customerOrder=new CustomerOrder();
	customerOrder.setPurchaseDate(new Date());
	customerOrder.setUser(user);
	
	List<CartItem> cartItems=cartItemDao.getCartItems(email);
	double grandTotal=0.0;
	for(CartItem cartItem:cartItems){
		grandTotal=cartItem.getTotalPrice()+grandTotal;
	}
	customerOrder.setGrandTotal(grandTotal);
	cartItemDao.createCustomerOrder(customerOrder);
	model.addAttribute("cartItems",cartItems);
	
	for(CartItem cartItem:cartItems){
		Product product=cartItem.getProduct();
		product.setQuantity(product.getQuantity() - cartItem.getQuantity());
		productDao.saveOrUpdate(product);
		cartItemDao.removeCartItem(cartItem.getCartItemId());
	}
	session.setAttribute("cartSize", 0);
	model.addAttribute("customerOrder",customerOrder);
	return "orderdetails";
}

//////////////////////////////////////
@RequestMapping(value="/all/history")
public String getHistory(Model model,@AuthenticationPrincipal Principal principal){ // handler method returns (model and view)	
	String email=principal.getName();
	List<CustomerOrder> customerorder=cartItemDao.getHistory(email);
	model.addAttribute("customerorder",customerorder);
	return "orderHistory";
}
//////////////////////////////////////


}