package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> selectAllProduct();
    Product selectProduct(int id);
    void insertProduct(Product product);
    boolean deleteProduct(int id);
    boolean updateProduct(Product product);
    List<Product> searchByName(String keyName, String keyAddress);
}
