package com.ute.newspaper.controllers;

import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "authServlet", value = "/auth/*")
public class AuthController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/login";
        }

        switch (path) {
            case "/signup":
                ServletUtils.forward("/vwAuth/signup.jsp", req, resp);
                break;

            case "/login":
//                HttpSession session = req.getSession();
//                if ((boolean) session.getAttribute("auth")) {
//                    ServletUtils.redirect("/Home", req, resp);
//                } else ServletUtils.forward("/vwAuth/login.jsp", req, resp);
                ServletUtils.forward("/vwAuth/login.jsp", req, resp);
                break;

            default:
                ServletUtils.forward("404.jsp", req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        switch (path) {
            case "/signup":
                signup(req, resp);
                break;

            case "/login":
                login(req, resp);
                break;

            case "/logout":
                logout(req, resp);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", req, resp);
                break;
        }

    }

    private void signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
