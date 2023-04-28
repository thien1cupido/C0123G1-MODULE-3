package controller;

import model.Product;
import service.IProductService;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService iProductService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            }
            case "delete":
                delectProduct(request, response);
                break;
            case "update":
                extracted(request, response);
                break;
            case "find":
                searchProduct(request,response);
                break;
            default: {
                showList(request, response);
            }
        }
    }

    private void extracted(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = iProductService.getProduct(id);
        request.setAttribute("product", product);
        request.getRequestDispatcher("/update.jsp").forward(request, response);
    }


    public void showList(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "update":
                updateProduct(request, response);
                break;
            default: {
                showList(request, response);
            }
        }
    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        byte[] bytes = description.getBytes(StandardCharsets.ISO_8859_1);
        description = new String(bytes, StandardCharsets.UTF_8);
        String manufacturer = request.getParameter("manufacturer");
        iProductService.saveProduct(new Product(id, name, price, description, manufacturer));
        response.sendRedirect("/product");
    }

    public void delectProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        iProductService.deleteProduct(id);
        response.sendRedirect("/product");
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        byte[] bytes = description.getBytes(StandardCharsets.ISO_8859_1);
        description = new String(bytes, StandardCharsets.UTF_8);
        String manufacturer = request.getParameter("manufacturer");
        iProductService.updateProduct(new Product(id, name, price, description, manufacturer));
        response.sendRedirect("/product");
    }
    public void searchProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("search");
        List<Product> productList= iProductService.searchProduct(name);
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("/find").forward(request,response);
    }
}
