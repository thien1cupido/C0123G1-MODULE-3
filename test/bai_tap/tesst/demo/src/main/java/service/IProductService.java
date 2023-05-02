package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();

    void saveProduct(Product product);

    void deleteProduct(int id);

    void updateProduct(Product product);

    Product getProduct(int id);

    List<Product> searchProduct(String name);
}
