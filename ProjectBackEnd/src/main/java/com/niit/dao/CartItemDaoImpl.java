package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.models.CartItem;
import com.niit.models.CustomerOrder;
import com.niit.models.Product;
//import com.niit.models.Product;
import com.niit. models.User;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {

	@Autowired
	private SessionFactory sessionFactory;
		public void addToCart(CartItem cartItem) {
			Session session=sessionFactory.getCurrentSession();
			session.save(cartItem);//insert into cartItem...
		}
		public User getUser(String email) {
			Session session=sessionFactory.getCurrentSession();
			User user=(User)session.get(User.class, email);
			return user;
		}
		public List<CartItem> getCartItems(String email) {
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from CartItem where user.email=:email");
			query.setString("email", email);
			List<CartItem> cartItems=query.list();
			return cartItems;
			
		}
		public void updateCartItem(int cartItemId, int requestedQuantity) {
			
			  Session session=sessionFactory.getCurrentSession();
			  CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
			  cartItem.setQuantity(requestedQuantity);
			  cartItem.setTotalPrice(requestedQuantity * cartItem.getProduct().getPrice());
			  session.update(cartItem);
		}
		public void removeCartItem(int cartItemId) {
			Session session=sessionFactory.getCurrentSession();
			CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
			session.delete(cartItem);
			
		}
/*
		public void removeProduct(Product product) {
			Session session=sessionFactory.getCurrentSession();
			CartItem cartItem=(CartItem)session.get(CartItem.class, product.getId());
			//CartItem cartItem=new CartItem();
			//cartItem.setProduct(product);
			session.delete(cartItem);
		}
*/
		public CustomerOrder createCustomerOrder(CustomerOrder customerOrder) {
			Session session=sessionFactory.getCurrentSession();
			session.save(customerOrder);
			return customerOrder;
		}
		 public List<CustomerOrder> getHistory(String email)
		 {
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("from CustomerOrder where user.email=:email");
			query.setString("email", email);
			List<CustomerOrder> customerOrder=query.list();
			return customerOrder;
		 }


}
