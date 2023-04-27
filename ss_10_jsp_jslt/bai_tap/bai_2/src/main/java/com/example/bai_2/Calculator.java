package com.example.bai_2;

public class Calculator {
    public static float calculate(float firstOperand, float secondOperand, String operator ){
        float result=0f;
        switch (operator){
            case "add":
                result= firstOperand + secondOperand;
                break;
            case "sub":
                result= firstOperand - secondOperand;
                break;
            case "multi":
                result= firstOperand * secondOperand;
                break;
            case "div":
                if(secondOperand != 0) {
                    result= firstOperand / secondOperand;
                }else {
                    throw new RuntimeException("Lỗi không thể chia cho 0");
                }
                break;
        }
        return result;
    }
}
