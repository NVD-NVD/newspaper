package com.ute.newspaper.controllers;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.CategoryDao;
import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Category;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin/tag/*")
public class AdminTagController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/add";
        }

        switch (path) {
            case "/add":
                add(req, resp);
                break;

            case "/edit":
                edit(req, resp);
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
                add(req, resp);
                break;

            case "/edit":
                edit(req, resp);
                break;
            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        Tag tag = new Tag();
        tag.setTitle(title);
        LocalDateTime dateTime = LocalDateTime.now();
        tag.setCreateDate(dateTime);
        tag.setUpdateDate(dateTime);
        tag.setEnable(true);
        TagDao.add(tag);
        ServletUtils.redirect("/admin/managerTag", req, resp);
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
