package com.example.bai_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int firstNumber=Integer.parseInt(request.getParameter("number1"));
        int secondNumber=Integer.parseInt(request.getParameter("number2"));
        String operator = request.getParameter("calculation");
        float result = Calculator.calculate(firstNumber,secondNumber,operator);
        String responseOperator="";
        switch (operator){
            case "add":
                responseOperator="+";
                break;
            case "sub":
                responseOperator="-";
                break;
            case "multi":
                responseOperator="*";
                break;
            case "div":
                responseOperator="/";
                break;
        }
        request.setAttribute("firstNumber",firstNumber);
        request.setAttribute("operator",responseOperator);
        request.setAttribute("secondNumber",secondNumber);
        request.setAttribute("result",result);
        request.getRequestDispatcher("/calculate.jsp").forward(request,response);
    }
}
