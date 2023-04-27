package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList=new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/03/Hinh-chan-dung-nam.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://haycafe.vn/wp-content/uploads/2022/03/Anh-chan-dung-cho-nam-gioi-dep.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://haycafe.vn/wp-content/uploads/2022/03/Anh-chan-dung-nghe-thuat-nam.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://haycafe.vn/wp-content/uploads/2022/03/Anh-chan-dung-nam-chuyen-nghiep.jpeg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/03/Ve-anh-chan-dung.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
