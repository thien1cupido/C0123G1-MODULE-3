package com.example.bai_1;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SumServlet", value = "/display-discount")
public class ProductDiscountCalculator extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name =request.getParameter("ten-san-pham");
        String color =request.getParameter("mau");
        String result="";
        switch (color){
            case "vang":
                result="Vàng";
                break;
            case "do":
                result="Đỏ";
                break;
            case "xanh":
                result="Xanh";
                break;
        }
        System.out.println(result);
        int listPrice=Integer.parseInt(request.getParameter("list-price"));
        int discountPercent=Integer.parseInt(request.getParameter("discount-percent"));
        float discountAmount = listPrice*discountPercent*0.01f;
        float discountPrice =listPrice-discountAmount;
        request.setAttribute("ten",name);
        request.setAttribute("mauSac",result);
        request.setAttribute("luong",discountAmount);
        request.setAttribute("gia",discountPrice);
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("display-discount.jsp");
        requestDispatcher.forward(request,response);
    }
}
