package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteUser(request, response);
                break;
            case "edit":
                sendUser(request,response);
                break;
            case "search":
                searchUser(request,response);
                break;
            case "sort":
                sortUser(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                creatUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
        }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = iUserService.getAllUsers();
        if (userList == null) {
            try {
                request.getRequestDispatcher("/error.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("userList", userList);
            try {
                request.getRequestDispatcher("/list.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void creatUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        boolean check = iUserService.saveUser(new User(name, email, country));
        String message = "";
        if (check) {
            message = "Thêm thành công";
        } else {
            message = "Thêm thất bại";
        }
        request.setAttribute("message", message);
        try {
            request.getRequestDispatcher("/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iUserService.deleteUser(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public void sendUser(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        User user= iUserService.selectUser(id);
        try {
            request.setAttribute("user",user);
            request.getRequestDispatcher("/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        boolean check = iUserService.editUser(new User(id,name,email,country));
        String message = "";
        if (check) {
            message = "Sửa thành công";
        } else {
            message = "Sửa thất bại";
        }
        request.setAttribute("message", message);
        try {
            request.getRequestDispatcher("/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void searchUser(HttpServletRequest request,HttpServletResponse response){
        String name = request.getParameter("search");
        List<User> userList= iUserService.search(name);
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void sortUser(HttpServletRequest request,HttpServletResponse response){
        List<User> userList= iUserService.sortUser();
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}