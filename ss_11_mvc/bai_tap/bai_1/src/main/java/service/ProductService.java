package service;

import model.Product;
import respository.IRespositoryProduct;
import respository.RespositoryProduct;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private IRespositoryProduct iRespositoryProduct = new RespositoryProduct();
    private List<Product> productList = iRespositoryProduct.getAll();
    @Override
    public List<Product> getAll() {
        if (productList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        iRespositoryProduct.saveProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iRespositoryProduct.delete(id);
    }

    @Override
    public void updateProduct(Product product) {
        iRespositoryProduct.delete(product.getId());
        iRespositoryProduct.saveProduct(product);
    }

    @Override
    public Product getProduct(int id) {
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
        List<Product>productList1=new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (name.equals(productList.get(i).getName())){
                productList1.add(productList.get(i));
            }
        }
        return productList1;
    }
}
