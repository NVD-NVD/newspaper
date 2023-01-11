package com.ute.newspaper.controllers;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.services.ArticleService;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "writerServlet", value = "/writer/*")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*50,      	// 50 MB
        maxRequestSize=1024*1024*100)   	// 100 MB
public class WriterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/list";
        }

        switch (path) {
            case "/list":
//                List<Article> articles = ArticleDao.findAll();
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("authUser");
                List<Article> articles = ArticleService.findAllByUserID(user.getId());
                if (articles == null)
                    req.setAttribute("articles", null);
                else
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
        String path = req.getPathInfo();
        switch (path) {
            case "/add":
                add("/writer/list", req, resp);
                break;

            case "/edit":
                ServletUtils.redirect("/writer/list", req, resp);
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    private void add(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArticleService.add(req, resp);
        ServletUtils.redirect(url, req, resp);
    }

    private void edit(String url, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("TinyDes");
        System.out.println("Add new:" + title);
        ServletUtils.redirect(url, req, resp);
    }
}
