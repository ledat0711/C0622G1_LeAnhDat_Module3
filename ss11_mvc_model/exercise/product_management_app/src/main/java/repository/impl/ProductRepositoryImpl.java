package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements IProductRepository {
    private static final List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "But do", 5, "But do danh dau", "Hang A"));
        productList.add(new Product(2, "But xanh", 6, "But xanh ghi bai", "Hang B"));
        productList.add(new Product(3, "But tim", 7, "But tim ghi bai", "Hang C"));
        productList.add(new Product(4, "But den", 8, "But den ghi bai", "Hang D"));
        productList.add(new Product(5, "But xoa", 9, "But xoa sua loi", "Hang E"));
        productList.add(new Product(6, "But chi Mitsu", 10, "But chi tot", "Hang Mitsu"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void update(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public Product productDetail(int id) {
        for (int i = 0; i < productList.size() ; i++) {
            if(productList.get(i).getId()==id){
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> products = new ArrayList<>();
        for (int i = 0; i <productList.size() ; i++) {
            if(productList.get(i).getName().contains(name)){
                products.add(productList.get(i));
            }
        }
        return products;
    }
}
