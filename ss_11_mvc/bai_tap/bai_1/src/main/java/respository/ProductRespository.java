package respository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRespository implements IProductRespository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone 6", 500, "cũ", "apple"));
        productList.add(new Product(2, "Iphone 7", 800, "cũ", "apple"));
        productList.add(new Product(3, "Oppo Neo 9", 800, "mới", "oppo"));
        productList.add(new Product(4, "Iphone 10", 1200, "cũ", "apple"));
        productList.add(new Product(5, "Samsung J7", 1000, "mới", "samsung"));
        productList.add(new Product(6, "Iphone 12", 1500, "mới", "apple"));
        productList.add(new Product(7, "Iphone 8", 900, "cũ", "apple"));
        productList.add(new Product(8, "Redmi Note 10 Pro ", 1000, "mới", "xiao mi"));
        productList.add(new Product(9, "Samsung Galaxy Note 20 Ultra", 2500, "mới", "apple"));
        productList.add(new Product(10, "Iphone 14", 3000, "mới", "samsung"));
        productList.add(new Product(11, "Samsung J5 ", 700, "mới", "samsung"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.remove(i);
                break;
            }
        }
    }
}