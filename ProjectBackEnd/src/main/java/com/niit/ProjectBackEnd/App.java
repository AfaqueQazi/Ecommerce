package com.niit.ProjectBackEnd;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.configuration.DBConfiguration;
import com.niit.dao.ProductDao;
import com.niit.dao.ProductDaoImpl;
import com.niit.models.Product;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        
        //CREATE SPRING CONTAINER , CONFIGURATION DETAILS TO THE CONTAINER
        ApplicationContext context=
      new AnnotationConfigApplicationContext(DBConfiguration.class,ProductDaoImpl.class);
      ProductDao productDao=(ProductDao)context.getBean("productDaoImpl");
///////////////////////////////////////////////////////////////////////////    

//Product product=new Product();
//product.setProductname("asbh");
//product.setDescription("ewfcd");
//product.setPrice(30);
//product.setQuantity(200);
//productDao.addProduct(product);

/////////////////////////////////////////////////////////////////////////
      
//Product product=productDao.getProduct(5);
//System.out.println(product);
//if(product!=null){
//System.out.println(product.getId());
//System.out.println(product.getProductname());
//System.out.println(product.getDescription());
//System.out.println(product.getPrice());
//System.out.println(product.getQuantity());
//}else{
//  System.out.println("Product id  not found");
//}
      
///////////////////////////////////////////////////////////////////////
      
//Product product=productDao.getProduct(2);
//product.setQuantity(10);
//productDao.updateProduct(product);
//System.out.println("After Update");
//if(product!=null){
//  System.out.println(product.getId());
//  System.out.println(product.getProductname());
//  System.out.println(product.getDescription());
//  System.out.println(product.getPrice());
//  System.out.println(product.getQuantity());
//  }
////
//////////////////////////////////////delete      
//    productDao.deleteProduct(2);
/////////////////////////////////////getall
List<Product> products=productDao.getAllProducts();
System.out.println(products);
System.out.println(products.size());
    }
}