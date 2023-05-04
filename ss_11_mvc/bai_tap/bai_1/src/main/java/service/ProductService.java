package service;

import model.Product;
import respository.IProductRespository;
import respository.ProductRespository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRespository iProductRespository = new ProductRespository();
    @Override
    public List<Product> getAll() {
        List<Product>productList =iProductRespository.getAll();
        if (productList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        iProductRespository.saveProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRespository.delete(id);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRespository.delete(product.getId());
        iProductRespository.saveProduct(product);
    }

    @Override
    public Product getProduct(int id) {
        List<Product> productList = iProductRespository.getAll();
        Product product=null;
        for (int i = 0; i < productList.size(); i++) {
            if (id==productList.get(i).getId()){
                product = productList.get(i);
            }
        }
        return product;
    }

    @Override
    public List<Product> searchProduct(String name) {
        List<Product>productList=iProductRespository.getAll();
        for (int i = 0; i < productList.size(); i++) {
            if (name.equals(productList.get(i).getName())){
                productList.add(productList.get(i));
            }
        }
        return productList;
    }
}
