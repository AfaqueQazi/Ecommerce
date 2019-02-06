package com.niit.dao;

import java.util.List;

import com.niit.models.Category;
import com.niit.models.Product;

public interface ProductDao {
void saveOrUpdate(Product product);//if product.id==0, then it will insert,if product.id!=0,if id exists in the table, then it will update
Product getProduct(int id);
void deleteProduct(int id);
List<Product> getAllProducts();
List<Category> getAllCategories();
public void addCategory(Category category);
public void deleteCategory(int id);
}