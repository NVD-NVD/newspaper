package com.ute.newspaper.controllers;

import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "adminServlet", value = "/admin/*")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }

        switch (path) {
            case "/index":
                ServletUtils.forward("/admin-page/pages/index.jsp", req, resp);
                break;

            case "about":
                break;
            default:
                ServletUtils.forward("/index.jsp", req, resp);
                break;
        }
    }

}
