package com.ute.newspaper.controllers;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.Article_CateDao;
import com.ute.newspaper.dao.CategoryDao;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.*;
import com.ute.newspaper.model.UserComment;
import com.ute.newspaper.services.ArticleService;
import com.ute.newspaper.services.CommentService;
import com.ute.newspaper.services.UserCommentService;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "mainServlet", value = "/main/*")
public class MainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }

        switch (path) {
            case "/index":
                list(req, resp);
                break;

            case "/view":
                view(req, resp);
                break;
            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Article> articles = ArticleDao.findAll();
        List<Article> newest = newest();
        List<Article> outstanding = outstanding();
        List<Article> mostView = mostView();
        List<Article> top = top();
        List<Article_Category> articleCategories = articleCategories();
        List<Comment> comments = comments();
        req.setAttribute("articles", articles);
        req.setAttribute("newest", newest);
        req.setAttribute("outstanding", outstanding);
        req.setAttribute("mostView", mostView);
        req.setAttribute("top", top);
        req.setAttribute("articleCategories", articleCategories);
        req.setAttribute("comments", comments);
        ServletUtils.forward("/vwMain/pages/index.jsp", req, resp);
    }

    private void view(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Article article = ArticleService.findByID(id);
        if (article == null) {
            ServletUtils.redirect("/404.jsp", req, resp);
        } else {
            List<Article_Category> articleCategories = articleCategories();
            List<UserComment> userComments = UserComment(id);
            List<Article> hint = hint();//hint
            req.setAttribute("article", article);
            req.setAttribute("articleCategories", articleCategories);
            req.setAttribute("userComments", userComments);
            req.setAttribute("hint", hint);
            ServletUtils.forward("/vwMain/pages/view.jsp", req, resp);
        }
    }

    private List<Article> getAll() {
        return ArticleDao.findAll();
    }

    //    10 bài viết mới nhất
    private List<Article> newest() {
        List<Article> articles = getAll();
        articles = articles.stream()
                .sorted(Comparator.comparing(Article::getCreateDate).reversed())
                .collect(Collectors.toList());

        return articles.subList(0,9);
    }

    //  3-4 bài viết nổi bật nhất trong tuần qua
    private List<Article> outstanding() {
        List<Article> articles = getAll();
        articles = articles.stream()
                .sorted(Comparator.comparing(Article::getView).reversed())
                .collect(Collectors.toList());

        return articles.subList(0,4);
    }

    //  10 bài viết được xem nhiều nhất
    private List<Article> mostView() {
        List<Article> articles = getAll();
        articles = articles.stream()
                .sorted(Comparator.comparing(Article::getView).reversed())
                .collect(Collectors.toList());

        return articles.subList(0,10);
    }

    //  top 10 chuyên mục, mỗi chuyên mục 1 bài mới nhất
    private List<Article> top() {
        List<Article> articles = getAll();

        return articles;
    }

    //  3-4 bài viết nổi bật nhất trong tuần qua
    private List<Article> hint() {
        List<Article> articles = getAll();
        articles = articles.stream()
                .sorted(Comparator.comparing(Article::getView).reversed())
                .collect(Collectors.toList());

        return articles.subList(0,4);
    }

    private List<Article_Category> articleCategories() {
        return Article_CateDao.findAll();
    }

    private List<Comment> comments() {
        return CommentService.findAll();
    }

    private List<UserComment> UserComment(int id){
        return UserCommentService.getUserComments(id);
    }
}

