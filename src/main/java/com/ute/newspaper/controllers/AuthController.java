package com.ute.newspaper.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
                HttpSession session = req.getSession();
                if ((boolean) session.getAttribute("auth")) {
                    User user = (User) session.getAttribute("authUser");
                    if (user.getPermission().equals("admin"))
                        ServletUtils.redirect("/admin", req, resp);
                    if  (user.getPermission().equals("writer"))
                        ServletUtils.redirect("/writer", req, resp);
                    if  (user.getPermission().equals("editer"))
                        ServletUtils.redirect("/editer", req, resp);

                    ServletUtils.redirect("/index.jsp", req, resp);
                } else ServletUtils.forward("/vwAuth/login.jsp", req, resp);
                ServletUtils.forward("/vwAuth/login.jsp", req, resp);
                break;

            case "/logout":
                logout(req, resp);
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
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
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }

    }

    private void signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        checked(req, resp);

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String birthdayDD = req.getParameter("birthdayDD");
        String birthdayMM = req.getParameter("birthdayMM");
        String birthdayYYYY = req.getParameter("birthdayYYYY");
        String accountType = req.getParameter("accountType");
        String penname = req.getParameter("penname");

        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        String strDob = birthdayDD + "/" + birthdayMM + "/" + birthdayYYYY + " 00:00";
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        LocalDateTime dob = LocalDateTime.parse(strDob, df);

        String permission = accountType;
        User user = new User(username, bcryptHashString, name, email, dob, permission);
        LocalDateTime dateTime = LocalDateTime.now();
        user.setCreateDate(dateTime);
        user.setUpdateDate(dateTime);
        user.setEnable(true);
        if (accountType.equals("writer")){
            user.setPenname(penname);
            user.setEnable(false);
        }
        UserDAO.add(user);
        ServletUtils.forward("/vwAuth/login.jsp", req, resp);
    }
    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String stayinhere = req.getParameter("stayinhere");

        User user = UserDAO.findByUsername(username);
        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if (result.verified) {
                HttpSession session = req.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));
                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/index.jsp";

                if (user.getPermission().equals("admin")){
                    url = "/admin";
                }
                if (user.getPermission().equals("writer")){
                    url = "/writer";
                }
                if (user.getPermission().equals("reader")){
                    url = "/reader";
                }
                if (user.getPermission().equals("editor")){
                    url = "/editor";
                }
                if (user.getPermission().equals("user")){
                    url = "/user";
                }
                ServletUtils.redirect(url, req, resp);
            } else {
                req.setAttribute("hasError", true);
                req.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/vwAuth/login.jsp", req, resp);
            }
        } else {
            req.setAttribute("hasError", true);
            req.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/vwAuth/login.jsp", req, resp);
        }
    }
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("auth", false);
        session.setAttribute("authUser", new User());

        String url = "/main/";
        ServletUtils.redirect(url, req, resp);
    }

    private void checked(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        if (UserDAO.findByUsername(username) != null){
            req.setAttribute("hasError", true);
            req.setAttribute("errorMessage", "Username already exists.");
            ServletUtils.forward("/vwAuth/signup.jsp", req, resp);
        }
        if (UserDAO.findByEmail(email) != null){
            req.setAttribute("hasError", true);
            req.setAttribute("errorMessage", "Email already exists.");
            ServletUtils.forward("/vwAuth/signup.jsp", req, resp);
        }
    }
}
