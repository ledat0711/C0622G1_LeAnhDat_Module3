package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update( Product product) {
        productRepository.update(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public Product productDetail(int id) {
        return productRepository.productDetail(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }
}
