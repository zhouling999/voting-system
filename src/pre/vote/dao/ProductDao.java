package pre.vote.dao;

import java.util.List;

import pre.vote.model.Product;

public interface ProductDao {
 public boolean saveProduct(Product product);
 public List<Product> findAll();
}
