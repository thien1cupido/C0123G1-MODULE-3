package respository;

import model.Product;

import java.util.List;

public interface IRespositoryProduct {
    List<Product> getAll();

    void saveProduct(Product product);

    void delete(int id);

}
