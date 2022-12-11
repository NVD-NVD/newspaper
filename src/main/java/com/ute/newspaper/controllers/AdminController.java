package com.ute.newspaper.controllers;

import com.ute.newspaper.beans.User;
import com.ute.newspaper.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "admin", value = "admin")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        resp.setContentType("text/html");

        switch (path) {
            case "/Index":
                User user = new User();
                user.setUsername("admin");
                user.setPassword("12345678");
                user.setName("admin");
                user.setEmail("admin@gmail.com");
                user.setBirthday(new Date());
                user.setPenname("zero");
                user.setCreateDate(new Date());
                user.setUpdateDate(new Date());
                user.setExpr(null);
                user.setPermission("admin");
                user.setEnable(true);

                UserDAO userDAO = new UserDAO();
                userDAO.add(user);
                userDAO.add(user);
                userDAO.add(user);
                List<User> users = userDAO.findAll();
                String mess = String.valueOf(users.size());
                users.forEach(e -> System.out.printf(e.toString()));

                // Hello
                PrintWriter out = resp.getWriter();
                out.println("<html><body>");
                out.println("<h1>" + mess + "</h1>");
                out.println("</body></html>");
                break;

            default:
                RequestDispatcher rd = req.getRequestDispatcher("/views/404.jsp");
                rd.forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
