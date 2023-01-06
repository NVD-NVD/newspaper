package com.ute.newspaper.controllers;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.services.ArticleService;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "writerServlet", value = "/writer/*")
public class WriterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/list";
        }

        switch (path) {
            case "/list":
                List<Article> articles = ArticleDao.findAll();
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("authUser");
                System.out.println("authorID: " + user.getId());
//                List<Article> articles = ArticleService.findAllByUserID(user.getId());

                req.setAttribute("articles", articles);
                ServletUtils.forward("/vwWriter/pages/list.jsp", req, resp);
                break;

            case "/add":
                ServletUtils.forward("/vwWriter/pages/add.jsp", req, resp);
                break;

            case "/waiting":
                break;

            case "/denied":
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
